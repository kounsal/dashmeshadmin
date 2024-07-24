import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.textController,
    required this.paddinhorizontal,
    required this.paddingvertical,
  });

  final String text;
  final TextEditingController textController;
  final double paddinhorizontal, paddingvertical;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: paddinhorizontal, vertical: paddingvertical),
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
