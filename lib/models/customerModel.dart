class Customermodel {
  String name;
  String phone;
  String? email;
  String? buisnessname;
  String? address;
  String? gstin;
  List<Map<String, dynamic>>? orders = [];
  Customermodel(
      {required this.name,
      required this.phone,
      this.email,
      this.buisnessname,
      this.address,
      this.gstin,
      this.orders});

  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'phone': phone,
      'email': email ?? "",
      'buisnessname': buisnessname ?? "",
      'address': address ?? "",
      'gstin': gstin ?? "",
      'orders': orders ?? [],
    };
  }

  static Customermodel fromJson(Map<String, dynamic> json) {
    return Customermodel(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      buisnessname: json['buisnessname'],
      address: json['address'],
      gstin: json['gstin'],
      orders: json['orders'],
    );
  }
}
