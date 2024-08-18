import 'package:dashmeshadmin/models/customerModel.dart';
import 'package:dashmeshadmin/models/invoice.dart';
import 'package:dashmeshadmin/services/inovice_api.dart';
import 'package:dashmeshadmin/services/pdf_api.dart';
import 'package:flutter/material.dart';

class GeneratePdf extends StatefulWidget {
  const GeneratePdf({super.key});

  @override
  State<GeneratePdf> createState() => _GeneratePdfState();
}

class _GeneratePdfState extends State<GeneratePdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Pdf'),
      ),
      body: Center(
        child: ElevatedButton(
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
                for (var i = 0; i < 5; i++)
                  InvoiceItem(
                    description: 'Plastic',
                    date: DateTime.now(),
                    quantity: 3,
                    vat: 0.18,
                    unitPrice: 299.95,
                  ),
              ],
            );
            final pdfFile = await PdfInvoiceApi.generate(invoice);
            PdfApi.openFile(pdfFile);
          },
          child: const Text('Generate Pdf'),
        ),
      ),
    );
  }
}
