// import 'brew.dart';
// import 'package:flutter_gawlah/models/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseService {

//   final String id;
//   DatabaseService({ this.id });

//   // collection reference
//   final CollectionReference users = Firestore.instance.collection('Users');

//   Future<void> updateUserData(String  fullName, String userRole, int review,String likedplaces,String likedtours,String addcomment) async {
//     return await users.document(id).setData({
//         'id': id,
//       'fullName': fullName,
//       'userRole': userRole,
//       'likedplaces':likedplaces,
//       'likedtours':likedtours,
//       'addcomment':addcomment,
//       'review':review,
      
//     });
//   }

//   // brew list from snapshot
//   List<User> _brewListFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc){
//       //print(doc.data);
//       return User(
//         fullName: doc.data['fullName'] ?? '',
//         review: doc.data['review'] ?? 0,
//         likedplaces: doc.data['likedplaces'] ?? '0',
//         likedtours: doc.data['likedtours'] ?? '0',
//         userRole:doc.data['userRole']??'0'
//       );
//     }).toList();
//   }

//   // user data from snapshots
//   UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
//     return UserData(
//       id: id,
//       fullName: snapshot.data['fullName'],
//       likedtours: snapshot.data['likedtours'],
//       review: snapshot.data['review'],
//       likedplaces:snapshot.data['likedplaces'],
//       userRole: snapshot.data['userRole']
//     );
//   }

//   // get brews stream
//   Stream<List<User>> get brews {
//     return users.snapshots()
//       .map(_brewListFromSnapshot);
//   }

//   // get user doc stream
//   Stream<UserData> get userData {
//     return users.document(id).snapshots()
//       .map(_userDataFromSnapshot);
//   }

// }