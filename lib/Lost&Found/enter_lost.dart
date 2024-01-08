import 'dart:io';

// import '
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';

// import '/shared/exports.dart';
// import '/sheets/plan_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:upes_go/Hive/Hive_models/commission_models/lost_hive_model.dart';
import 'package:upes_go/Shared/colors.dart';
import 'package:upes_go/Shared/style.dart';
import 'package:upes_go/provider/user_provider.dart';
import 'package:uuid/uuid.dart';

import '../Shared/const.dart';
import '../Shared/functions.dart';
import '../models/resell_model.dart';
import '../components/components.dart';
import '../components/custom_button.dart';

// ignore: must_be_immutable
class EnterLost extends StatefulWidget {
  LostHiveModel? model;
  EnterLost({super.key, required this.model});

  @override
  State<EnterLost> createState() => _EnterLostState();
}

class _EnterLostState extends State<EnterLost> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController type = TextEditingController();
  // late final imageUrl = TextEditingController();

  // final phone = TextEditingController();
  String? imageUrll;

  final _companyFormKey = GlobalKey<FormState>();

  String currentCategory = TermConsts.resellCate[0];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.model != null) {
      name.text = widget.model!.image;
      imageUrll = widget.model!.image;
      // imageUrl.text = widget.model!.companyImg;
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserDataProvider>(context);
    // final dashProvider = Get.find<DashProvider>();
    // String? modelImage = widget.model == null ? null : widget.model!.companyImg;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model == null ? "Add Product" : "Update Product"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Form(
            key: _companyFormKey,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: _pickedImage == null && widget.model == null
                              ? GestureDetector(
                                  onTap: () {
                                    _pickImage(name.text);
                                  },
                                  child: dottedBorder(
                                      color: ColorPalatte.primaryColor),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    _pickImage(name.text);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: widget.model == null
                                        ? Image.file(_pickedImage!,
                                            fit: BoxFit.fill)
                                        : _pickedImage == null
                                            ? Image.file(_pickedImage!,
                                                fit: BoxFit.fill)
                                            : Image.network(imageUrll!),
                                  ),
                                )),

                      SizedBox(
                        height: 10,
                      ),
                      customTextField(name, "Product Name"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: customTextField(price, "Product Price",
                            keyboardType: TextInputType.number),
                      ),
                      genericPicker(
                          TermConsts.resellCate, currentCategory, "Category",
                          (p0) {
                        setState(() {
                          currentCategory = p0;
                        });
                      }, context,
                          prefixIcon: Ionicons.cube_outline,
                          width: double.infinity),
                      // const Spacer(),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          heading(
                              "Things to keeps in mind While Reselling:", 15),
                          SizedBox(
                            height: 5,
                          ),
                          perkTile(
                              "Ensuring competitive and reasonable prices\nto provide value to buyers."),
                          perkTile(
                              "Providing accurate and transparent product\ninformation to build trust with buyers."),
                          perkTile(
                              "We do not entertain with payment & logistic\nPart"),
                        ],
                      ),

                      // addMemberSheet(context, widget.userid, docId);
                    ],
                  ),
                  isLoading == true
                      ? CircularProgressIndicator()
                      : customButton(
                          widget.model == null
                              ? "Upload Product"
                              : "Update This Product", () async {
                          print("add data execution started");
                          var id = Uuid().v4();
                          FirebaseFirestore.instance
                              .collection("Lost")
                              .doc(id)
                              .set({
                            'userId': "userId",
                            'name': "name",
                            'phone': "phone",
                            'collectorUserId': "collectorUserId",
                            'collectorName': "collectorName",
                            'collectorPhone': "collectorPhone",
                            'handoverTo': "handoverTo",
                            'image': "image",
                            'itemName': "itemName",
                            'description': "description",
                            'location': "location",
                            'locationSpecific': "locationSpecific",
                            'reportList': "reportList",
                            'handoverLocation': "handoverLocation",
                            'status': "Lost",
                            'rewardAmount': "rewardAmount",
                            'timestamp': DateTime.now(),
                            'id': "iD",
                          }).then((value) {
                            Navigator.pop(context);
                          });
                        }, context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isLoading = false;
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  Future<void> _pickImage(String companyName) async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        var f = await image.readAsBytes();

        setState(() {
          _pickedImage = selected;
        });
        setState(() {
          isLoading = true;
          webImage = f;
          _pickedImage = File('a');
          uploadFileToFirebase(fileName: companyName, imageFile: webImage)!
              .then((value) {
            setState(() {
              isLoading = false;
              imageUrll = value;
              print(imageUrll.toString() + "is proof");
            });
            // print(value);
          });
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          isLoading = true;
          webImage = f;
          _pickedImage = File('a');
          uploadFileToFirebase(fileName: companyName, imageFile: webImage)!
              .then((value) {
            setState(() {
              isLoading = false;
              imageUrll = value;
            });
            // print(value);
          });
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }
}
