import 'package:flutter_gawlah/Tours_Pager.dart';
import 'package:flutter_gawlah/models/post.dart';
import 'package:flutter_gawlah/ui/views/create_post_view.dart';

import '../ui/views/home_view.dart';
import 'package:flutter/material.dart';
import '../constants/route_names.dart';
import '../ui/views/login_view.dart';
import '../ui/views/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case CreatePostViewRoute:
    var postToEdit=settings.arguments as Post;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreatePostView(
          edittingPost: postToEdit,
        ),
      );

      case TourList2Route:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: TourList2(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}