import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/fetch_menu.dart';
import 'widgets/menu_content.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  int selectedIndex = 0;
  late PageController _pageController;
  late ScrollController _dayScrollController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
    _dayScrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final menuState = ref.watch(fetchMenuServiceProvider);

    final menuList = menuState.menuList ?? [];

    return _buildScaffold(
      body: menuState.isLoading
          ? Center(child: CircularProgressIndicator())
          : menuState.hasError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          menuState.errorMessage.toString(),
                          style: GoogleFonts.poppins(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => ref.refresh(fetchMenuServiceProvider),
                        child: Text('Retry', style: GoogleFonts.poppins()),
                      ),
                    ],
                  ),
                )
              : MenuContent(
                  menuList: menuList,
                  selectedIndex: selectedIndex,
                  pageController: _pageController,
                  dayScrollController: _dayScrollController,
                  onDaySelected: (index) {
                    setState(() {
                      selectedIndex = index;
                      _scrollToSelectedDay();
                    });
                  },
                ),
    );
  }

  Widget _buildScaffold({required Widget body}) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Menu',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: body,
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
}
