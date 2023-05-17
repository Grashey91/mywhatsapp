import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_whatsapp/pages/other/select_contact.dart';

import '../../utils/chat_card.dart';
import '../other/chat_screen.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<Map<String, dynamic>> chatCardList = [
    {
      'image': 'asset/dp.jpg',
      'name': 'Peeyush',
      'message': 'Kya kr rhi h?',
      'time': '4:45',
      'about': true
    },
    {
      'image': 'asset/profile.jpg',
      'name': 'Trishita',
      'message': 'Kha pr h?',
      'time': '12:47',
      'about': true
    },
    {
      'image': 'asset/dp.jpg',
      'name': 'Peeyush',
      'message': 'Kya kr rhi h?',
      'time': '4:45',
      'about': true
    }
  ];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [ChatCard()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SelectContact(),
          ));
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(
          Icons.message_sharp,
          color: Colors.white,
        ),
      ),
    );
  }

  chatCard(double w) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChatScreen(),
      )),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 15),
        child: SizedBox(
          width: w,
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userDp(),
              const SizedBox(width: 15),
              nameAndChat(),
              const Spacer(),
              msgTime(),
            ],
          ),
        ),
      ),
    );
  }

  userDp() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(chatCardList[0]['image']), fit: BoxFit.cover),
            shape: BoxShape.circle),
      ),
    );
  }

  nameAndChat() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 10),
      Text(chatCardList[0]['name'],
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: Colors.black,
                letterSpacing: .5,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )),
      const SizedBox(height: 10),
      Text(chatCardList[0]['message'],
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: Colors.black54,
                letterSpacing: .5,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )),
    ]);
  }

  msgTime() {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Text("${chatCardList[0]['time']} PM",
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: Colors.black54,
                letterSpacing: .5,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
