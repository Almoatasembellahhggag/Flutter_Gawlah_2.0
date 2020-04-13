import 'brew.dart';
import 'user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference users = Firestore.instance.collection('Users');

  Future<void> updateUserData(String  liked, String name, int review,String email) async {
    return await users.document(uid).setData({
      'liked': liked,
      'name': name,
      'review': review,
      'email':email,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Brew(
        name: doc.data['name'] ?? '',
        review: doc.data['review'] ?? 0,
        liked: doc.data['liked'] ?? '0'
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      liked: snapshot.data['liked'],
      review: snapshot.data['review'],
      email:snapshot.data['email']
    );
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return users.snapshots()
      .map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return users.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}