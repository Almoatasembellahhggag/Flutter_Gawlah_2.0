import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/Tours/likedmodel.dart';
import 'package:flutter_gawlah/Tours/tour_view.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/map_widgets/map.dart';
import 'package:flutter_gawlah/models/liked.dart';
import 'package:flutter_gawlah/models/user.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
import 'package:flutter_gawlah/services/dialog_service.dart';
import 'package:flutter_gawlah/services/firestore_service.dart';
import 'package:flutter_gawlah/services/navigation_service.dart';
import 'package:flutter_gawlah/view_models.dart/homeplace_view_model.dart';
import 'package:provider_architecture/viewmodel_provider.dart';





class TourCard extends StatelessWidget {
  final Map Tour;
  final List<String>saved;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
        locator<AuthenticationService>();

     User edittingPost;

  bool liked=false;
  List<String>likedlist;

  
int index =0;

  


  TourCard(this.Tour, this.saved);


  

  @override
  Widget build(BuildContext context) {


     
    GeoPoint mylocation=new GeoPoint(29.962696, 31.276942);
    return 
    
    
    
    InkWell(
      child: _crearContenedor(context),
      onLongPress: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TourView(image:Tour['image'],info:Tour['info'],name: Tour['name'],rate:Tour['rate']
              ,tourid: Tour['id'], image3D: Tour['image3D'],)));
                
                
                print(Tour['info']);
                //PlacePolylinePage(
                     // tour_id: Tour['id'],
                      //centre: Tour['center'],
                   // )
                   // ));
                   
      },
      onTap: (){
 Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlacePolylinePage(
                     tourid: Tour['id'],
                      centre: 
                      //mylocation,
                      Tour['center'],
                   )
                   ));




      },
    );
  }

  Widget _crearContenedor(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 600,
        height: 700,
        child: Container(
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(30, 0, 0, 0),
                    offset: Offset(0.0, 10.0),
                    spreadRadius: 0,
                    blurRadius: 10)
              ]),
          child: Card(
              elevation: 1,
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  _Hero(),
                  Column(
                    children: <Widget>[
                      Container(margin: EdgeInsets.only(top: 10)),
                      _crearHeader(),
                      Expanded(child: Container()),
                      createname(context),
                    ],
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
        ),
      ),
    );
  }

  Widget _crearHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            children: <Widget>[
              
            ],
          ),
        ),
      ],
    );
  }

  Widget _Hero() {
    return Hero(
      child: Image.network(Tour['image'],fit: BoxFit.fill,),
      tag:Tour['image'] ,
    );
    
  }

  Widget createname(BuildContext context) {

      return ViewModelProvider<LikedViewModel>.withConsumer(
        viewModel:LikedViewModel(),
        onModelReady: (model) {

//   this.saved = edittingPost?.likedtours ?? null;
        
//  model?.setEdittingPost(edittingPost);
        },
        builder: (context, model, child) =>
    Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      width: MediaQuery.of(context).size.width * 0.6,
      child: Wrap(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text(
                Tour['name'],
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 37, color: Color.fromRGBO(230, 230, 230, .8),
         
      ),
                    //
              ),
              
              IconButton(icon:Icon(
      liked? Icons.favorite:Icons.favorite_border,
    color:liked ?Colors.red:Colors.grey),
    onPressed: ()=>{_pressed(context,Tour['name']),debugPrint(saved.join(',')),model.addPost(likedtours: saved)}
            
              )  
            ],
          ),
        ],
      ),
    ));
  }

   _pressed(BuildContext context,String name){
    
   liked=!liked; 
  
                            (context as Element).markNeedsBuild();
   saved.add(Tour['name']);
   debugPrint(saved.join(','));

  }
  }













