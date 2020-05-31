import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/models/place.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/widgets/input_field.dart';
import 'package:flutter_gawlah/view_models.dart/create_place_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

class CreatePlaceView extends StatelessWidget {
  final titleController = TextEditingController();
  // final titleController2 = TextEditingController();
  final titleControllerid = TextEditingController();
  // final titleControllercenter = TextEditingController();
  final titleControllerplacetype = TextEditingController();
  final titleControllerperiod = TextEditingController();
  final titlecontrollerinfo = TextEditingController();
  // final titleControllerImage = TextEditingController();
  // final titleControllerpoints = TextEditingController();
  final titleControllertours = TextEditingController();
  final titleControllertype = TextEditingController();
  final Place edittingPost;
  // final String image;
  // final GeoPoint center;
  // final String name;

  CreatePlaceView({Key key, this.edittingPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String latt=edittingPost.center.latitude as String;
    // final String longg=edittingPost.center.longitude as String;
    // titleController.text = name;
    final AuthenticationService _authenticationService =
        locator<AuthenticationService>();

    // Future<String> centerr(String name) async {
    //   DocumentSnapshot ds =
    //       await Firestore.instance.collection('tours').document(name).get();
    //   return ds.data['center'].toString();
    // }

    // Future<String> imge(String name) async {
    //   DocumentSnapshot ds =
    //       await Firestore.instance.collection('tours').document(name).get();
    //   return ds.data['image'].toString();
    // }
//var centerrr=Firestore.instance.collection('tours').where("name",isEqualTo:titleController.text);
    // GeoPoint fcenter=GeoPoint(lat, long);

    return ViewModelProvider<CreatePlaceViewModel>.withConsumer(
        viewModel: CreatePlaceViewModel(),
        onModelReady: (model) {
          // update the text in the controller
          titleController.text = edittingPost?.name ?? '';
          //titleController2.text = edittingPost?.type ?? '';
          titleControllerid.text = edittingPost?.idd ?? '';
          titleControllerperiod.text = edittingPost?.period ?? '';
          titleControllerplacetype.text = edittingPost?.placetype ?? '';
          titleControllertype.text = edittingPost?.type ?? '';
          titleControllertours.text = edittingPost?.tourss ?? '';
          titlecontrollerinfo.text = edittingPost?.infoo ?? '';
          titlecontrollerinfo.text = edittingPost?.info ?? '';

          model?.setEdittingPost(edittingPost);

          //debugPrint(edittingPost.name);
          //debugPrint(edittingPost.type);
        },
        builder: (context, model, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                child: !model.busy
                    ? Icon(Icons.add)
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                onPressed: () {
                  //  debugPrint(titleController2.text + "nnnnn");

                  if (!model.busy) {
                    if (edittingPost == null) {
                      model.updateDataaa(
                        period: titleControllerperiod.text,
                        placetype: titleControllerplacetype.text,
                        type: titleControllertype.text,
                        name: titleController.text,
                        idd: titleControllerid.text,
                        tourss: titleControllertours.text,
                        tours: titleControllertours.text,
                        info: titlecontrollerinfo.text,
                        infoo: titlecontrollerinfo.text,
                      );
                    } else {
                      // debugPrint(Firestore.instance.collection('tours').document().documentID);
                      model.updateDataaedit(
                        info: titlecontrollerinfo.text,
                        tours: titleControllertours.text,
                        tourss: titleControllertours.text,
                        period: titleControllerperiod.text,
                        placetype: titleControllerplacetype.text,
                        idd: titleControllerid.text,
                        name: titleController.text,
                        type: titleControllertype.text,
                        infoo: titlecontrollerinfo.text,
                      );
                    }
                    //  center: GeoPoint(double.parse(titleControllerlat.text), double.parse(titleControllerlong.text)));
                    // model.addPost(likedplaces:titleController2.text);
                  }
                },
                backgroundColor: !model.busy
                    ? Theme.of(context).primaryColor
                    : Colors.grey[600],
              ),
              body: list(context),
            ));
  }

  list(BuildContext context) {
    if (edittingPost == null) {
      return Container(
          // color: Colors.white,
          child: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          verticalSpace(20),
          Text(
            'Create New Tour',
            style: TextStyle(fontSize: 26),
          ),

          verticalSpaceMedium,
          InputField(
            placeholder: 'Name',
            controller: titleController,
          ),
          verticalSpaceSmall,
          InputField(
            placeholder: 'Type',
            controller: titleControllertype,
          ),

          verticalSpaceSmall,
          InputField(
            placeholder: 'Tour ID',
            controller: titleControllerid,
          ),
          verticalSpaceSmall,
          InputField(
            placeholder: 'period',
            controller: titleControllerperiod,
          ),
          verticalSpaceSmall,
          InputField(
            placeholder: 'place type',
            controller: titleControllerplacetype,
          ),
          verticalSpaceSmall,
          InputField(placeholder: 'tours', controller: titleControllertours),
          verticalSpaceSmall,
          InputField(placeholder: 'info', controller: titlecontrollerinfo),

          //  RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(name: titleController.text,)))

          //  ,child: Text("Select Image"),),
          verticalSpaceSmall,
          // RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(id:_authenticationService.currentUser.id))))
        ],
      )));
    } else {
      return Container(
          // color: Colors.white,
          child: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          verticalSpace(20),
          Text(
            'Create New Tour',
            style: TextStyle(fontSize: 26),
          ),

          verticalSpaceMedium,
          InputField(
            placeholder: 'Name',
            controller: titleController,
          ),

          InputField(
            placeholder: 'Type',
            controller: titleControllertype,
          ),
          verticalSpaceSmall,
          InputField(
            placeholder: 'Tour ID',
            controller: titleControllerid,
          ),
          verticalSpaceSmall,
          InputField(
            placeholder: 'period',
            controller: titleControllerperiod,
          ),
          verticalSpaceSmall,
          InputField(
            placeholder: 'place type',
            controller: titleControllerplacetype,
          ),
          verticalSpaceSmall,
          InputField(
            placeholder: 'tours',
            controller: titleControllertours,
          ),
          verticalSpaceSmall,
          InputField(placeholder: 'info', controller: titlecontrollerinfo),

          //  RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(name: titleController.text,)))

          //  ,child: Text("Select Image"),),
          verticalSpaceSmall,
        ],
      )));
    }
  }
}
