import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_whatsapp/models/chat_card_data_model.dart';
import 'package:my_whatsapp/models/chat_model.dart';
import 'package:my_whatsapp/pages/other/chat_screen.dart';

class ChatCard extends StatefulWidget {
  const ChatCard({super.key});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  List<Map<String, dynamic>> chatList = [
    {
      'image': 'asset/dp.jpg',
      'name': 'Peeyush',
      'message': 'Kya kr rhi h?',
      'time': '4:45',
      'about': ''
    },
    {
      'image': 'asset/profile.jpg',
      'name': 'Trishita',
      'message': 'Kha pr h?',
      'time': '12:47',
      'about': ''
    },
    {
      'image': 'asset/dp.jpg',
      'name': 'Peeyush',
      'message': 'Kya kr rhi h?',
      'time': '4:45',
      'about': ''
    },
    {
      'image': 'asset/dp.jpg',
      'name': 'Peeyush',
      'message': 'Kya kr rhi h?',
      'time': '4:45',
      'about': ''
    },
    {
      'image': 'asset/profile.jpg',
      'name': 'Trishita',
      'message': 'Kha pr h?',
      'time': '12:47',
      'about': ''
    },
    {
      'image': 'asset/dp.jpg',
      'name': 'Peeyush',
      'message': 'Kya kr rhi h?',
      'time': '4:45',
      'about': ''
    },
    {
      'image': 'asset/dp.jpg',
      'name': 'Peeyush',
      'message': 'Kya kr rhi h?',
      'time': '4:45',
      'about': ''
    },
    {
      'image': 'asset/profile.jpg',
      'name': 'Trishita',
      'message': 'Kha pr h?',
      'time': '12:47',
      'about': ''
    },
    {
      'image': 'asset/dp.jpg',
      'name': 'Peeyush',
      'message': 'Kya kr rhi h?',
      'time': '4:45',
      'about': ''
    }
  ];

  List<ChatModel> chatModelList = [];

  @override
  void initState() {
    for (var element in chatList) {
      ChatModel chatModel = ChatModel.fromJson(element);
      chatModelList.add(chatModel);
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    // chatCardDataModel = ChatCardDataModel.fromJson({
    //   'image': 'https://unsplash.com/photos/mEZ3PoFGs_k',
    //   'name': 'Peeyush',
    //   'message': 'Kya kr rhi h?',
    //   'time': '4.45'
    // });
    return Container(
      child: chatCard(w),
    );
  }

  chatCard(double w) {
    return ListView.builder(
        itemCount: chatModelList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
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
                    userDp(index),
                    const SizedBox(width: 15),
                    nameAndChat(index),
                    const Spacer(),
                    msgTime(index),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget userDp(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(chatModelList[index].image!),
                fit: BoxFit.cover),
            shape: BoxShape.circle),
      ),
    );
  }

  nameAndChat(int index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 10),
      Text(chatModelList[index].name,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: Colors.black,
                letterSpacing: .5,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )),
      const SizedBox(height: 10),
      Text(chatModelList[index].message,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: Colors.black54,
                letterSpacing: .5,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )),
    ]);
  }

  msgTime(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Text("${chatModelList[index].time} PM",
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
