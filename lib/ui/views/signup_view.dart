import 'dart:ui';
import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/widgets/busy_button.dart';
import 'package:flutter_gawlah/ui/widgets/expansion_list.dart';
import 'package:flutter_gawlah/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter_gawlah/view_models.dart/signup_view_model.dart';
import 'package:shimmer/shimmer.dart';




class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  String imagee;

  @override
  Widget build(BuildContext context) {
   
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModel: SignUpViewModel(),
      builder: (context, model, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home: Scaffold(
        
            backgroundColor: Color.fromRGBO(38, 47, 62, 1),
          body: Container(
          // color: Colors.white,
             child: Stack(children:<Widget>[
                          ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Container(
                              color: Colors.black38.withOpacity(0.4),
                            ),
                          ),
                        ),


            
     SingleChildScrollView(child:

     Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
              
                Padding(padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Shimmer.fromColors(
                  period: Duration(milliseconds: 1500),
                  baseColor: Colors.blue[600],
                  //Color.fromRGBO(38, 47, 62, 1),
                  highlightColor:Colors.blue[900],
                    
                    child:  Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      
                    VSpacer(0.07),
                    Container(child:
                     Image.asset('images_and_icons/g_transparent.png'),height: 80,width: 60,),
                        ],
                      ),),

                ),
      
         
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  VSpacer(0.05),
                                                  Text(
                                                    'Sign Up',
                                                    style: TextStyle(
                                                      color:Colors.white,
                                                      fontSize: 45,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  verticalSpaceMedium,
                                                 
                                                 verticalSpaceMedium,
                                                  InputField(
                                                   // color: Colors.white,
                                                    placeholder: 'Full Name',
                                                    controller: fullNameController,
                                                  ),
                                                  verticalSpaceSmall,
                                                  InputField(
                                                      //  color: Colors.white,
                                                    placeholder: 'Email',
                                                    controller: emailController,
                                                  ),
                                                  verticalSpaceSmall,
                                                  InputField(
                                                     //   color: Colors.white,
                                                    placeholder: 'Password',
                                                    password: true,
                                                    controller: passwordController,
                                                    additionalNote:
                                                        '   Password has to be a minimum of 6 chars.',
                                                  ),
                                                  verticalSpaceSmall,
                                                  ExpansionList<String>(
                                                    
                                                      items: ['Admin', 'User'],
                                                      
                                                      title: model.selectedRole,
                                                      onItemSelected: model.setSelectedRole),
                                                  verticalSpaceMedium,
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      BusyButton(
                                                        title: 'Sign Up',
                                                        busy: model.busy,
                                                        onPressed: () {
                                                          model.signUp(
                                                              email: emailController.text,
                                                              password: passwordController.text,
                                                              fullName: fullNameController.text);
                                                        },
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
          ),
                                        //  ),
                                      )])))));
                                  
                               
                              
                              
                                }
                              
                                String imge(String image) {
                                  if(image==null){
                                    return image="images_and_icons/g_transparent.png";
                                  }
                                  else
                                  return
                                  image=image;
                                }

//   Future cam() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();

//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;
//   return firstCamera;
// }
}
