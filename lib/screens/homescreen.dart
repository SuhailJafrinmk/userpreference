import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preference/screens/loginscreen.dart';
import 'package:user_preference/screens/splashscreen.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});
  Future<String> getUserDetails()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String username=prefs.getString(loginPageState.KEYUSERNAME) ?? 'no username';
    String password=prefs.getString(loginPageState.KEYPASSWORD) ?? 'no password';
    return username;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 221, 236, 247),
        title: const Text('Home page'),
      ),
      body: FutureBuilder(future: getUserDetails(), builder: ((context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done){
          if(snapshot.hasData){
            return Center(
              child: Container(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width * .8999,
                child: Card(
                  color: const Color.fromARGB(255, 101, 166, 220),
                  elevation: 20,
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      const CircleAvatar(radius: 50,    child: Icon(Icons.supervised_user_circle_outlined,size: 50,),),
                      Text('Welcome ${snapshot.data}',style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),),
                      const SizedBox(height: 50,),
                      ElevatedButton(onPressed: ()async{
                        var sharedpref=await SharedPreferences.getInstance();
                        sharedpref.setBool(splashScreenState.KEYLOGIN, false);
                  
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return const loginPage();
                        }));
                      }, child: const Text('Signout')),
                    ],
                  ),
                ),
              
              ),
            );
          }else{
            return const Center(
              child: Text('no user data available'),
            );
          }
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      })),
    );
  }
}