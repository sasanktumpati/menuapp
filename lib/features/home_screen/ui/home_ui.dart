import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/logger/log_tags.dart';
import '../../../utils/logger/logger.dart';
import '../data/get_menu/api/fetch_menu.dart';
import '../data/get_menu/api/response_model/response_model.dart';

final menuProvider = FutureProvider<List<MenuResponseModel>>((ref) async {
  final menuService = MenuService();
  final result = await menuService.fetchMenu();

  return result.fold(
    (failure) {
      debugLog(LogTags.exception, 'Error fetching menu: ${failure.message}');
      throw Exception(failure.message);
    },
    (menuList) {
      return menuList;
    },
  );
});

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  int selectedIndex = 0;
  late PageController _pageController;
  late ScrollController _dayScrollController;
  bool _initialPageSet = false;
  bool _isPageAnimating = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
    _dayScrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final menuAsyncValue = ref.watch(menuProvider);

    return menuAsyncValue.when(
      data: (menuList) {
        int todayIndex = _getTodayIndex(menuList);
        if (todayIndex != -1 && !_initialPageSet) {
          _initialPageSet = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              selectedIndex = todayIndex;
              _pageController.jumpToPage(todayIndex);
              _scrollToSelectedDay();
            });
          });
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Weekly Menu',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                )),
            centerTitle: true,
          ),
          body: Column(
            children: [
              _buildDaySelector(menuList),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: menuList.length,
                  onPageChanged: (index) {
                    if (!_isPageAnimating) {
                      setState(() {
                        selectedIndex = index;
                        _scrollToSelectedDay();
                      });
                    }
                  },
                  itemBuilder: (context, index) {
                    return _buildMenuContent(menuList[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(
          title: Text('Weekly Menu',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
        ),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(
          title: Text('Weekly Menu', style: GoogleFonts.poppins()),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Error: $error', style: GoogleFonts.poppins()),
        ),
      ),
    );
  }

  Widget _buildDaySelector(List<MenuResponseModel> menuList) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        controller: _dayScrollController,
        scrollDirection: Axis.horizontal,
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          final menu = menuList[index];
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              if (selectedIndex == index) return;
              setState(() {
                selectedIndex = index;
                _isPageAnimating = true;
                _scrollToSelectedDay();
              });
              final previousIndex = _pageController.page!.round();
              final distance = (index - previousIndex).abs();
              int durationMs = (100 + (100 * distance));
              if (durationMs > 600) durationMs = 600;
              final duration = Duration(milliseconds: durationMs);
              _pageController
                  .animateToPage(
                index,
                duration: duration,
                curve: Curves.easeInOut,
              )
                  .then((_) {
                _isPageAnimating = false;
              });
            },
            child: Container(
              width: 100,
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: isSelected ? Colors.orangeAccent : Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.orangeAccent.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  menu.day ?? 'Unknown',
                  style: GoogleFonts.poppins(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _scrollToSelectedDay() {
    final double screenWidth = MediaQuery.of(context).size.width;
    const double itemWidth = 100.0;
    const double itemMargin = 16.0;
    final double scrollPosition =
        (selectedIndex * (itemWidth + (itemMargin / 2))) -
            (screenWidth / 2) +
            (itemWidth / 2);
    _dayScrollController.animateTo(
      scrollPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  int _getTodayIndex(List<MenuResponseModel> menuList) {
    DateTime nowUtc = DateTime.now().toUtc();
    DateTime nowIst = nowUtc.add(const Duration(hours: 5, minutes: 30));

    for (int i = 0; i < menuList.length; i++) {
      final menuDate = menuList[i].date;
      if (menuDate != null &&
          menuDate.year == nowIst.year &&
          menuDate.month == nowIst.month &&
          menuDate.day == nowIst.day) {
        return i;
      }
    }
    return -1;
  }

  Widget _buildMenuContent(MenuResponseModel menu) {
    DateTime nowUtc = DateTime.now().toUtc();
    DateTime nowIst = nowUtc.add(const Duration(hours: 5, minutes: 30));

    String currentMeal = _getCurrentMeal(nowIst, menu.date ?? nowIst);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${menu.day ?? 'Unknown Day'}, ${menu.date != null ? '${menu.date!.day}/${menu.date!.month}/${menu.date!.year}' : 'Unknown Date'}',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildMealSection('Breakfast', menu.breakfast,
              isCurrentMeal: currentMeal == 'Breakfast'),
          _buildMealSection('Lunch', menu.lunch,
              isCurrentMeal: currentMeal == 'Lunch'),
          _buildMealSection('Dinner', menu.dinner,
              isCurrentMeal: currentMeal == 'Dinner'),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _buildMealSection(String mealType, List<String>? items,
      {bool isCurrentMeal = false}) {
    final mealTimings = _getMealTimingsForType(mealType);
    bool hasData = items != null && items.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: isCurrentMeal ? 8.0 : 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(
                mealType == 'Breakfast'
                    ? Icons.free_breakfast
                    : mealType == 'Lunch'
                        ? Icons.lunch_dining
                        : Icons.dinner_dining,
                color: Colors.orangeAccent,
                size: 30,
              ),
              title: Text(
                mealType,
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              subtitle: Text(
                mealTimings,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const Divider(),
            hasData
                ? Column(
                    children: items.map((item) {
                      return ListTile(
                        leading: const Icon(Icons.restaurant_menu),
                        title: Text(item,
                            style: GoogleFonts.poppins(fontSize: 18)),
                      );
                    }).toList(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Data not available',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  String _getCurrentMeal(DateTime nowIst, DateTime menuDate) {
    bool isSunday = menuDate.weekday == DateTime.sunday;

    final mealTimings = isSunday
        ? [
            {
              'meal': 'Breakfast',
              'start':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 8, 0),
              'end':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 10, 0),
            },
            {
              'meal': 'Lunch',
              'start':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 12, 0),
              'end':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 14, 0),
            },
            {
              'meal': 'Dinner',
              'start':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 19, 0),
              'end':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 20, 45),
            },
          ]
        : [
            {
              'meal': 'Breakfast',
              'start':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 7, 30),
              'end':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 9, 45),
            },
            {
              'meal': 'Lunch',
              'start':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 11, 30),
              'end':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 13, 45),
            },
            {
              'meal': 'Dinner',
              'start':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 19, 0),
              'end':
                  DateTime(menuDate.year, menuDate.month, menuDate.day, 20, 45),
            },
          ];

    for (var meal in mealTimings) {
      DateTime startTime = meal['start'] as DateTime;
      DateTime endTime = meal['end'] as DateTime;
      String mealType = meal['meal'] as String;

      if (nowIst.isAfter(startTime) && nowIst.isBefore(endTime)) {
        return mealType;
      }
    }

    return 'No Meal';
  }

  String _getMealTimingsForType(String mealType) {
    DateTime menuDate = ref.read(menuProvider).when(
          data: (menuList) => menuList[selectedIndex].date ?? DateTime.now(),
          loading: () => DateTime.now(),
          error: (_, __) => DateTime.now(),
        );

    bool isSunday = menuDate.weekday == DateTime.sunday;

    if (isSunday) {
      switch (mealType) {
        case 'Breakfast':
          return '8:00 AM - 10:00 AM';
        case 'Lunch':
          return '12:00 PM - 2:00 PM';
        case 'Dinner':
          return '7:00 PM - 8:45 PM';
        default:
          return '';
      }
    } else {
      switch (mealType) {
        case 'Breakfast':
          return '7:30 AM - 9:45 AM';
        case 'Lunch':
          return '11:30 AM - 1:45 PM';
        case 'Dinner':
          return '7:00 PM - 8:45 PM';
        default:
          return '';
      }
    }
  }
}
