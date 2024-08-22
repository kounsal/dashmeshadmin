import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashmeshadmin/models/categoryModel.dart';
import 'package:dashmeshadmin/models/customerModel.dart';
import 'package:dashmeshadmin/models/productmodel.dart';

class DatabaseService {
  String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('admins');
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('categories');
  final CollectionReference customerCollection =
      FirebaseFirestore.instance.collection('customers');

  Future savingUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      'fullName': fullName,
      'email': email,
      "uid": uid,
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();

    return snapshot;
  }

  Future gettingproductData(String code) async {
    QuerySnapshot snapshot =
        await productCollection.where("Pid", isEqualTo: code).get();

    return snapshot;
  }

  Future addProduct(Productmodel product) async {
    DocumentReference productDoc = await productCollection.add(
      {
        'name': product.name,
        'code': product.code,
        'size': {'width': product.width, 'height': product.height},
        'nos': product.pieces,
        'image': product.image,
        'Pid': "",
      },
    );
    await categoryCollection.doc(product.code).update({
      'Products': FieldValue.arrayUnion(["${productDoc.id}_${product.name}"])
    });
    await productDoc.update({'Pid': productDoc.id});

    return productDoc;
  }

  Future addCategory(Categorymodel catmodel) async {
    // Check if a category with the same name already exists
    try {
      QuerySnapshot snapshot = await categoryCollection
          .where("name", isEqualTo: catmodel.name)
          .get();

      if (snapshot.docs.isNotEmpty) {
        throw "Category with the same name already exists";
      } else {
        DocumentReference catDoc = await categoryCollection.add(
          {
            'name': catmodel.name,
            'image': catmodel.image,
            'Products': catmodel.products,
          },
        );

        await catDoc.update({'code': catDoc.id});

        return catDoc;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future addCustomer(Customermodel customerModel) async {
    // Check if a category with the same name already exists
    try {
      QuerySnapshot snapshot = await customerCollection
          .where("phone", isEqualTo: customerModel.phone)
          .get();

      if (snapshot.docs.isNotEmpty) {
        throw "Customer already exists";
      } else {
        DocumentReference custDoc = await customerCollection.add(
          {
            'name': customerModel.name,
            'phone': customerModel.phone,
            'email': customerModel.email ?? "",
            'buisnessname': customerModel.buisnessname ?? "",
            'address': customerModel.address ?? "",
            'gstin': customerModel.gstin ?? "",
            'orders': customerModel.orders ?? [],
          },
        );

        await custDoc.update({'custId': custDoc.id});

        return custDoc;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getCustomerData() async {
    return customerCollection.orderBy("name").snapshots();
  }
}
