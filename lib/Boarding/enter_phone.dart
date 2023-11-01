import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:upes_go/Shared/style.dart';

import 'package:upes_go/components/custom_button.dart';
import 'package:upes_go/Boarding/enter_otp.dart';
import 'package:upes_go/components/static_widgets.dart';

import '../Shared/functions.dart';
import 'walk.dart';
import '../provider/auth_provider.dart';

class EnterPhonepage extends StatefulWidget {
  String? phone;
  EnterPhonepage({this.phone});

  @override
  _EnterPhonepageState createState() => _EnterPhonepageState();
}

class _EnterPhonepageState extends State<EnterPhonepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String code = "2342";
  TextEditingController _phoneController = TextEditingController();

  void randomOtp() {
    Random random = Random();
    setState(() {
      code = random.nextInt(10000).toString();
    });
    print("code is $code");
    widget.phone = _phoneController.text;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // randomOtp();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Container(
                        height: 250,
                        width: 250,
                        child: Image.asset(
                          "assets/images/image3.png",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        decoration: InputDecoration(
                            labelText: "Enter phone",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(top: 14, left: 10),
                              child: heading1(
                                "+91 ",
                                20,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            )),
                        minLines: 1,
                        maxLines: 1,
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                provider.state == ViewState.phoneProcessing
                    ? customCircularLoader("processing")
                    : customButton("Verify", () {
                        sendPhoneNumber(_phoneController.text);
                        // navigateslide(Onbording(), context);
                      }, context),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber(String phone) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phone.trim();

    ap.signInWithPhone(context, "+91$phoneNumber");
  }
}
