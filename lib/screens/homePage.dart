import 'package:dashmeshadmin/screens/addCategory.dart';
import 'package:dashmeshadmin/screens/addProduct.dart';
import 'package:dashmeshadmin/screens/otpLogin.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

List myGridElements = [
  ["Add Product", AddProduct(), Icons.add],
  ["Add Category", AddCategory(), Icons.category],
  ["View Enquires", OtploginScreen(), Icons.support_agent_outlined],
  ["Manage Stock", OtploginScreen(), Icons.warehouse],
  ["View/Edit Products", OtploginScreen(), Icons.view_list],
  ["View/Edit Categories", OtploginScreen(), Icons.category],
  ["View/Add Admins", OtploginScreen(), Icons.person],
];

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dashmesh Plastic Admin Panel',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 1 / 1.2,
        ),
        itemCount: myGridElements.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Theme.of(context).primaryColor,
            margin: const EdgeInsets.all(10),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => myGridElements[index][1],
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(myGridElements[index][2],
                        size: 40, color: Colors.white),
                    Text(
                      myGridElements[index][0],
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
