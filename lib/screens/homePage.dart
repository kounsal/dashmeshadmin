import 'package:dashmeshadmin/screens/addCategory.dart';
import 'package:dashmeshadmin/screens/addProduct.dart';
import 'package:dashmeshadmin/screens/generatePdf.dart';
import 'package:dashmeshadmin/screens/otpLogin.dart';
import 'package:dashmeshadmin/screens/viewCustomer.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

List myGridElements = [
  ["Add Product", AddProduct(), Icons.add],
  ["Add Category", AddCategory(), Icons.category],
  ["View/Create Orders", OtploginScreen(), Icons.shopping_cart],
  ["View/Add Customers", Viewcustomer(), Icons.people],
  ["View Enquires", OtploginScreen(), Icons.support_agent_outlined],
  ["Manage Stock", OtploginScreen(), Icons.warehouse],
  ["View/Edit Products", OtploginScreen(), Icons.view_list],
  ["View/Edit Categories", OtploginScreen(), Icons.category],
  ["View/Add Admins", OtploginScreen(), Icons.person],
  ["View/Generate Reports", OtploginScreen(), Icons.analytics],
  ["View/Generate Bills", GeneratePdf(), Icons.receipt],
  ["View/Generate Challans", OtploginScreen(), Icons.receipt_long],
  ["View/Generate Delivery Challans", OtploginScreen(), Icons.request_quote],
];

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;

    // Determine the number of columns based on screen width
    int crossAxisCount;
    if (screenWidth < 600) {
      crossAxisCount = 2; // Small screens like phones
    } else if (screenWidth < 900) {
      crossAxisCount = 3; // Medium screens like small tablets
    } else {
      crossAxisCount = 6; // Large screens like tablets and desktops
    }

    // Adjust child aspect ratio based on orientation
    double childAspectRatio =
        orientation == Orientation.portrait ? 1 / 1.2 : 1 / 1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dashmesh Plastic Admin Panel',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: myGridElements.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Theme.of(context).primaryColor,
            margin: const EdgeInsets.all(10),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
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
                  Icon(
                    myGridElements[index][2],
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    myGridElements[index][0],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
