class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String liked;
  final int review;
  final String email;

  UserData({this.uid, this.liked, this.review, this.name,this.email});
}
