import 'package:dashmeshadmin/services/authservies.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtploginScreen extends StatefulWidget {
  const OtploginScreen({super.key});

  @override
  State<OtploginScreen> createState() => _OtploginScreenState();
}

class _OtploginScreenState extends State<OtploginScreen> {
  TextEditingController otpController = TextEditingController();
  AuthServices firebaseServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: const Center(
          child: Text(
            "Page Under Construction",
            style: TextStyle(fontSize: 30),
          ),
        )
        //  Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Text(
        //       "Enter OTP",
        //       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        //     ),
        //     const SizedBox(
        //       height: 20,
        //     ),

        //     // OtpTextField(
        //     //   numberOfFields: 6,
        //     //   borderColor: Colors.black,
        //     //   focusedBorderColor: Colors.black,
        //     //   showFieldAsBox: true,
        //     //   keyboardType: TextInputType.number,
        //     //   onSubmit: (String pin) {
        //     //     otpController.text = pin;
        //     //   },
        //     // ),
        //     // ElevatedButton(
        //     //     // onPressed: () {
        //     //     //   firebaseServices.otpLogin(otpController.text);
        //     //     //   print(otpController.text);
        //     //     // },
        //     //     child: const Text("ss"))
        //   ],
        // ),

        );
  }
}
