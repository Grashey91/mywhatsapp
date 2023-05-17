import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_whatsapp/models/select_contact_model.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<Map<String, dynamic>> contactList = [
    {
      "name": "Avinash",
      "image": "asset/avinash.jpeg",
      "about":
          "🌹 Smile a little more; regret a little less✨mile a little more; regret a little "
    },
    {
      "name": "Avinash",
      "image": "asset/avinash.jpeg",
      "about": "Hey there! I am using WhatsApp."
    },
    {"name": "Gaurav", "image": "", "about": "Hey there! I am using WhatsApp."},
    {"name": "Gaurav", "image": "", "about": "Hey there! I am using WhatsApp."},
    {
      "name": "Govind Sir",
      "image": "asset/govind sir.jpeg",
      "about": "Urgent Calls Only"
    },
    {
      "name": "Govind Sir",
      "image": "asset/govind sir.jpeg",
      "about": "Urgent Calls Only"
    },
    {"name": "Rahul", "image": "asset/rahul.jpeg", "about": "😊"},
    {"name": "Rahul", "image": "asset/rahul.jpeg", "about": "😊"},
    {"name": "Rajat", "image": "", "about": "Hey there! I am using WhatsApp."},
    {"name": "Rajat", "image": "", "about": "Hey there! I am using WhatsApp."},
    {"name": "Tanika", "image": "asset/tanika.jpeg", "about": "😎"},
    {"name": "Tanika", "image": "asset/tanika.jpeg", "about": "😎"},
  ];

  List<SelectContactModel> mainContactList = [];
  List<SelectContactModel> tempContactList = [];

  bool isSearchClicked = false;
  TextEditingController searchController = TextEditingController();
  int index = 0;
  @override
  void initState() {
    for (var element in contactList) {
      SelectContactModel selectContactModel =
          SelectContactModel.fromJson(element);
      mainContactList.add(selectContactModel);
    }
    tempContactList = mainContactList;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: ListView(
        children: [
          newGroupRow(),
          newContactRow(),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15),
            child: Text('Contact on whatsapp',
                style: GoogleFonts.hind(
                  textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
          ),
          ListView.builder(
              itemCount: tempContactList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                index = index;
                return contactView(index);
              })
        ],
      ),
    );
  }

  myAppBar(var context) {
    return isSearchClicked
        ? PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 70),
            child: SafeArea(
              child: Container(
                height: 55,
                decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select contact',
                            style: GoogleFonts.hind(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                        Text('195 Contact',
                            style: GoogleFonts.hind(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            )),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 15),
                      child: IconButton(
                        onPressed: () {
                          isSearchClicked = true;
                        },
                        icon: const Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.more_vert_sharp,
                      color: Colors.white,
                      size: 25,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          )
        : PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 70),
            child: SafeArea(
              child: Container(
                height: 55,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.grey,
                    ),
                    Expanded(
                        child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                          hintText: 'Type a name or number...',
                          border: InputBorder.none),
                      onChanged: (value) {
                        setState(() {});
                      },
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 8),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_alt_rounded,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  newGroupRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.deepPurpleAccent),
            child: const Icon(
              Icons.group,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 25),
          Text('New group',
              style: GoogleFonts.hind(
                textStyle: const TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
        ],
      ),
    );
  }

  newContactRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.deepPurpleAccent),
            child: const Icon(
              Icons.person_add,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 25),
          Text('New contact',
              style: GoogleFonts.hind(
                textStyle: const TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
          const Spacer(),
          const Icon(
            Icons.qr_code_2,
            color: Colors.deepPurpleAccent,
          ),
          const SizedBox(width: 25),
        ],
      ),
    );
  }

  contactView(int index) {
    for (var element in mainContactList) {
      if (element.name.toString().contains(searchController.text)) ;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: Row(
        children: [
          tempContactList[index].image.toString().isNotEmpty
              ? Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              tempContactList[index].image.toString()),
                          fit: BoxFit.cover),
                      border: Border.all(width: 1, color: Colors.blueGrey)),
                )
              : Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey[400], shape: BoxShape.circle),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Icon(
                      Icons.person_2,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                ),
          const SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tempContactList[index].name.toString(),
                style: GoogleFonts.hind(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  tempContactList[index].about.toString(),
                  style: GoogleFonts.hind(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      letterSpacing: .5,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
