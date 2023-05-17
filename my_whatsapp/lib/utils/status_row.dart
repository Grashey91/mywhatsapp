import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StatusCard extends StatefulWidget {
  const StatusCard({super.key});

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  String period = 'today';
  List<Map<String, dynamic>> statusRowList = [
    {
      'image': 'asset/dp.jpg',
      'name': 'Peeyush',
      'callDirection': 'incomingCall',
      'time': '',
      'callType': 'audio'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(statusRowList[0]['image']),
            radius: 25,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(statusRowList[0]['name'],
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        letterSpacing: .5,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 6),
              Text(DateFormat('h:mm a').format(DateTime.now()),
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.black54,
                        letterSpacing: .5,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
