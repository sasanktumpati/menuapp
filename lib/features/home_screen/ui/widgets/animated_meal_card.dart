import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/response_model.dart';

class AnimatedMealCard extends StatelessWidget {
  final MenuResponseModel menu;
  final List<MenuResponseModel> menuList;
  final VoidCallback onTap;

  const AnimatedMealCard({
    super.key,
    required this.menu,
    required this.menuList,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'meal-${menu.date}',
      child: Card(
        margin: EdgeInsets.all(16),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menu.day ?? 'Unknown',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _formatDate(menu.date),
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                      ],
                    ),
                    Flexible(child: _buildMealStatusIndicator()),
                  ],
                ),
                Divider(height: 32),
                _buildNextMealPreview(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Unknown Date';
    return '${date.day}/${date.month}/${date.year}';
  }

  Widget _buildMealStatusIndicator() {
    final currentTime = DateTime.now();
    final mealTime = _getCurrentMealTime(menu.date);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getMealStatusColor(mealTime),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        mealTime,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildNextMealPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Next Meal:',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        _buildNextMealItems(),
      ],
    );
  }

  Widget _buildNextMealItems() {
    final nextMeal = _getNextMeal();
    final items = _getMealItems(nextMeal);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nextMeal,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        if (items.isNotEmpty)
          Text(
            items.take(2).join(', ') + (items.length > 2 ? '...' : ''),
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
      ],
    );
  }

  String _getCurrentMealTime(DateTime? date) {
    if (date == null) return 'Time Unknown';
    final now = DateTime.now();
    if (date.day != now.day) return 'Upcoming';

    final hour = now.hour;
    if (hour >= 7 && hour < 10) return 'Breakfast Time';
    if (hour >= 11 && hour < 14) return 'Lunch Time';
    if (hour >= 19 && hour < 21) return 'Dinner Time';

    if (hour < 7) return 'Breakfast Soon';
    if (hour < 11) return 'Lunch Soon';
    if (hour < 19) return 'Dinner Soon';
    return 'Day End';
  }

  String _getNextMeal() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour < 7) return 'Breakfast';
    if (hour < 11) return 'Lunch';
    if (hour < 19) return 'Dinner';

    return 'Tomorrow\'s Breakfast';
  }

  List<String> _getMealItems(String mealType) {
    if (mealType == 'Tomorrow\'s Breakfast') {
      final now = DateTime.now();
      final tomorrowMenu =
          menu.date?.day == now.day ? _findTomorrowMenu() : menu;
      return tomorrowMenu?.breakfast ?? [];
    }

    switch (mealType) {
      case 'Breakfast':
        return menu.breakfast ?? [];
      case 'Lunch':
        return menu.lunch ?? [];
      case 'Dinner':
        return menu.dinner ?? [];
      default:
        return [];
    }
  }

  MenuResponseModel? _findTomorrowMenu() {
    final now = DateTime.now();
    final tomorrow = now.add(const Duration(days: 1));

    return menuList.firstWhere(
      (menu) => menu.date?.day == tomorrow.day,
      orElse: () => menu,
    );
  }

  Color _getMealStatusColor(String status) {
    switch (status) {
      case 'Breakfast Time':
      case 'Lunch Time':
      case 'Dinner Time':
        return Colors.green;
      case 'Next Meal Soon':
      case 'Breakfast Soon':
      case 'Lunch Soon':
      case 'Dinner Soon':
        return Colors.orange;
      case 'Upcoming':
        return Colors.blue;
      case 'Day End':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
