// import 'package:flutter/material.dart';
//
// import 'buttonc.dart';
//
// class MyHome extends StatefulWidget {
//   const MyHome({Key? key}) : super(key: key);
//
//   @override
//   _MyHomeState createState() => _MyHomeState();
// }
//
// class _MyHomeState extends State<MyHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       color: Color.fromRGBO(255, 255, 255, 1),
//       width: double.maxFinite,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           modeSwitcher(),
//           Padding(padding: EdgeInsets.all(10)),
//           grid(),
//         ],
//       ),
//     ));
//   }
// }
//
// class grid extends StatefulWidget {
//   const grid({Key? key}) : super(key: key);
//
//   @override
//   _gridState createState() => _gridState();
// }
//
// class _gridState extends State<grid> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(15),
//       height: 600,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "C"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "+/-"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "%"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "➗"),
//               ),
//             ],
//           ),
//           Padding(padding: EdgeInsets.all(6)),
//           Row(
//             children: [
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "7"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "8"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "9"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "✖️"),
//               ),
//             ],
//           ),
//           Padding(padding: EdgeInsets.all(6)),
//           Row(
//             children: [
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "4"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "5"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "6"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "➖"),
//               ),
//             ],
//           ),
//           Padding(padding: EdgeInsets.all(6)),
//           Row(
//             children: [
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "1"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "2"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "3"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "➕"),
//               ),
//             ],
//           ),
//           Padding(padding: EdgeInsets.all(6)),
//           Row(
//             children: [
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "00"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "0"),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "."),
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: buttonC(op: "="),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class modeSwitcher extends StatelessWidget {
//   const modeSwitcher({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.topLeft,
//       child: const InkWell(
//         child: Icon(Icons.wb_sunny),
//       ),
//     );
//   }
// }
