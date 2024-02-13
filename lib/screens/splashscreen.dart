import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preference/screens/homescreen.dart';
import 'package:user_preference/screens/loginscreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => splashScreenState();
}

class splashScreenState extends State<splashScreen> {

  static const String KEYLOGIN='login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
          Colors.blue.shade900,
              Colors.blue.shade700,
              Colors.blue.shade500,
              Colors.blue.shade300,
          ])
        ),
        child:  Center(
          child: Text('SharedPreferences',
          style: GoogleFonts.bebasNeue(
            fontSize: 50,
            fontWeight: FontWeight.w900,
            color: Colors.black87
          ),
          ),

        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextScreen();
    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
    //     return loginPage();
    //   }));
    //  });
  }

  void nextScreen()async{

    var sharedpref=await SharedPreferences.getInstance();
    var isLoggedin=sharedpref.getBool(KEYLOGIN);
    print('in splash screen value of keylogin is ${sharedpref.getBool(KEYLOGIN)}');

   Timer(const Duration(seconds: 3), () {
      if(isLoggedin!=null){
        if(isLoggedin){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const homeScreen()));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const loginPage()));
        }
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const loginPage()));
      }
     });
  }

}