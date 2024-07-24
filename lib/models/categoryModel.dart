import 'package:dashmeshadmin/models/productmodel.dart';

class Categorymodel {
  String name;
  String image;
  String code;
  List<Productmodel> products = [];
  Categorymodel({required this.name, required this.image, required this.code});
}
