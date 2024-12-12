import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/fetch_menu.dart';
import '../../data/models/response_model.dart';
import '../../utils/timing_utils.dart';

class MealDetailsView extends ConsumerWidget {
  final MenuResponseModel menu;
  final ScrollController controller;

  const MealDetailsView({
    super.key,
    required this.menu,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timingConfig = ref.watch(fetchMenuServiceProvider).timingConfig;
    if (timingConfig == null) return const SizedBox.shrink();

    final dayTimings = TimingUtils.getTimingsForDate(
        timingConfig, menu.date ?? DateTime.now());

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ListView(
        controller: controller,
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: Text(
                  '${menu.day}\'s Menu',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 1,
                child: _buildDateChip(menu.date),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildMealSection(
            'Breakfast',
            menu.breakfast,
            Icons.free_breakfast,
            TimingUtils.getMealTiming(dayTimings.breakfast),
          ),
          _buildMealSection(
            'Lunch',
            menu.lunch,
            Icons.lunch_dining,
            TimingUtils.getMealTiming(dayTimings.lunch),
          ),
          _buildMealSection(
            'Dinner',
            menu.dinner,
            Icons.dinner_dining,
            TimingUtils.getMealTiming(dayTimings.dinner),
          ),
        ],
      ),
    );
  }

  Widget _buildMealSection(
      String title, List<String>? items, IconData icon, String timing) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(icon, color: Colors.orangeAccent, size: 28),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                timing,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              child: Column(
                children: items?.map((item) => _buildMenuItem(item)).toList() ??
                    [
                      _buildMenuItem('No items available', isPlaceholder: true),
                    ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String item, {bool isPlaceholder = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            Icons.restaurant_menu,
            size: 20,
            color: isPlaceholder ? Colors.grey : Colors.orangeAccent,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: isPlaceholder ? Colors.grey : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateChip(DateTime? date) {
    if (date == null) return SizedBox.shrink();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.orangeAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${date.day}/${date.month}',
        style: GoogleFonts.poppins(
          color: Colors.orangeAccent,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
