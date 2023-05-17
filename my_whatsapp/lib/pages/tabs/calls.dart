import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_whatsapp/utils/call_row.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            callLinkRow(),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15),
              child: Text('Recent',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.black54,
                        letterSpacing: .5,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
            ),
            CallRow(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () {},
          child: Icon(
            Icons.add_call,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  callLinkRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 15),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: const BoxDecoration(
                color: Colors.deepPurpleAccent, shape: BoxShape.circle),
            child: const Icon(Icons.link, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create call link',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        letterSpacing: .5,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              Text('Share a link for your WhatsApp call',
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
