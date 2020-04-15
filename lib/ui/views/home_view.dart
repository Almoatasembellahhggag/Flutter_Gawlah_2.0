import 'package:flutter/material.dart';
import 'package:flutter_gawlah/auth.dart';
import 'package:flutter_gawlah/models/post.dart';
import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/views/stratup_view.dart';
import 'package:flutter_gawlah/ui/widgets/post_item.dart';
import 'package:flutter_gawlah/view_models.dart/home_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
class HomeView extends StatelessWidget {
  //const HomeView({Key key}) : super(key: key);
final AuthService _authService=AuthService();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: HomeViewModel(),
        onModelReady: (model) => model.listenToPosts(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
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

                    verticalSpace(35),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                          child: Image.asset('images_and_icons/g_transparent.png'),
                        ),
                        horizontalSpaceMedium,
                        FlatButton.icon(
                          icon:Icon(Icons.person),
                          label:Text('logout'),
                          onPressed: () {
                            print("hiiiiii");
                            model.signOut();
                          }
                                                      
                          
                                                  
                                                  )
                          
                                                ],
                                              ),
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
                                                      : Center(
                                                          child: CircularProgressIndicator(
                                                            valueColor: AlwaysStoppedAnimation(
                                                                Theme.of(context).primaryColor),
                                                          ),
                                                        ))
                          
                                            ],
                                          ),
                                        ),
                          
                                      )
                                      )
                                      ;
                            }
                          
                          
                      
                            
}