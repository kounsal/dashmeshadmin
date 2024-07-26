import 'dart:io';

import 'package:dashmeshadmin/models/categoryModel.dart';
import 'package:dashmeshadmin/models/imdbModel.dart';
import 'package:dashmeshadmin/services/databaseService.dart';
import 'package:dashmeshadmin/services/imageupload.dart';
import 'package:dashmeshadmin/widgets/customtextfield.dart';
import 'package:dashmeshadmin/widgets/helperwidgets.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  File? _image;
  bool delay = true;
  bool loading = false;
  String txt = 'Choose Image';
  ImgbbResponseModel? imgbbResponse;
  final ImageService _imageService = ImageService();
  TextEditingController nameController = TextEditingController();
  DatabaseService databaseService =
      DatabaseService(uid: "2m4nQZPinrW5X5WuhvfwpilBFIu1"
          // FirebaseAuth.instance.currentUser!.uid,
          );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: double.maxFinite,
                child: Column(
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
                                icon: const Icon(Icons.add_a_photo),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: "Category Name",
                      textController: nameController,
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
                                try {
                                  Categorymodel categoryModel = Categorymodel(
                                    name: nameController.text,
                                    image: imgbbResponse!.data!.displayUrl!,
                                    code: "",
                                  );
                                  await databaseService
                                      .addCategory(categoryModel);
                                  showSnackBar(
                                      context, Colors.green, "Category Added");
                                  setState(() {
                                    loading = false;
                                  });
                                } catch (e) {
                                  setState(() {
                                    loading = false;
                                  });
                                  showSnackBar(
                                      context, Colors.red, e.toString());
                                }
                              }
                            } catch (e) {
                              showSnackBar(context, Colors.red, e.toString());
                              //     "Error Uploading Image, Try Again");
                            }
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
                              'Add Category',
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
}
