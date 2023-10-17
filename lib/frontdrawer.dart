// import 'package:flutter/material.dart';

// class Drawer extends StatefulWidget {
//   const Drawer(
//     Container container, {
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<Drawer> createState() => _DrawerState();
// }

// class _DrawerState extends State<Drawer> {
//   final padding = EdgeInsets.symmetric(horizontal: 20);
//   @override
//   Widget build(BuildContext context) {
//     // return Container(
//     //   child: Drawer(

//     //   ),
//     // );
//     return Drawer(Container(
//       color: Color.fromRGBO(50, 75, 205, 1),
//       child: ListView(
//         children: <Widget>[
//           // const SizedBox(
//           //   height: 48,
//           // ),
//           buildMenuItem(
//             text: 'people',
//             icon: Icons.people,
//           ),
//         ],
//       ),
//     ));
//   }

//   Widget buildMenuItem({
//     required String text,
//     required IconData icon,
//   }) {
//     final color = Colors.black;
//     final hoverColor = Colors.black;
//     return ListTile(
//       leading: Icon(
//         icon,
//         color: color,
//       ),
//       title: Text(text, style: TextStyle(color: color)),
//       hoverColor: hoverColor,
//       onTap: () {},
//     );
//   }
// }
