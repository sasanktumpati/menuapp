import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final mealTimings = _getMealTimingsForType(mealType);
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

  String _getMealTimingsForType(String mealType) {
    // This method should be implemented to return the meal timings based on the meal type
    // For now, returning a placeholder string
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
