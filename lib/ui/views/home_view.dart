// import 'package:flutter/material.dart';
// import 'package:flutter_gawlah/auth.dart';
// import 'package:flutter_gawlah/horizontalspace.dart';
// import 'package:flutter_gawlah/models/post.dart';
// import 'package:flutter_gawlah/models/user.dart';
// import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
// import 'package:flutter_gawlah/ui/views/stratup_view.dart';
// import 'package:flutter_gawlah/ui/widgets/post_item.dart';
// import 'package:flutter_gawlah/view_models.dart/home_view_model.dart';
// import 'package:provider_architecture/provider_architecture.dart';
// import 'package:flutter_gawlah/services/authentication_service.dart';

// class HomeView extends StatelessWidget {
//   //const HomeView({Key key}) : super(key: key);
//   final AuthService _authService = AuthService();
//   @override
//   Widget build(BuildContext context) {
//    // print(User().id);
//     return ViewModelProvider<HomeViewModel>.withConsumer(
//         viewModel: HomeViewModel(),
//         onModelReady: (model) => model.listenToPosts(),
//         builder: (context, model, child) => Scaffold(
//               backgroundColor: Colors.white,
//               floatingActionButton: FloatingActionButton(
//                 backgroundColor: Theme.of(context).primaryColor,
//                 child:
//                     !model.busy ? Icon(Icons.add) : CircularProgressIndicator(),
//                 onPressed: model.navigateToCreateView,
//               ),
//               body: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     verticalSpace(35),
//                     Row(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 40,
//                           child:
//                               Image.asset('images_and_icons/g_transparent.png'),
//                         ),
//                         HSpacer(0.56),
//                         FlatButton.icon(
//                             icon: Icon(Icons.person),
//                             label: Text('logout'),
//                             onPressed: () {
//                               print("hiiiiii");
//                               model.signOut();
//                             })
//                       ],
//                     ),
//                     Expanded(
                      
//                         child: model.posts != null 
//                             ? ListView.builder(
//                                 itemCount: model.posts.length,
//                                 itemBuilder: (context, index) =>
//                                     GestureDetector(
//                                   onTap: () => model.editPost(index),
//                                   child: PostItem(
//                                     post: model.posts[index],
//                                     onDeleteItem: () => model.deletePost(index),
//                                   ),
//                                 ),
//                               )
                              
//                             : Center(
//                                 child: CircularProgressIndicator(
//                                   valueColor: AlwaysStoppedAnimation(
//                                       Theme.of(context).primaryColor),
//                                 ),
//                               ))
//                   ],
//                 ),
//               ),
//             ));
//   }
// }
















































import 'package:flutter/material.dart';
import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/widgets/post_item.dart';
import 'package:flutter_gawlah/view_models.dart/home_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:shimmer/shimmer.dart';

import '../../verticalspacer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: HomeViewModel(),
        onModelReady: (model) => model.listenToPosts(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Color.fromRGBO(38, 47, 62, 1),
              floatingActionButton: FloatingActionButton(
                backgroundColor:Color.fromRGBO(38, 47, 62, 1),
                child:
                    !model.busy ? Icon(Icons.add) : CircularProgressIndicator(),
                onPressed: model.navigateToCreateView,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
              
                Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Shimmer.fromColors(
                  period: Duration(milliseconds: 1500),
                  baseColor: Colors.blue[600],
                  //Color.fromRGBO(38, 47, 62, 1),
                  highlightColor:Colors.blue[900],
                    
                    child:  Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      
                    VSpacer(0.05),
                    Container(child:
                     Image.asset('images_and_icons/g_transparent.png'),height: 70,width: 50,),
                        ],
                      ),),
                ),
                Text("Tours",style: TextStyle(color:Colors.white,fontSize: 50,fontFamily: "DancingScript"),),

                    Expanded(
                        child: model.posts != null
                            ? ListView.builder(
                                itemCount: model.posts.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () => model.editPost(index),
                                  child: PostItem(
                                    post: model.posts[index],
                                    onDeleteItem: () => model.deletePost(index),
                                  ),
                                ),
                              )
                            :  Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      Theme.of(context).primaryColor),
                                ),
                              ))
                  ],
                ),
              ),
            ));
  }
}














// import 'package:flutter/material.dart';
// import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
// import 'package:flutter_gawlah/ui/widgets/post_item.dart';
// import 'package:flutter_gawlah/view_models.dart/home_view_model.dart';
// import 'package:provider_architecture/provider_architecture.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelProvider<HomeViewModel>.withConsumer(
//         viewModel: HomeViewModel(),
//         onModelReady: (model) => model.listenToPostss(),
//         builder: (context, model, child) => Scaffold(
//               backgroundColor: Colors.white,
//               floatingActionButton: FloatingActionButton(
//                 backgroundColor: Theme.of(context).primaryColor,
//                 child:
//                     !model.busy ? Icon(Icons.add) : CircularProgressIndicator(),
//                 onPressed: model.navigateToCreateView,
//               ),
//               body: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     verticalSpace(35),
//                     Row(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 20,
//                           child: Image.asset('images_and_icons/g_transparent.png'),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                         child: model.postspots!= null
//                             ? ListView.builder(
//                                 itemCount: 6,
//                                 itemBuilder: (context, index) =>
//                                     GestureDetector(
//                                  onTap: () => model.editPost(index),
//                                   child: PostItem(
//                                     post: model.postspots[index],
//                                     onDeleteItem: () => model.deletePost(index),
//                                   ),
//                                 ),
//                               ):ListView.builder(
//                                 itemCount: 5,
//                                 itemBuilder: (context, index) =>
//                                     GestureDetector(
//                                  onTap: () => model.editPost(index),
//                                   child: PostItem(
//                                     post: model.postspots[index],
//                                     onDeleteItem: () => model.deletePost(index),
//                                   ),
//                                 ),
//                               ),)
//                             // : Center(
//                             //     child: CircularProgressIndicator(
//                             //       valueColor: AlwaysStoppedAnimation(
//                             //           Theme.of(context).primaryColor),
//                             //     ),
//                             //   ))
//                   ],
//                 ),
//               ),
//             ));
//   }
// }
