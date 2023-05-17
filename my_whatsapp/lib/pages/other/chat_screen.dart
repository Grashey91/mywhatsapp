import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_whatsapp/pages/other/home.dart';
import 'package:my_whatsapp/pages/tabs/chats.dart';

import '../../models/message_list_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> chatScreenAppBarList = [
    {
      'image': 'asset/dp.jpg',
      'name': 'Peeyush',
    }
  ];

  TextEditingController chatController = TextEditingController();
  List<MessageListModel> messageList = [];
  bool isEmpty = true;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 245, 233),
      appBar: myAppBar(),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: messageList.length,
            itemBuilder: (context, index) {
              return Container(
                constraints: const BoxConstraints(maxWidth: 234),
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent[300],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(messageList[index].message ?? ''),
                      Text(messageList[index].time ?? ''),
                      // Text(),
                    ],
                  ),
                ),
              );
            },
          ),
          inputRow(),
        ],
      ),
    );
  }

  myAppBar() {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 70),
      child: Container(
        height: 90,
        color: Colors.deepPurpleAccent,
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Home(),
                )),
                child: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              CircleAvatar(
                backgroundImage: AssetImage(chatScreenAppBarList[0]['image']),
              ),
              const SizedBox(width: 10),
              Text(chatScreenAppBarList[0]['name'],
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              const Spacer(),
              const Icon(
                Icons.video_call,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 20),
              const Icon(
                Icons.call,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(width: 20),
              const Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }

  inputRow() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              color: const Color.fromARGB(255, 250, 245, 233),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(55),
                          color: Colors.white),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.black54,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: TextField(
                              controller: textEditingController,
                              keyboardType: TextInputType.text,
                              autofocus: true,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Message'),
                              onChanged: (value) {
                                if (textEditingController.text
                                    .toString()
                                    .isNotEmpty) {
                                  isEmpty = false;
                                  setState(() {});
                                } else {
                                  isEmpty = true;
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                          isEmpty
                              ? Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Spacer(),
                                      const Icon(
                                        Icons.link,
                                        color: Colors.black54,
                                        size: 28,
                                      ),
                                      const SizedBox(width: 15),
                                      InkWell(
                                        onTap: () {
                                          print('camera open');
                                        },
                                        child: const Icon(
                                          Icons.camera_alt_rounded,
                                          color: Colors.black54,
                                          size: 25,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                )
                              : Expanded(
                                  child: Row(
                                    children: const [
                                      Spacer(),
                                      Icon(
                                        Icons.link,
                                        color: Colors.black54,
                                        size: 28,
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),

                  //MIC BTN
                  isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 55,
                              height: 55,
                              decoration: const BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.mic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )

                      //SEND BTN
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () {
                                if (textEditingController.text
                                    .toString()
                                    .isNotEmpty) {
                                  messageList.add(MessageListModel.fromJson({
                                    'time': DateTime.now().toString(),
                                    'message': chatController.text
                                  }));
                                }

                                setState(() {});
                              },
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: const BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.send_sharp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget emojiSelected() {
    return EmojiPicker(
      config: Config(
        columns: 7,
        buttonMode: ButtonMode.MATERIAL,
      ),
      onEmojiSelected: (emoji, category) {
        print(emoji);
      },
    );
  }
}
