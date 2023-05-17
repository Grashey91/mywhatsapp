import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_whatsapp/models/calls_model.dart';

class CallRow extends StatefulWidget {
  const CallRow({super.key});

  @override
  State<CallRow> createState() => _CallRowState();
}

class _CallRowState extends State<CallRow> {
  List<Map<String, dynamic>> callsList = [
    {
      'image': 'asset/dp.jpg',
      'name': 'Peeyush',
      'callInfo': {'incoming': true},
      'time': '',
      'callType': 'video'
    },
    {
      'image': 'asset/profile3.jpg',
      'name': 'Trishita',
      'callInfo': {'incoming': true},
      'time': '',
      'callType': 'video'
    },
    {
      'image': 'asset/tanika.jpeg',
      'name': 'Tanika',
      'callInfo': {'incoming': true},
      'time': '',
      'callType': 'audio'
    },
    {
      'image': 'asset/govind sir.jpeg',
      'name': 'Govind Sir',
      'callInfo': {'incoming': true},
      'time': '',
      'callType': 'audio'
    },
    {
      'image': 'asset/rahul.jpeg',
      'name': 'Rahul',
      'callInfo': {'incoming': true},
      'time': '',
      'callType': 'audio'
    },
    {
      'image': 'asset/profile.jpg',
      'name': 'Yashi',
      'callInfo': {'incoming': true},
      'time': '',
      'callType': 'video'
    },
    {
      'image': 'asset/avinash.jpeg',
      'name': 'Avinash',
      'callInfo': {'incoming': true},
      'time': '',
      'callType': 'audio'
    }
  ];

  List<CallsModel> callsModelList = [];

  @override
  void initState() {
    for (var element in callsList) {
      CallsModel callsModel = CallsModel.fromJson(element);

      callsModelList.add(callsModel);
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: callsModelList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(callsModelList[index].image!),
                    radius: 25,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(callsModelList[index].name,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                letterSpacing: .5,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_outward_sharp,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 8),
                          Text(
                              DateFormat('h:mm a')
                                  .format(DateTime.now())
                                  .toString(),
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: Colors.black54,
                                    letterSpacing: .5,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  callsModelList[index].callType.contains('audio')
                      ? const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.call,
                            color: Colors.deepPurpleAccent,
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.video_call,
                            color: Colors.deepPurpleAccent,
                          ),
                        )
                ],
              ),
            ),
          );
        });
  }
}
