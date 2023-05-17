import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_whatsapp/pages/other/chat_screen.dart';
import 'package:my_whatsapp/pages/other/profile.dart';
import 'package:my_whatsapp/pages/tabs/calls.dart';
import 'package:my_whatsapp/pages/tabs/chats.dart';
import 'package:my_whatsapp/pages/tabs/status.dart';
import 'package:my_whatsapp/utils/chat_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: myAppBar(w),
          body: Column(
            children: [
              tabBar(),
              const Expanded(
                child: TabBarView(children: [
                  Chats(),
                  Status(),
                  Calls(),
                ]),
              )
            ],
          )),
    );
  }

  myAppBar(double w) {
    return PreferredSize(
      preferredSize: Size(w, 95),
      child: Container(
        // margin: const EdgeInsets.only(top: 35),
        color: Colors.deepPurpleAccent,
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0, left: 15, right: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 5),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(),
                  )),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('asset/profile2.jpg'),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white)),
                  ),
                ),
              ),
              Text('WhatsApp',
                  style: GoogleFonts.hind(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              const Spacer(),
              InkWell(
                onTap: () {
                  print('clicked camera');
                  imagePicked();
                },
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const Icon(
                Icons.more_vert_sharp,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  tabBar() {
    return Container(
      height: 75,
      color: Colors.deepPurpleAccent,
      child: const TabBar(
          indicatorColor: Colors.white,
          //indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 5.0,
          unselectedLabelStyle: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal),
          tabs: [
            Text(
              'Chat',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              'Status',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              'Calls',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            )
          ]),
    );
  }

  File? image;
  Future imagePicked() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final tempImage = File(image.path);

    setState(() {
      this.image = tempImage;
    });
  }
}
