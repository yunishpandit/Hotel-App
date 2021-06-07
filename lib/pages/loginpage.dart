import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotels/Auth/Authclass.dart';

class Loginpage extends StatefulWidget {

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  Authclass authclass=Authclass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: [
        Container(
          padding: EdgeInsets.all(150),
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/hotel6.jpg")),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(300)
            )
          ),
          child: Row(
            children: [
              Expanded(child: Text("Login",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),)),
            ],
          ),
          ),
          SizedBox(height: 10,),
           TextFormField(
              decoration: InputDecoration(
                focusColor: Colors.deepOrange,
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(20) ),
                hintText: "Enter your email",
              labelText: "Username",
              icon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              obscureText: true,    
              decoration: InputDecoration(
                focusColor: Colors.deepOrange,
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(20) ),
                hintText: "Enter your password",
              labelText: "Password",
              icon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
                child: Card(
                
                color: Colors.deepOrange,
                 child: Container(
                 height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child:Center(child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))) ,
                ),
              ),
            ),
            Center(child: Text("Or",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            SizedBox(height: 10,),
            InkWell(
              onTap: ()async{
               await authclass.googlesigin(context);
              },
               child: Card(
                   child: Container(
                     
                     height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("images/google1.png"),
                      ),
                      SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Login with google"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
                          child: Card(
                            
                   child: Container(
                     height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("images/facebook.png"),
                      ),
                      SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Login with facebook"),
                      ),
                    ],
                  ),
                ),
              ),
            )

          


        ],
      )
      
    );
  }
}