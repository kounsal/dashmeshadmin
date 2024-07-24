
import 'package:dashmeshadmin/screens/addProduct.dart';
import 'package:dashmeshadmin/services/authservies.dart';

import 'package:dashmeshadmin/widgets/customtextfield.dart';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthServices firebaseServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "DASHMESH PLASTIC",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              CustomText(
                text: "Email",
                textController: emailController,
                paddinhorizontal: 20,
                paddingvertical: 10,
              ),
              CustomText(
                text: "Password",
                textController: passwordController,
                paddinhorizontal: 20,
                paddingvertical: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  firebaseServices
                      .loginUserwithEmaiandPassword(
                          emailController.text, passwordController.text)
                      .then((val) async {
                    if (val == true) {
                      // QuerySnapshot snap = await DatabaseService(
                      //         uid: FirebaseAuth.instance.currentUser!.uid)
                      //     .gettingUserData(emailController.text);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddProduct(),
                        ),
                      );
                    }
                  });
                },
                child: const Text("Login"),
              ),
            ],
          ),
          Container()
        ],
      ),
    );
  }
}
