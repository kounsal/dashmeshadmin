import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    required this.textController,
    this.paddinhorizontal,
    this.paddingvertical,
  });

  final String text;
  final TextEditingController textController;
  double? paddinhorizontal, paddingvertical;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: paddinhorizontal ?? 10, vertical: paddingvertical ?? 10),
      child: TextField(
        obscureText: text == "Password" ? true : false,
        decoration: InputDecoration(
          label: Text(text),
          // hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        controller: textController,
      ),
    );
  }
}
