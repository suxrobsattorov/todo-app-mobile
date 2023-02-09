import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateOfPlans extends StatelessWidget {
  final Function chooseADate;
  final DateTime selectedDay;
  final Function() previousDate;
  final Function() nextDate;

  const DateOfPlans(
      this.chooseADate, this.selectedDay, this.previousDate, this.nextDate, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: previousDate,
          icon: const Icon(
            Icons.arrow_left,
            size: 40,
          ),
        ),
        TextButton(
          onPressed: () {
            chooseADate(context);
          },
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
              children: [
                TextSpan(
                  text: "${DateFormat.EEEE().format(selectedDay)}, ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: DateFormat("d MMM").format(selectedDay),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: nextDate,
          icon: const Icon(
            Icons.arrow_right,
            size: 40,
          ),
        ),
      ],
    );
  }
}
