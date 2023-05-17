import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_whatsapp/pages/other/chat_screen.dart';
import 'package:my_whatsapp/pages/other/home.dart';
import 'package:my_whatsapp/pages/tabs/calls.dart';
import 'package:my_whatsapp/utils/status_row.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myStatus(),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15),
              child: Text('Recent Updates',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.black54,
                        letterSpacing: .5,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
            ),
            StatusCard(),
          ],
        ),
        floatingActionButton: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatScreen(),
          )),
          child: FloatingActionButton(
            backgroundColor: Colors.deepPurpleAccent,
            onPressed: () {},
            child: const Icon(
              Icons.camera_alt_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  myStatus() {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 15),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('asset/profile2.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white)),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My Status',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        letterSpacing: .5,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              Text('Tap to add status update',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.black54,
                        letterSpacing: .5,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
