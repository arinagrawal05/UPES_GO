import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:phoneauth_firebase/provider/auth_provider.dart';
// import 'package:phoneauth_firebase/screens/home_screen.dart';
// import 'package:phoneauth_firebase/screens/user_information_screen.dart';
// import 'package:phoneauth_firebase/utils/utils.dart';
// import 'package:phoneauth_firebase/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:upes_go/Routes/route_const.dart';
import 'package:upes_go/Shared/colors.dart';
import 'package:upes_go/components/bottom_nav.dart';
import 'package:upes_go/Settings/faqs_screen.dart';
import 'package:upes_go/components/static_widgets.dart';

import '../Shared/functions.dart';
import '../provider/auth_provider.dart';
import '../components/custom_button.dart';

class EnterOtpPage extends StatefulWidget {
  final String verificationId, phone;
  const EnterOtpPage(
      {super.key, required this.verificationId, required this.phone});

  @override
  State<EnterOtpPage> createState() => _EnterOtpPageState();
}

class _EnterOtpPageState extends State<EnterOtpPage> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                Container(
                  width: 170,
                  height: 170,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorPalatte.primaryColor.withOpacity(0.1),
                  ),
                  child: Image.network(
                    "https://cdni.iconscout.com/illustration/premium/thumb/otp-authentication-security-5053897-4206545.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Enter the OTP send to your phone number",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 45,
                    decoration: BoxDecoration(
                      color: ColorPalatte.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   color: Colors.purple.shade200,
                      // ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: !isLoading
                      ? customButton("Verify", () {
                          if (otpCode != null) {
                            verifyOtp(context, otpCode!);
                          } else {
                            AppUtils.showSnackMessage("Enter 6-Digit code");
                          }
                        }, context)
                      : customCircularLoader("Processing"),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Didn't receive any code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Resend New Code",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorPalatte.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // verify otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        // checking whether user exists in the db
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              // user exists in our app
              ap.getDataFromFirestore().then(
                    (value) => ap.setSignIn().then(
                      (value) {
                        navigateslide(Bottomnavbar(index: 0), context);
                      },
                    ),
                  );
            } else {
              // new user
              Get.toNamed(RouteConstants.referral);
            }
          },
        );
      },
    );
  }
}
