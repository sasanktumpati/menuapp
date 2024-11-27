import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/response_model.dart';

class DaySelector extends StatelessWidget {
  final List<MenuResponseModel> menuList;
  final int selectedIndex;
  final ScrollController dayScrollController;
  final ValueChanged<int> onDaySelected;

  const DaySelector({
    super.key,
    required this.menuList,
    required this.selectedIndex,
    required this.dayScrollController,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        controller: dayScrollController,
        scrollDirection: Axis.horizontal,
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          final menu = menuList[index];
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onDaySelected(index),
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
}
