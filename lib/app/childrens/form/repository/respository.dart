import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:partnerts/app/shared/models/user.dart';

class Repository {
  Future<bool> guardarUsuarioEnFirestore(User user) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(user.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
