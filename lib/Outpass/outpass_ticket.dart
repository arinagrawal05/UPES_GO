import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/models/outpass_model.dart';

import '../Shared/colors.dart';
// import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';

class OutpassTicketView extends StatefulWidget {
  final OutpassModel model;

  OutpassTicketView({super.key, required this.model});
  @override
  _OutpassTicketViewState createState() => _OutpassTicketViewState();
}

class _OutpassTicketViewState extends State<OutpassTicketView> {
  // ScreenshotController screenshotController = ScreenshotController();
  // Uint8List _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.camera_alt),
      //   onPressed: (){
      //     _imageFile = null;
      //     screenshotController
      //         .capture()
      //         .then((Uint8List image) async {
      //       //print("Capture Done");
      //       setState(() {
      //         _imageFile = image;
      //       });
      //       final result =
      //           await ImageGallerySaver.saveImage(_imageFile);
      //           print(result);// Save image to gallery,  Needs plugin  https://pub.dev/packages/image_gallery_saver
      //       print("File Saved to Gallery");
      //     }).catchError((onError) {
      //       print(onError);
      //     });
      //   },
      // ),
      backgroundColor: ColorPalatte.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: TicketWidget(
            width: 350,
            height: 500,
            isCornerRounded: true,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: Colors.green),
                      ),
                      child: Center(
                        child: Text(
                          'Approved OutPass',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'UPES',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 8.0),
                        //   child: Icon(
                        //   widget.modeOfTransport =="Train"?

                        //     Icons.train_rounded: widget.modeOfTransport =="Flight"?
                        //     Icons.flight: widget.modeOfTransport =="Bus"? Icons.bus_alert: Icons.car_rental,
                        //     color: Colors.pink,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 8.0),
                        //   child: Text(
                        //     widget.leaveAdress,
                        //     style: TextStyle(
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'OutPass ID ' + widget.model.outpassNumber,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: <Widget>[
                      ticketDetailsWidget('Name', widget.model.name,
                          'Registration', widget.model.registrationNo),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ticketDetailsWidget(
                            'Block/Room/Year',
                            widget.model.block +
                                '/ ' +
                                widget.model.room +
                                '/ ' +
                                widget.model.year,
                            'Reason',
                            widget.model.leaveReason),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ticketDetailsWidget(
                            'Leave from',
                            AppUtils.dateTimetoTime(
                                widget.model.appliedTime.toDate()),
                            'Leave Upto',
                            AppUtils.dateTimetoTime(
                                widget.model.decisionTime!.toDate())),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Container(
                      // width: 250.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo.jpg'),
                              fit: BoxFit.contain)),
                    ),
                    Text(
                      'UPES, Dehradun',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Authorised Outpass for Students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),

//  Center(
//         child: FlutterTicketWidget(

//             width: 350.0,
//             height: 500.0,
//             isCornerRounded: true,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child:  ),
//           ),

//       ),
    );
  }

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
