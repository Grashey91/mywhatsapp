import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  List<String> selectAboutList = [
    "Avaible",
    "Busy",
    "At school",
    "At the movies",
    "At work",
    "Battery about to die",
    "Can't talk, WhatsApp only"
        "In a meeting",
    "At the gym",
    "Sleeping",
    "Urgent Calls only"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            currentlySetAbout(context),
            const SizedBox(height: 25),
            InkWell(
              onTap: () {},
              child: const Text(
                'Select About',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            selectAbout(context),
          ],
        ),
      ),
    );
  }

  myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurpleAccent,
      leading: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      title: const Text(
        'Profile',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget currentlySetAbout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        const Text(
          'Currently set to',
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Text(
              'Urgent Calls only',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 12, right: 25),
              child: Icon(
                Icons.edit,
                size: 25,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget selectAbout(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text(
              '........',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          );
        });
  }
}
