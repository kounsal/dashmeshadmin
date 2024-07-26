import 'dart:io';

import 'package:dashmeshadmin/models/imdbModel.dart';
import 'package:dashmeshadmin/models/productmodel.dart';
import 'package:dashmeshadmin/services/databaseService.dart';
import 'package:dashmeshadmin/services/imageupload.dart';
import 'package:dashmeshadmin/widgets/customtextfield.dart';
import 'package:dashmeshadmin/widgets/helperwidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? _image;
  bool delay = true;
  bool loading = false;
  String txt = 'Choose Image';
  ImgbbResponseModel? imgbbResponse;
  final ImageService _imageService = ImageService();
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController sizewidthController = TextEditingController();
  TextEditingController sizeheightController = TextEditingController();
  TextEditingController nosController = TextEditingController();
  DatabaseService databaseService =
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Container(
                height: double.maxFinite,
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            _image != null ? FileImage(_image!) : null,
                        child: _image == null
                            ? IconButton(
                                iconSize: 50,
                                onPressed: () async {
                                  _image = await _imageService.pickImage();
                                  if (_image != null) {
                                    setState(() {
                                      delay = false;
                                      loading = false;
                                    });
                                  }
                                },
                                icon: Icon(Icons.add_a_photo),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: "Product Name",
                      textController: nameController,
                      paddinhorizontal: MediaQuery.of(context).size.width * 0.1,
                      paddingvertical: 10,
                    ),
                    CustomText(
                      text: "Product Code/Category",
                      textController: codeController,
                      paddinhorizontal: MediaQuery.of(context).size.width * 0.1,
                      paddingvertical: 10,
                    ),
                    CustomText(
                      text: "Dimensions(Height)",
                      textController: sizeheightController,
                      paddinhorizontal: MediaQuery.of(context).size.width * 0.1,
                      paddingvertical: 10,
                    ),
                    CustomText(
                      text: "Dimensions(Width)",
                      textController: sizewidthController,
                      paddinhorizontal: MediaQuery.of(context).size.width * 0.1,
                      paddingvertical: 10,
                    ),
                    CustomText(
                      text: "Pieces/Box",
                      textController: nosController,
                      paddinhorizontal: MediaQuery.of(context).size.width * 0.1,
                      paddingvertical: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                        vertical: 20,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          if (nameController.text.isNotEmpty &&
                              codeController.text.isNotEmpty &&
                              sizewidthController.text.isNotEmpty &&
                              sizeheightController.text.isNotEmpty &&
                              nosController.text.isNotEmpty &&
                              _image != null) {
                            try {
                              setState(() {
                                loading = true;
                              });
                              var response =
                                  await _imageService.uploadImage(_image!);
                              imgbbResponse =
                                  ImgbbResponseModel.fromJson(response);
                              if (imgbbResponse!.status == 200) {
                                databaseService
                                    .addProduct(
                                  Productmodel(
                                    name: nameController.text,
                                    code: "FRFua4OaTpZ7Xw3KpNHQ",
                                    height: sizeheightController.text,
                                    width: sizewidthController.text,
                                    pieces: nosController.text,
                                    image: imgbbResponse!.data!.displayUrl!,
                                  ),
                                )
                                    .then((val) {
                                  setState(() {
                                    loading = false;
                                    nameController.clear();
                                    codeController.clear();
                                    sizeheightController.clear();
                                    sizewidthController.clear();
                                    nosController.clear();
                                    _image = null;
                                  });

                                  // Navigator.pop(context);
                                  showSnackBar(context, Colors.green,
                                      "Product Added Successfully");
                                });
                              }
                            } catch (e) {
                              setState(() {
                                loading = false;
                              });
                              showSnackBar(context, Colors.red, e.toString());
                            }

                            print("All fields are filled");
                            // ImdbModel imdbModel = ImdbModel(
                            //   name: nameController.text,
                            //   code: codeController.text,
                            //   sizeheight: sizeheightController.text,
                            //   sizewidth: sizewidthController.text,
                            //   nos: nosController.text,
                            //   imageUrl: imgbbResponse!.data.displayUrl,
                            // );
                            // print(imdbModel);
                          } else {
                            showSnackBar(
                                context, Colors.red, "All fields are required");
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Add Product',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    sizeheightController.dispose();
    sizewidthController.dispose();
    nosController.dispose();
    super.dispose();
  }
}
