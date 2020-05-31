
// import 'package:flutter_gawlah/constants/route_names.dart';
// import 'package:flutter_gawlah/locator.dart';
// import 'package:flutter_gawlah/models/post.dart';
// import 'package:flutter_gawlah/models/user.dart';
// import 'package:flutter_gawlah/services/authentication_service.dart';
// import 'package:flutter_gawlah/services/dialog_service.dart';
// import 'package:flutter_gawlah/services/firestore_service.dart';
// import 'package:flutter_gawlah/services/navigation_service.dart';
// import 'package:flutter_gawlah/view_models.dart/base_model.dart';

// //import '../locator.dart';

// class BrewListViewModel extends BaseModel {
//   final NavigationService _navigationService = locator<NavigationService>();
//   final FirestoreService _firestoreService = locator<FirestoreService>();
//   final DialogService _dialogService = locator<DialogService>();
//   // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//     final AuthenticationService _authenticationService =
//    locator<AuthenticationService>();
 

//   List<User> _posts;
//   List<User> get posts => _posts;

//   List<Post>_postpost;
//   List<Post> get postspots => _postpost;

//   void listenToPosts() {
//     setBusy(true);

//     _firestoreService.listenToPostsRealTimepost().listen((postsData) {
//       List<User> updatedPosts = postsData;
//       if (updatedPosts != null && updatedPosts.length > 0) {
//         _posts = updatedPosts;
//         notifyListeners();
//       }

//       setBusy(false);
//     });
//   }


//     void listenToPostss() {
//     setBusy(true);

//     _firestoreService.listenToPostsRealTimepost().listen((postsData) {
//       List<Post> updatedPosts = postsData;
//       if (updatedPosts != null && updatedPosts.length > 0) {
//         _postpost = updatedPosts;
//         notifyListeners();
//       }

//       setBusy(false);
//     });
//   }

//   Future deletePost(int index) async {
//     var dialogResponse = await _dialogService.showConfirmationDialog(
//       title: 'Are you sure?',
//       description: 'Do you really want to delete the post?',
//       confirmationTitle: 'Yes',
//       cancelTitle: 'No',
//     );

//     if (dialogResponse.confirmed) {
//       setBusy(true);
//       await _firestoreService.delete(_postpost[index].documentId);
//       setBusy(false);
//     }
//   }

//   // Future navigateToCreateView() async {
//   //   await _navigationService.navigateTo(CreatePostViewRoute);
//   // }

//     Future navigateToCreateView() async {
//     await _navigationService.navigateTo(CreatePostViewRoute);
//   }



//   void editPost(int index) {
// _navigationService.navigateTo(CreatePostViewRoute,
//         arguments: _postpost[index]);
//   }

//  Future signOut()async{
// try {
//   return{await _authenticationService.signOut(),
//   _navigationService.navigateTo(LoginViewRoute)};

// }
// catch(e){

// return e.toString();
// }



// }
// }


// // import 'package:flutter_gawlah/constants/route_names.dart';
// // import 'package:flutter_gawlah/locator.dart';
// // import 'package:flutter_gawlah/services/navigation_service.dart';

// // import 'base_model.dart';

// // class HomeViewModel extends BaseModel {
// //   final NavigationService _navigationService = locator<NavigationService>();

// //   void navigateToCreateView() =>
// //       _navigationService.navigateTo(CreatePostViewRoute);
// // }
