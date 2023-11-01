import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Shared/colors.dart';
import '../provider/user_provider.dart';

class MessMenuscreen extends StatefulWidget {
  @override
  _MessMenuscreenState createState() => _MessMenuscreenState();
}

class _MessMenuscreenState extends State<MessMenuscreen> {
  int menuindex = 0;
  String? name, userid, profileurl;
  List breakfast = ["Fetching Menu"];
  List lunch = ["Fetching Menu"];
  List hiTea = ["Fetching Menu"];
  List dinner = ["Fetching Menu"];
  getpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = prefs.getString("userId") ?? "";
      name = prefs.getString("userfname") ?? "";
      profileurl = prefs.getString("profileUrl") ?? "";
    });
  }

  getmealslab() {
    print(DateTime.now().hour);
    if (DateTime.now().hour <= 9) {
      print("Its Breakfast");
      menuindex = 1;
    } else if (DateTime.now().hour <= 17) {
      print("Its Lunch");
      menuindex = 2;
    } else {
      print("Its Dinner");
      menuindex = 3;
    }
  }

  @override
  void initState() {
    super.initState();
    checkDay();
    getpref();
    getmealslab();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDataProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              // padding: EdgeInsets.symmetric(
              //   vertical: 5,
              // ),

              // height: 44,
              // color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      // child: Icon(
                      //   Icons.food_bank,
                      //   size: 25,
                      // ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Hey ${userProvider.userModel.name[0]}, 😃 \nHere is the Mess Menu",
                      style: GoogleFonts.montserrat(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          menuindex = 0;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: menuindex == 0
                              ? BoxDecoration(
                                  // gradient:
                                  // LinearGradient(colors: [Colors.black,ColorPalatte.primaryColorAccent]),
                                  border: Border.all(
                                    width: 2,
                                    color: ColorPalatte.primaryColor,
                                  ),
                                  // color:ColorPalatte.primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ))
                              : BoxDecoration(),
                          child: avatar("assets/images/breakfast.png"))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          menuindex = 1;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: menuindex == 1
                              ? BoxDecoration(
                                  // gradient:
                                  // LinearGradient(colors: [Colors.black,ColorPalatte.primaryColorAccent]),
                                  border: Border.all(
                                    width: 2,
                                    color: ColorPalatte.primaryColor,
                                  ),
                                  // color:ColorPalatte.primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ))
                              : BoxDecoration(),
                          child: avatar("assets/images/menudish.png"))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          menuindex = 2;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: menuindex == 2
                              ? BoxDecoration(
                                  // gradient:
                                  // LinearGradient(colors: [Colors.black,ColorPalatte.primaryColorAccent]),
                                  border: Border.all(
                                    width: 2,
                                    color: ColorPalatte.primaryColor,
                                  ),
                                  // color:ColorPalatte.primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ))
                              : BoxDecoration(),
                          child: avatar("assets/images/menucup.png"))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          menuindex = 3;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: menuindex == 3
                              ? BoxDecoration(
                                  // gradient:
                                  // LinearGradient(colors: [Colors.black,ColorPalatte.primaryColorAccent]),
                                  border: Border.all(
                                    width: 2,
                                    color: ColorPalatte.primaryColor,
                                  ),
                                  // color:ColorPalatte.primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ))
                              : BoxDecoration(),
                          child: avatar("assets/images/menuplate.png"))),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            chooseMenu(breakfast, lunch, hiTea, dinner),
            // if (menuindex == 0)
            //   {menubox()}
            // else if (menuindex 0= 1)
            //   {menubox()}
            // else
            //   {menubox()}
          ],
        ),
      ),
    );
  }

  Widget chooseMenu(List breakfast, List lunch, List hiTea, List dinner) {
    if (menuindex == 0) {
      return messMenuList("breakfast", breakfast);
    } else if (menuindex == 1) {
      return messMenuList("lunch", lunch);
    } else if (menuindex == 2) {
      // return menubox("Dinner", "Chola Bhature", "Roti Sabzi", "Aalo sabzi",
      //     "Sandwich", "Makhan Gobhi", "Panner Chaat", "Bhindi");
      return messMenuList("hi tea", hiTea);
    } else if (menuindex == 3) {
      return messMenuList("dinner", dinner);
    }

    return messMenuList("lunch", breakfast);
  }

  List menuFoodList = ["Pasta", "Maggi"];
  String todayDay = "monday";
  checkDay() {
    int daycode = DateTime.now().weekday;

    if (daycode == 0) {
      setState(() {
        todayDay = "Sunday";
      });
    } else if (daycode == 1) {
      setState(() {
        todayDay = "monday";
      });
    } else if (daycode == 2) {
      setState(() {
        todayDay = "tuesday";
      });
    } else if (daycode == 3) {
      setState(() {
        todayDay = "wednesday";
      });
    } else if (daycode == 4) {
      setState(() {
        todayDay = "thursday";
      });
    } else if (daycode == 5) {
      setState(() {
        todayDay = "friday";
      });
    } else if (daycode == 6) {
      setState(() {
        todayDay = "saturday";
      });
    } else if (daycode == 7) {
      setState(() {
        todayDay = "Sunday";
      });
    }
    print("today is $todayDay");

    FirebaseFirestore.instance
        .collection("Mess")
        .doc(todayDay)
        .get()
        .then((value) => {
              setState(() {
                breakfast = value["breakfast"] ?? [];
                lunch = value["lunch"] ?? [];
                hiTea = value["hiTea"] ?? [];
                dinner = value["dinner"] ?? [];
              })
            });
  }

  Widget messMenuList(String mealTime, List mealList) {
    return Container(
        // color: Colors.red,
        //  height: 410,
        // height: double.infinity,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 35),
        // padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(13),
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20, top: 10),
                child: Text(mealTime.toUpperCase(),
                    style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo)),
              ),
            ),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: mealList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 190,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 10),
                            child: Icon(
                              Icons.circle,
                              size: 12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print(DateTime.now().weekday);
                            },
                            child: Text(mealList[index],
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }

  Widget avatar(img) {
    return CircleAvatar(
      maxRadius: 36,
      // maxRadius: 30,
      backgroundColor: Theme.of(context).canvasColor,
      child: Image.asset(
        img,
        height: 40,
      ),
    );
  }
}
