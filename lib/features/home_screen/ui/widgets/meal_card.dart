import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/fetch_menu.dart';
import '../../data/models/response_model.dart';
import '../../utils/timing_utils.dart';

class MealCard extends ConsumerWidget {
  final String mealType;
  final List<String>? items;
  final bool isCurrentMeal;

  const MealCard({
    super.key,
    required this.mealType,
    this.items,
    this.isCurrentMeal = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealTimings = _getMealTimingsForType(mealType, ref);
    bool hasData = items != null && items!.isNotEmpty;

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
              title: Flexible(
                child: Text(
                  mealType,
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              subtitle: Flexible(
                child: Text(
                  mealTimings,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            const Divider(),
            hasData
                ? Column(
                    children: items!.map((item) {
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

  String _getMealTimingsForType(String mealType, WidgetRef ref) {
    final timingConfig = ref.watch(fetchMenuServiceProvider).timingConfig;
    if (timingConfig == null) return '';

    final defaultTimings = timingConfig.defaultTimings;
    switch (mealType) {
      case 'Breakfast':
        return TimingUtils.getMealTiming(defaultTimings.breakfast);
      case 'Lunch':
        return TimingUtils.getMealTiming(defaultTimings.lunch);
      case 'Dinner':
        return TimingUtils.getMealTiming(defaultTimings.dinner);
      default:
        return '';
    }
  }
}
