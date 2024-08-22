import 'package:dashmeshadmin/models/customerModel.dart';
import 'package:flutter/widgets.dart';

class EditCustomer extends StatefulWidget {
  final Customermodel customer;
  const EditCustomer({super.key, required this.customer});

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.customer.name),
    );
  }
}
