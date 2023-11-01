import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upes_go/Routes/route_const.dart';
import 'package:upes_go/Shared/style.dart';
import 'package:upes_go/Shared/walk_model.dart';
import 'package:upes_go/components/custom_button.dart';
import 'package:upes_go/homepage.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:unbording/content_model.dart';
// import 'package:unbording/home.dart';

class Walkthough extends StatefulWidget {
  @override
  _WalkthoughState createState() => _WalkthoughState();
}

class _WalkthoughState extends State<Walkthough> {
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return featurePage(i);
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: customButton(
                  currentIndex == contents.length - 1 ? "Continue" : "Next",
                  () {
                if (currentIndex == contents.length - 1) {
                  // Get.to
                  Get.toNamed(RouteConstants.login);
                }
                _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              }, context))
        ],
      ),
    );
  }

  Padding featurePage(int i) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Image.asset(
            contents[i].image,
            height: 300,
          ),
          heading(
            contents[i].title,
            29,
          ),
          SizedBox(height: 20),
          heading1(contents[i].discription, 18,
              overF: TextOverflow.clip, center: true),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
