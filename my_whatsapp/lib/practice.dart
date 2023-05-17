// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:scroll_to_index/scroll_to_index.dart';

// class HelpScreen extends StatefulWidget {
//   const HelpScreen({super.key});

//   @override
//   State<HelpScreen> createState() => _HelpScreenState();
// }

// // {
// //   'time':'',
// //   'message':''
// // }

// class _HelpScreenState extends State<HelpScreen> {
//   List<ChatModel> customerSupport = [];
//   TextEditingController chatController = TextEditingController();
//   AutoScrollController controller = AutoScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const Icon(
//               Icons.arrow_back,
//               color: Color(0xff111111),
//             ),
//           ),
//           centerTitle: true,
//           title: Text(
//             "Help & Support",
//             style: GoogleFonts.hind(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w500,
//                 color: const Color(0xff111111)),
//           ),
//           elevation: 1,
//           backgroundColor: Colors.white,
//           bottom: TabBar(
//               indicatorColor: const Color(0xff000000),
//               labelColor: Colors.black,
//               unselectedLabelColor: const Color(0xff9D9D9D),
//               unselectedLabelStyle: GoogleFonts.hind(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w300,
//                   color: const Color(0xff000000)),
//               labelStyle: GoogleFonts.hind(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w500,
//                   color: const Color(0xff000000)),
//               tabs: const [
//                 Tab(
//                   text: "Customer Support",
//                 ),
//                 Tab(
//                   text: "Astrologer's Assistant",
//                 )
//               ]),
//         ),
//         body: TabBarView(children: [
//           Stack(
//             children: [
//               ListView.builder(
//                 itemCount: customerSupport.length,
//                 controller: controller,
//                 itemBuilder: (context, index) {
//                   return AutoScrollTag(
//                     key: Key(index.toString()),
//                     index: index,
//                     controller: controller,
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                           bottom: (index == (customerSupport.length - 1))
//                               ? 80.0
//                               : 0),
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.width,
//                         child: Row(children: [
//                           if (index % 2 != 0) const Expanded(child: SizedBox()),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 15.0, vertical: 8),
//                             child: Container(
//                                 constraints:
//                                     const BoxConstraints(maxWidth: 234),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: const Color(0xffE1FAFB)),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(12.0),
//                                       child: Text(
//                                           customerSupport[index].message ?? ''),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           bottom: 12.0, left: 12, right: 12),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           Text(DateFormat('hh:mm a').format(
//                                               DateTime.parse(
//                                                   customerSupport[index]
//                                                       .time!))),
//                                           const Padding(
//                                             padding: EdgeInsets.all(8.0),
//                                             child: Icon(
//                                               Icons.check,
//                                               size: 12,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 )),
//                           ),
//                           if (index % 2 == 0) const Expanded(child: SizedBox()),
//                         ]),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   height: 80,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: const BoxDecoration(color: Colors.white),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: 280,
//                           child: TextFormField(
//                             controller: chatController,
//                             decoration: InputDecoration(
//                                 contentPadding: const EdgeInsets.symmetric(
//                                     vertical: 15, horizontal: 13),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                         color: Color(0xff707070)),
//                                     borderRadius: BorderRadius.circular(8)),
//                                 hintText: "Type a message",
//                                 hintStyle: GoogleFonts.montserrat(
//                                     fontSize: 13,
//                                     color: const Color(0xff707070))),
//                             onChanged: (v) {
//                               setState(() {});
//                             },
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             if (chatController.text.isNotEmpty) {
//                               customerSupport.add(ChatModel.fromJson({
//                                 'time': DateTime.now().toString(),
//                                 'message': chatController.text
//                               }));
//                               controller
//                                   .scrollToIndex(customerSupport.length - 1);
//                               setState(() {});
//                             }
//                           },
//                           child: Container(
//                             height: 50,
//                             width: 80,
//                             decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Color(0xff59B8BE)),
//                             child: const Icon(
//                               Icons.send,
//                               color: Colors.white,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Container()
//         ]),
//       ),
//     );
//   }
// }

// class ChatModel {
//   String? time;
//   String? message;

//   ChatModel({this.time, this.message});

//   ChatModel.fromJson(Map<String, dynamic> json) {
//     time = json['time'];
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['time'] = time;
//     data['message'] = message;
//     return data;
//   }
// }
