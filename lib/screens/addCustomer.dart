import 'package:dashmeshadmin/models/customerModel.dart';
import 'package:dashmeshadmin/services/databaseService.dart';
import 'package:dashmeshadmin/widgets/customtextfield.dart';
import 'package:flutter/material.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  AddCustomerPageState createState() => AddCustomerPageState();
}

class AddCustomerPageState extends State<AddCustomerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Customer'),
        ),
        body: Column(
          children: [
            CustomText(
              text: "NAME *",
              textController: nameController,
              paddinhorizontal: 40,
            ),
            CustomText(
              text: "EMAIL",
              textController: emailController,
              paddinhorizontal: 40,
            ),
            CustomText(
              text: "PHONE *",
              textController: phoneController,
              paddinhorizontal: 40,
            ),
            CustomText(
              text: "ADDRESS",
              textController: addressController,
              paddinhorizontal: 40,
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty) {
                  Customermodel customer = Customermodel(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    address: addressController.text,
                  );
                  databaseService.addCustomer(customer);
                }
                // Add Customer
              },
              child: Text('Add Customer'),
            )
          ],
        ));
  }
}
