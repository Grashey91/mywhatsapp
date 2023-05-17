import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_whatsapp/pages/other/about.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: ListView(
        children: [
          editProfilePic(),
          const SizedBox(height: 22),
          editName(context),
          const SizedBox(height: 14),
          editAbout(context),
          const SizedBox(height: 14),
          changeNumber(context),
        ],
      ),
    );
  }

  myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurpleAccent,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: const Text(
        'Profile',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget editProfilePic() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Stack(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 150,
              // width: 120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/profile2.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 110, left: 90),
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.deepPurpleAccent, shape: BoxShape.circle),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget editName(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 110,
        // color: Colors.amber[100],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12, left: 18),
              child: Icon(Icons.person, size: 25),
            ),
            const SizedBox(width: 22),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 6),
                Text(
                  'Name',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(height: 8),
                Text(
                  '😊',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15),
                Text(
                  'This is not your username or pin. This\nname will be visible to your WhatsApp contacts.',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.visible,
                )
              ],
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(top: 12, right: 18),
              child: Icon(
                Icons.edit,
                size: 25,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget editAbout(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const About(),
      )),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        // color: Colors.amber[100],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12, left: 18),
              child: Icon(Icons.info_outline, size: 25),
            ),
            const SizedBox(width: 22),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 6),
                Text(
                  'About',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text(
                  'Urgent calls only',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(top: 12, right: 18),
              child: Icon(
                Icons.edit,
                size: 25,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget changeNumber(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        // color: Colors.amber[100],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12, left: 18),
              child: Icon(Icons.call, size: 25),
            ),
            const SizedBox(width: 22),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 6),
                Text(
                  'Phone',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text(
                  '+91 7014108414',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
