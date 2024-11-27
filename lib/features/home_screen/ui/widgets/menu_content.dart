import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/fetch_menu.dart';
import '../../data/models/meal_timings.dart';
import '../../data/models/response_model.dart';
import '../../utils/timing_utils.dart';
import 'animated_meal_card.dart';
import 'meal_details_view.dart';

class MenuContent extends ConsumerWidget {
  final List<MenuResponseModel> menuList;

  const MenuContent({super.key, required this.menuList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (menuList.isEmpty) {
      return const SliverFillRemaining(
        child: Center(
          child: Text('No menu data available'),
        ),
      );
    }

    final filteredMenuList = _filterCurrentAndFutureDays(menuList);

    if (filteredMenuList.isEmpty) {
      return const SliverFillRemaining(
        child: Center(child: Text('No upcoming menus available')),
      );
    }

    final todayMenu = _getTodayOrNextMenu();

    return SliverList(
      delegate: SliverChildListDelegate([
        if (todayMenu != null) _buildCurrentMealCard(context, ref),
        ...List.generate(filteredMenuList.length, (index) {
          final menu = filteredMenuList[index];
          return AnimatedMealCard(
            menu: menu,
            menuList: filteredMenuList,
            onTap: () => _showMealDetails(context, menu),
          );
        }),
        const SizedBox(height: 80),
      ]),
    );
  }

  List<MenuResponseModel> _filterCurrentAndFutureDays(
      List<MenuResponseModel> menus) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final filteredMenus = menus.where((menu) {
      if (menu.date == null) return false;
      final menuDate =
          DateTime(menu.date!.year, menu.date!.month, menu.date!.day);
      return !menuDate.isBefore(today);
    }).toList();

    filteredMenus.sort((a, b) => a.date!.compareTo(b.date!));

    if (filteredMenus.isEmpty && menus.isNotEmpty) {
      return [menus.last];
    }

    return filteredMenus;
  }

  MenuResponseModel _getTodayOrNextMenu() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final todayMenu = menuList.firstWhere(
      (menu) {
        if (menu.date == null) return false;
        final menuDate =
            DateTime(menu.date!.year, menu.date!.month, menu.date!.day);
        return menuDate.isAtSameMomentAs(today);
      },
      orElse: () => menuList.firstWhere(
        (menu) => menu.date != null && !menu.date!.isBefore(today),
        orElse: () => menuList.first,
      ),
    );

    return todayMenu;
  }

  Widget _buildCurrentMealCard(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final todayMenu = menuList.firstWhere(
      (menu) {
        if (menu.date == null) return false;
        final menuDate =
            DateTime(menu.date!.year, menu.date!.month, menu.date!.day);
        return menuDate.isAtSameMomentAs(today);
      },
      orElse: () => menuList.firstWhere(
        (menu) => menu.date != null && !menu.date!.isBefore(today),
        orElse: () => menuList.first,
      ),
    );

    final timingConfig = ref.watch(fetchMenuServiceProvider).timingConfig;
    if (timingConfig == null) return const SizedBox.shrink();

    final dayTimings = TimingUtils.getTimingsForDate(timingConfig, now);
    final currentMealTiming = TimingUtils.getCurrentMealTiming(dayTimings, now);
    final nextMealInfo =
        _getNextMealInfo(todayMenu, dayTimings, currentMealTiming, ref);

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: _buildStatusIcon(nextMealInfo.isCurrentMeal),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    nextMealInfo.isCurrentMeal ? 'Current Meal' : 'Next Meal',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Flexible(
                  child: Icon(
                    _getMealIcon(nextMealInfo.mealType),
                    size: 32,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    nextMealInfo.mealType,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            if (nextMealInfo.items.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: nextMealInfo.items
                      .map((item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Icon(Icons.restaurant_menu,
                                    size: 18, color: Colors.black),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    item,
                                    style: GoogleFonts.poppins(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                Flexible(
                  child: Icon(Icons.access_time,
                      size: 18, color: Colors.grey[600]),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    nextMealInfo.timing,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getMealIcon(String mealType) {
    switch (mealType) {
      case 'Breakfast':
        return Icons.free_breakfast;
      case 'Lunch':
        return Icons.lunch_dining;
      case 'Dinner':
        return Icons.dinner_dining;
      default:
        return Icons.restaurant;
    }
  }

  Widget _buildStatusIcon(bool isCurrentMeal) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isCurrentMeal
            ? Colors.green.withOpacity(0.1)
            : Colors.orange.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        isCurrentMeal ? Icons.radio_button_checked : Icons.schedule,
        color: isCurrentMeal ? Colors.green : Colors.orange,
        size: 20,
      ),
    );
  }

  NextMealInfo _getNextMealInfo(
    MenuResponseModel todayMenu,
    Timings dayTimings,
    MealType currentMeal,
    WidgetRef ref,
  ) {
    final now = DateTime.now();
    final hour = now.hour;
    final minute = now.minute;
    final currentTime = '$hour:$minute';

    if (TimingUtils.isTimeBefore(currentTime, dayTimings.breakfast.start)) {
      return NextMealInfo(
        mealType: 'Breakfast',
        items: todayMenu.breakfast ?? [],
        timing: TimingUtils.getMealTiming(dayTimings.breakfast),
        isCurrentMeal: false,
      );
    }

    if (TimingUtils.isTimeBetween(
      currentTime,
      dayTimings.breakfast.start,
      dayTimings.breakfast.end,
    )) {
      return NextMealInfo(
        mealType: 'Breakfast',
        items: todayMenu.breakfast ?? [],
        timing: TimingUtils.getMealTiming(dayTimings.breakfast),
        isCurrentMeal: true,
      );
    }

    if (TimingUtils.isTimeBefore(currentTime, dayTimings.lunch.start)) {
      return NextMealInfo(
        mealType: 'Lunch',
        items: todayMenu.lunch ?? [],
        timing: TimingUtils.getMealTiming(dayTimings.lunch),
        isCurrentMeal: false,
      );
    }

    if (TimingUtils.isTimeBetween(
      currentTime,
      dayTimings.lunch.start,
      dayTimings.lunch.end,
    )) {
      return NextMealInfo(
        mealType: 'Lunch',
        items: todayMenu.lunch ?? [],
        timing: TimingUtils.getMealTiming(dayTimings.lunch),
        isCurrentMeal: true,
      );
    }

    if (TimingUtils.isTimeBefore(currentTime, dayTimings.dinner.start)) {
      return NextMealInfo(
        mealType: 'Dinner',
        items: todayMenu.dinner ?? [],
        timing: TimingUtils.getMealTiming(dayTimings.dinner),
        isCurrentMeal: false,
      );
    }

    if (TimingUtils.isTimeBetween(
      currentTime,
      dayTimings.dinner.start,
      dayTimings.dinner.end,
    )) {
      return NextMealInfo(
        mealType: 'Dinner',
        items: todayMenu.dinner ?? [],
        timing: TimingUtils.getMealTiming(dayTimings.dinner),
        isCurrentMeal: true,
      );
    }

    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final tomorrowMenu = menuList.firstWhere(
      (menu) {
        if (menu.date == null) return false;
        final menuDate =
            DateTime(menu.date!.year, menu.date!.month, menu.date!.day);
        final tomorrowDate =
            DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
        return menuDate.isAtSameMomentAs(tomorrowDate);
      },
      orElse: () => menuList.first,
    );

    final tomorrowTimings = TimingUtils.getTimingsForDate(
        ref.read(fetchMenuServiceProvider).timingConfig!, tomorrow);

    return NextMealInfo(
      mealType: 'Tomorrow\'s Breakfast',
      items: tomorrowMenu.breakfast ?? [],
      timing: TimingUtils.getMealTiming(tomorrowTimings.breakfast),
      isCurrentMeal: false,
    );
  }

  void _showMealDetails(BuildContext context, MenuResponseModel menu) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 0.95,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: MealDetailsView(menu: menu, controller: controller),
        ),
      ),
    );
  }
}

class NextMealInfo {
  final String mealType;
  final List<String> items;
  final String timing;
  final bool isCurrentMeal;

  NextMealInfo({
    required this.mealType,
    required this.items,
    required this.timing,
    required this.isCurrentMeal,
  });
}
