
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preference/screens/homescreen.dart';
import 'package:user_preference/screens/splashscreen.dart';
import 'package:user_preference/widgets/customtextformfield.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final formkey=GlobalKey<FormState>();
  final TextEditingController usernamecontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login',style: GoogleFonts.poppins(fontSize: 50,fontWeight: FontWeight.w500,color: Colors.white),),
                  Text('Welcome back',style: GoogleFonts.poppins(fontSize: 30,fontWeight: FontWeight.w400,color: Colors.white),),
                ],
              ),
            ),
            Expanded(child: Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 207, 222, 238),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
              ),
              child: Form(
                key: formkey,
                child:
               Column(
                children: [
                  const SizedBox(height: 40,),
                  customTextForm(hintText: 'Enter your user name',
                   controller:usernamecontroller,
                   isVisible: false,
                   validator: (value){
                    if(value==null||value.isEmpty){
                     return 'please enter a value';
                    }else{
                      return null;
                    }
                   } ,
                    ),
                   const SizedBox(height: 20,),
                   customTextForm(hintText: 'Enter your password',
                    controller: passwordcontroller,
                    isVisible: true,
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return 'please enter a value';
                      }else{
                        return null;
                      }
                    } ,
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        elevation: 10,

                      ),
                      onPressed: ()async{
                        if(formkey.currentState?.validate() ?? false){
                        print('else condition is working');
                          var sharedpref=await SharedPreferences.getInstance();
                          sharedpref.setBool(splashScreenState.KEYLOGIN, true);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homeScreen()));
                        }else{
                          print('form not valid');
                        }
                      },
                     child: const Text('Submit'))
                ],
              )),
            ))
          ],
        ),
      ),
    );
  }
}