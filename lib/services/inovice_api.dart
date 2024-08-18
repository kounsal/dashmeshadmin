import 'dart:io';
import 'package:dashmeshadmin/models/customerModel.dart';
import 'package:dashmeshadmin/models/invoice.dart';
import 'package:dashmeshadmin/services/pdf_api.dart';
import 'package:dashmeshadmin/utils/util.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:pdf/pdf.dart';

class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    final pdf = pw.Document();

    // Load the Google Font
    final ttf = await rootBundle.load('assets/fonts/NotoSans-Regular.ttf');
    final font = pw.Font.ttf(ttf);

    pdf.addPage(pw.MultiPage(
      margin: const pw.EdgeInsets.all(1 * PdfPageFormat.cm),
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        pw.Center(
            child: pw.Text("TAX INVOICE",
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, font: font))),
        pw.SizedBox(height: 1 * PdfPageFormat.mm),
        pw.Container(
            height: PdfPageFormat.a4.height - 3.5 * PdfPageFormat.cm,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.black, width: 1),
            ),
            child: pw.Column(children: [
              buildHeader(invoice, font),
              // pw.SizedBox(height: 1.5 * PdfPageFormat.cm),
              buildInvoice(invoice, font),

              buildTotal(invoice, font),
            ])),
      ],
    ));

    return PdfApi.saveDocument(name: '${invoice.info.number}.pdf', pdf: pdf);
  }

  static pw.Widget buildHeader(Invoice invoice, pw.Font font) => pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Column(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black, width: 1),
                ),
                width: PdfPageFormat.a4.availableWidth / 1.8,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Container(
                      height: 50,
                      width: 50,
                      child: pw.Text("DP",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 30,
                              font: font)),
                    ),
                    buildSupplierAddress(font),
                  ],
                ),
              ),
              pw.Container(
                height: 4.5 * PdfPageFormat.cm,
                padding:
                    const pw.EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black, width: 1),
                ),
                width: PdfPageFormat.a4.availableWidth / 1.8,
                child: buildCustomerAddress(invoice.customer, font),
              ),
            ],
          ),
          pw.Column(
            // crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(10),
                decoration: const pw.BoxDecoration(
                  border: pw.Border.symmetric(
                    horizontal: pw.BorderSide(color: PdfColors.black, width: 1),
                  ),
                ),
                width: PdfPageFormat.a4.width - (11.5 * PdfPageFormat.cm),
                child: buildInvoiceInfo(invoice.info, font),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.only(top: 5),
                height: 4.5 * PdfPageFormat.cm,
                width: 4.5 * PdfPageFormat.cm,
                child: pw.BarcodeWidget(
                  barcode: pw.Barcode.qrCode(),
                  data: invoice.info.number,
                ),
              ),
              // pw.Container(
              //   padding: const pw.EdgeInsets.all(10),
              //   decoration: const pw.BoxDecoration(
              //     border: pw.Border.symmetric(
              //       horizontal: pw.BorderSide(color: PdfColors.black, width: 1),
              //     ),
              //   ),
              //   width: PdfPageFormat.a4.width - (11.5 * PdfPageFormat.cm),
              //   // child: buildSupplierAddress(font),
              // ),
            ],
          ),
        ],
      );

  static pw.Widget buildCustomerAddress(Customermodel customer, pw.Font font) =>
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Buyer", style: pw.TextStyle(font: font, fontSize: 10)),
          pw.Text(customer.name,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Text(customer.address ?? "", style: pw.TextStyle(font: font)),
        ],
      );

  static pw.Widget buildInvoiceInfo(InvoiceInfo info, pw.Font font) {
    final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Invoice Number:',
      'Invoice Date:',
      'Payment Terms:',
      'Due Date:'
    ];
    final data = <String>[
      info.number,
      Utils.formatDate(info.date),
      paymentTerms,
      Utils.formatDate(info.dueDate),
    ];

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 200, font: font);
      }),
    );
  }

  static pw.Widget buildSupplierAddress(pw.Font font) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("DASHMESH OVERSEAS INDIA",
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: font)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(
              "WZ 283/89, Maddi Wali Gali, \nVishnu Garden, New Delhi - 110018",
              style: pw.TextStyle(font: font)),
          pw.Text("GSTIN: 07AABCD1234E1Z5", style: pw.TextStyle(font: font)),
          pw.Text("State: Delhi", style: pw.TextStyle(font: font)),
          pw.Text("E-Mail: amarkounsal@gmail.com",
              style: pw.TextStyle(font: font)),
        ],
      );

  static pw.Widget buildInvoice(Invoice invoice, pw.Font font) {
    double calculateTotalGst(List items, double gstRate) {
      double totalGst = 0.0;
      for (var item in items) {
        final total = item.unitPrice * item.quantity;
        final gst = total * gstRate;
        totalGst += gst;
      }
      return totalGst;
    }

    const double gstRate = 0.09; // Example GST rate, replace with actual rate
    final double totalGst = calculateTotalGst(invoice.items, gstRate);
    final headers = [
      'S.No.',
      'Description',
      'HSN/SAC',
      'Quantity',
      'Rate',
      'Per',
      'Amount'
    ];
    final data = invoice.items.map((item) {
      final total = item.unitPrice * item.quantity;

      return [
        '${invoice.items.indexOf(item) + 1}.',
        item.description,
        "123456",
        '${item.quantity}',
        '${item.unitPrice}',
        'nos',
        (total.toStringAsFixed(2)),
      ];
    }).toList();

    final data2 = <List<String>>[];
    data2.add(
      [
        '', // Empty cell for the first column
        'SGST 9%', // Description for the GST row
        '', // Empty cell for the 3rd column
        '', // Empty cell for the 4th column
        '', // Empty cell for the 5th column
        '', // Empty cell for the 6th column
        (totalGst.toStringAsFixed(2)), //
      ],
    );
    data2.add(
      [
        '', // Empty cell for the first column
        'CGST 9%', // Description for the GST row
        '', // Empty cell for the 3rd column
        '', // Empty cell for the 4th column
        '', // Empty cell for the 5th column
        '', // Empty cell for the 6th column
        (totalGst.toStringAsFixed(2)), //
      ],
    );

    return pw.Column(children: [
      pw.TableHelper.fromTextArray(
        cellHeight: 30,
        headers: headers,
        data: data,
        border: pw.TableBorder.all(width: 1, color: PdfColors.black),
        headerStyle: pw.TextStyle(
            fontWeight: pw.FontWeight.bold, font: font, fontSize: 10),
        headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
        cellAlignments: {
          0: pw.Alignment.centerRight,
          1: pw.Alignment.centerLeft,
          2: pw.Alignment.centerRight,
          3: pw.Alignment.centerRight,
          4: pw.Alignment.centerRight,
          5: pw.Alignment.centerRight,
          6: pw.Alignment.centerRight,
        },
        columnWidths: const {
          0: pw.FlexColumnWidth(0.7),
          1: pw.FlexColumnWidth(6), // Custom width for Description
          2: pw.FlexColumnWidth(2), // Custom width for Quantity
          3: pw.FlexColumnWidth(2), // Custom width for Unit Price
          4: pw.FlexColumnWidth(1.7), // Custom width for GST
          5: pw.FlexColumnWidth(0.85),
          6: pw.FlexColumnWidth(2), // Custom width for Total
        },
      ),
      pw.TableHelper.fromTextArray(
        data: data2,
        cellHeight: 30,
        border: pw.TableBorder.all(width: 1, color: PdfColors.black),
        cellAlignments: {
          0: pw.Alignment.centerRight,
          1: pw.Alignment.centerRight,
          2: pw.Alignment.centerRight,
          3: pw.Alignment.centerRight,
          4: pw.Alignment.centerRight,
          5: pw.Alignment.centerRight,
          6: pw.Alignment.centerRight,
        },
        columnWidths: const {
          0: pw.FlexColumnWidth(0.7),
          1: pw.FlexColumnWidth(6), // Custom width for Description
          2: pw.FlexColumnWidth(2), // Custom width for Quantity
          3: pw.FlexColumnWidth(2), // Custom width for Unit Price
          4: pw.FlexColumnWidth(1.7), // Custom width for GST
          5: pw.FlexColumnWidth(0.85),
          6: pw.FlexColumnWidth(2), // Custom width for Total
        },
      ),
    ]);
  }

  static pw.Widget buildTotal(Invoice invoice, pw.Font font) {
    final netTotal = invoice.items
        .map((item) => item.unitPrice * item.quantity)
        .reduce((item1, item2) => item1 + item2);
    // final vatPercent = invoice.items.first.vat;
    final sgst = netTotal * 0.09;
    final total = netTotal + sgst + sgst;

    return pw.Container(
      alignment: pw.Alignment.centerRight,
      child: pw.Row(
        children: [
          pw.Spacer(flex: 6),
          pw.Expanded(
            flex: 4,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Net total',
                  value: Utils.formatPrice(netTotal),
                  unite: true,
                  font: font,
                ),
                buildText(
                  title: 'SGST 9%',
                  value: Utils.formatPrice(sgst),
                  unite: true,
                  font: font,
                ),
                buildText(
                  title: 'CGST 9%',
                  value: Utils.formatPrice(sgst),
                  unite: true,
                  font: font,
                ),
                pw.Divider(),
                buildText(
                  title: 'Total amount due',
                  titleStyle: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                    font: font,
                  ),
                  value: Utils.formatPrice(total),
                  unite: true,
                  font: font,
                ),
                pw.SizedBox(height: 2 * PdfPageFormat.mm),
                pw.Container(height: 1, color: PdfColors.grey400),
                pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
                pw.Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget buildText({
    required String title,
    required String value,
    double width = double.infinity,
    pw.TextStyle? titleStyle,
    bool unite = false,
    required pw.Font font,
  }) {
    final style =
        titleStyle ?? pw.TextStyle(fontWeight: pw.FontWeight.bold, font: font);

    return pw.Container(
      width: width,
      child: pw.Row(
        children: [
          pw.Expanded(child: pw.Text(title, style: style)),
          pw.Text(value, style: pw.TextStyle(font: font)),
        ],
      ),
    );
  }
}
