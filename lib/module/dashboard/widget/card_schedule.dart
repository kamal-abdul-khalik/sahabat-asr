import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class ScheduleCard extends StatefulWidget {
  final String agendaTitle;
  final String place;
  final String date;
  final String start;
  final String end;
  const ScheduleCard({
    super.key,
    required this.agendaTitle,
    required this.place,
    required this.date,
    required this.start,
    required this.end,
  });

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 240.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.agendaTitle,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        size: 18.0,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        widget.date,
                        style: const TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      const Icon(
                        MdiIcons.mapMarker,
                        size: 18.0,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Expanded(
                        child: Text(
                          widget.place,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        MdiIcons.timerCheck,
                        color: primaryColor,
                        size: 18.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        widget.start,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        MdiIcons.timerStop,
                        color: dangerColor,
                        size: 18.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        widget.end,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
