// import 'package:upes_go/Screens/Restaurants/food_home.dart';
import 'package:upes_go/homepage.dart';
// import 'package:upes_go/mess_menu.dart';
// import 'package:upes_go/profile.dart';
// import 'package:upes_go/settings.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:upes_go/Features/mess_menu.dart';
import 'package:upes_go/Features/profile.dart';

class Bottomnavbar extends StatefulWidget {
  final int index;
  Bottomnavbar({required this.index});

  @override
  _BottomnavbarState createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  PageController controller = PageController();
  var currentPageValue = 0.0;

  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = widget.index;
    controller = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Homepagescreen(),
          MessMenuscreen(),
          // Homepagescreen(),
          ProfileScreen(
              // userid: "userid12",
              // username: "arin bro",
              ),
          // MessMenuscreen(),
          // FoodHomeScreen(),
          // ProfileScreen(),
        ],
        controller: controller,
        onPageChanged: (n) {
          setState(() {
            _selectedIndex = n;
          });
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(70, 67, 211, 1),
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                color: Colors.white,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
                tabs: [
                  GButton(
                    icon: Icons.home_filled,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.menu_book,
                    text: 'Mess',
                  ),
                  // GButton(
                  //   icon: Icons.food_bank,
                  //   text: 'Food',
                  // ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  String mydata = "myusername|password";
                  String bs64 = base64.encode(mydata.codeUnits);
                  print(bs64); //output: bXl1c2VybmFtZXxwYXNzd29yZA==
                  setState(() {
                    _selectedIndex = index;
                    controller.jumpToPage(index);
                  });
                }),
          ),
        ),
      ),
    );
  }
}
