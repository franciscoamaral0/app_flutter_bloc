import 'package:bloc_project/components/remove_task_bootom_sheet.dart';
import 'package:bloc_project/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTask extends StatelessWidget {
  const CardTask(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.date})
      : super(key: key);
  final String title;
  final String subtitle;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 29, left: 30, right: 30),
      color: TaskColors.backgroundCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => const FractionallySizedBox(
                        heightFactor: 0.2, child: RemoveTask()),
                    barrierColor: Colors.black.withOpacity(0.7),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.close),
                  padding: EdgeInsets.zero,
                  splashRadius: 20.0,
                  constraints: const BoxConstraints(),
                )
              ],
            ),
            const SizedBox(height: 14),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 46),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.access_time_outlined,
                  color: TaskColors.colorDate,
                ),
                const SizedBox(
                  width: 10.03,
                ),
                Text(
                  date.toString(),
                  style: const TextStyle(color: TaskColors.colorDate),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
