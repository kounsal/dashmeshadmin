import 'package:dashmeshadmin/models/customerModel.dart';

class Invoice {
  final InvoiceInfo info;
  // final Supplier supplier;
  final Customermodel customer;
  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    // required this.supplier,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {
  final int sno;
  final String description;
  final DateTime date;
  final int quantity;
  final double vat;
  final double unitPrice;

  const InvoiceItem({
    required this.sno,
    required this.description,
    required this.date,
    required this.quantity,
    required this.vat,
    required this.unitPrice,
  });
}
