import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/response_model.dart';
import 'day_selector.dart';
import 'meal_card.dart';

class MenuContent extends StatelessWidget {
  final List<MenuResponseModel> menuList;
  final int selectedIndex;
  final PageController pageController;
  final ScrollController dayScrollController;
  final ValueChanged<int> onDaySelected;

  const MenuContent({
    super.key,
    required this.menuList,
    required this.selectedIndex,
    required this.pageController,
    required this.dayScrollController,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DaySelector(
          menuList: menuList,
          selectedIndex: selectedIndex,
          dayScrollController: dayScrollController,
          onDaySelected: onDaySelected,
        ),
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: menuList.length,
            onPageChanged: onDaySelected,
            itemBuilder: (context, index) {
              return _buildMenuDay(menuList[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMenuDay(MenuResponseModel menu) {
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
          MealCard(
              mealType: 'Breakfast',
              items: menu.breakfast,
              isCurrentMeal: currentMeal == 'Breakfast'),
          MealCard(
              mealType: 'Lunch',
              items: menu.lunch,
              isCurrentMeal: currentMeal == 'Lunch'),
          MealCard(
              mealType: 'Dinner',
              items: menu.dinner,
              isCurrentMeal: currentMeal == 'Dinner'),
          const SizedBox(height: 15),
        ],
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
}
