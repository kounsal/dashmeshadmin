import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashmeshadmin/models/categoryModel.dart';
import 'package:dashmeshadmin/models/productmodel.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('admins');
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');
  final CollectionReference CategoryCollection =
      FirebaseFirestore.instance.collection('categories');

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

    await productDoc.update({'Pid': productDoc.id});

    return productDoc;
  }

  Future addCategory(Categorymodel catmodel) async {
    DocumentReference catDoc = await CategoryCollection.add(
      {
        'name': catmodel.name,
        'image': catmodel.image,
        'Products': catmodel.products,
      },
    );

    await catDoc.update({'code': catDoc.id});

    return catDoc;
  }
}
