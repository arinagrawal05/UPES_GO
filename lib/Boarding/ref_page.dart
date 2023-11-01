// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
// import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:upes_go/Settings/faqs_screen.dart';
import 'package:upes_go/Shared/colors.dart';
import 'package:upes_go/Shared/functions.dart';
import 'package:upes_go/components/custom_button.dart';
import 'package:upes_go/components/static_widgets.dart';

import '../Enums/state.dart';
import '../provider/ref_provider.dart';
// import 'package:referral_app/enums/state.dart';
// import 'package:referral_app/provider/ref_provider.dart';
// import 'package:referral_app/screens/authentication/login.dart';
// import 'package:referral_app/screens/home_page.dart';
// import 'package:referral_app/utils/message.dart';

class EnterRefCodePage extends StatefulWidget {
  @override
  _EnterRefCodePageState createState() => _EnterRefCodePageState();
}

class _EnterRefCodePageState extends State<EnterRefCodePage> {
  final TextEditingController _refController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<RefProvider>(builder: (context, model, child) {
      return SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.blue),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Enter referral code",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(30.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CustomTextField(
                              _refController,
                              hint: 'Referal code',
                              password: false,
                              border:
                                  Border.all(color: ColorPalatte.primaryColor),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        // model.state == ViewState.Busy
                        //     ? Center(
                        //         child: customCircularLoader("Referal Code"),
                        //       )
                        //     :
                        customButton("Apply Code", () async {
                          //Validate User Inputs
                          if (_refController.text.isEmpty) {
                            AppUtils.showSnackMessage("All field are required");
                            // showMessage(
                            //     context, "All field are required");
                          } else {
                            await model.setReferral(
                                _refController.text.trim().toLowerCase(),
                                "zZhiTRrEiOe2OnzUqjku");

                            if (model.state == ViewState.Success) {
                              navigateslide(Faqscreen(), context);
                            } else {
                              AppUtils.showSnackMessage(model.message);
                            }
                          }
                        }, context),
                        GestureDetector(
                          onTap: () {
                            //Navigate to Register Page

                            Faqscreen();
                          },
                          child: const Text(
                            "No referral? continue instead",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
