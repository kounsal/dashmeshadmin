import 'dart:io';
import 'package:barcode_input_listener/barcode_input_listener.dart';
import 'package:dashmeshadmin/models/customerModel.dart';
import 'package:dashmeshadmin/models/invoice.dart';
import 'package:dashmeshadmin/services/databaseService.dart';
import 'package:dashmeshadmin/services/inovice_api.dart';
import 'package:dashmeshadmin/services/pdf_api.dart';
import 'package:flutter/material.dart';

class GeneratePdf extends StatefulWidget {
  const GeneratePdf({super.key});

  @override
  State<GeneratePdf> createState() => _GeneratePdfState();
}

class _GeneratePdfState extends State<GeneratePdf> {
  DatabaseService databaseService = DatabaseService();
  List<Map<String, dynamic>> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Pdf'),
      ),
      body: BarcodeInputListener(
        useKeyDownEvent: true,
        onBarcodeScanned: (barcode) async {
          if (barcode.endsWith('-e')) {
            String productId = barcode.substring(0, barcode.length - 2);
            var productData =
                await databaseService.gettingproductData(productId);

            if (productData != null && productData.docs.isNotEmpty) {
              bool barcodeExists =
                  products.any((product) => product['id'] == productId);

              setState(() {
                if (barcodeExists) {
                  int existingProductIndex = products
                      .indexWhere((product) => product['id'] == productId);
                  products[existingProductIndex]['quantity']++;
                  print('Barcode already exists');
                } else {
                  products.add({
                    'name': productData.docs[0]['name'],
                    'id': productId,
                    'price': productData.docs[0]['price'],
                    'quantity': 1,
                  });
                }
              });
            } else {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Product not found'),
                        content: const Text(
                            'The product with the given barcode does not exist in the database.'),
                        actions: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('No'),
                          ),
                        ],
                      ));
            }
          }
        },
        child: Column(
          children: [
            Platform.isAndroid ? const SizedBox(height: 50) : const SizedBox(),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(products[index]['name']),
                    subtitle: Row(
                      children: [
                        const Text('Quantity: '),
                        const SizedBox(width: 3),
                        IconButton(
                            onPressed: () {
                              if (products[index]['quantity'] > 1) {
                                setState(() {
                                  products[index]['quantity']--;
                                });
                              }
                            },
                            icon: const Icon(Icons.remove, size: 15)),
                        Text("${products[index]['quantity']}"),
                        const SizedBox(width: 3),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                products[index]['quantity']++;
                              });
                            },
                            icon: const Icon(Icons.add, size: 15)),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          products.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final date = DateTime.now();
                final dueDate = date.add(Duration(days: 7));
                final invoice = Invoice(
                  info: InvoiceInfo(
                    description: 'Invoice',
                    number: '${DateTime.now().year}-9999',
                    date: date,
                    dueDate: dueDate,
                  ),
                  customer: Customermodel(
                    name: 'Dashmesh Plastic',
                    address: 'Dashmesh Plastic, Ludhiana, Punjab',
                    phone: "+91 9876543210",
                  ),
                  items: [
                    for (var i = 0; i < 1; i++)
                      InvoiceItem(
                        sno: i + 1,
                        description: products[i]['name'],
                        date: DateTime.now(),
                        quantity: products[i]['quantity'],
                        vat: 0.18,
                        unitPrice: products[i]['price'].toDouble(),
                      ),
                  ],
                );
                final pdfFile = await PdfInvoiceApi.generate(invoice);
                PdfApi.openFile(pdfFile);
                PdfApi.sendEmailWithAttachment(
                    pdfFile, "singhkounsal@gmail.com");
              },
              child: const Text('Generate Pdf'),
            ),
          ],
        ),
      ),
    );
  }
}
