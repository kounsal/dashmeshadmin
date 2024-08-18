import 'package:dashmeshadmin/models/imdbModel.dart';
import 'package:dashmeshadmin/screens/addCustomer.dart';
import 'package:dashmeshadmin/services/databaseService.dart';
import 'package:flutter/material.dart';

class Viewcustomer extends StatefulWidget {
  const Viewcustomer({super.key});

  @override
  State<Viewcustomer> createState() => _ViewcustomerState();
}

class _ViewcustomerState extends State<Viewcustomer> {
  Stream? customer;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    // get data from firebase
    DatabaseService().getCustomerData().then((value) {
      setState(() {
        customer = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddCustomerPage()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('View Customers'),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.add),
        //     onPressed: () {
        //       // Navigator.push(
        //       //     context, MaterialPageRoute(builder: (context) => AddCustomer()));
        //     },
        //   ),
        //   SizedBox(
        //     width: 30,
        //   )
        // ],
      ),
      body: StreamBuilder(
          stream: customer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No Customers Found'),
              );
            }
            final customerData = snapshot.data.docs;
            return ListView.builder(
              itemCount: customerData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      "${index + 1}",
                    ),
                  ),
                  title: Text(
                    customerData[index]['name'],
                  ),
                  subtitle: Text(
                    customerData[index]['phone'],
                  ),
                  trailing: Icon(Icons.edit),
                );
              },
            );
          }),
    );
  }
}
