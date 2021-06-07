import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotels/Auth/Authclass.dart';
import 'package:hotels/bottombar.dart';
import 'package:hotels/pages/homepage.dart';
import 'package:hotels/pages/loginpage.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   Widget currentpage=Loginpage();
  Authclass authclass=Authclass();
  @override
   void initState() {
   
    super.initState();
     checklogin();
  }
    void checklogin()async{
    String? token= await authclass.gettoken();
    if(token!=null){
      setState(() {
        currentpage=Bottombar();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:currentpage,
      
    );
  }
}