// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
// import 'package:ionicons/ionicons.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   QuillController _controller = QuillController.basic();

//   @override
//   Widget build(BuildContext context) {
//     _controller = QuillController(
//       document: Document.fromJson([
//         {
//           "insert": "Hlhtyyy",
//           "attributes": {"script": "sub"}
//         },
//         {"insert": " h n"},
//         {
//           "insert": "\n",
//           "attributes": {"indent": 1, "code-block": true}
//         },
//         {"insert": "    Hjjjjmkjk"},
//         {
//           "insert": "\n",
//           "attributes": {"indent": 1, "blockquote": true}
//         },
//         {"insert": "Bhn"},
//         {
//           "insert": "\n",
//           "attributes": {"indent": 1, "blockquote": true}
//         }
//       ]),
//       selection: TextSelection.collapsed(offset: 0),
//     );

//     return SafeArea(
//       child: Scaffold(
//           floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 var json = jsonEncode(_controller.document.toDelta().toJson());
//                 print(json);
//               },
//               child: Icon(Icons.abc)),
//           body: Column(
//             children: [
//               // SizedBox(
//               //   height: 40,
//               // ),
//               QuillToolbar.basic(
//                 showSmallButton: true,
//                 showDirection: true,
//                 controller: _controller,
//                 toolbarIconSize: 20,
//                 multiRowsDisplay: false,
//                 showAlignmentButtons: true,
//                 // showSuperscript: ,
//                 // showCodeBlock: false,
//                 // color: Colors.red,
//                 sectionDividerColor: Colors.black12,
//                 customButtons: [
//                   QuillCustomButton(
//                     icon: Ionicons.document_attach_outline,
//                     onTap: () {
//                       debugPrint('snowflake3');
//                     },
//                   ),
//                 ],

//                 iconTheme: QuillIconTheme(
//                   borderRadius: 14,
//                   iconSelectedFillColor: Colors.orange,
//                 ),
//               ),
//               QuillEditor.basic(
//                 controller: _controller,
//                 readOnly: false,
//               )
//             ],
//           )),
//     );
//   }
// }
