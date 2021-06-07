import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotels/Auth/Authclass.dart';
import 'package:hotels/Auth/profilesetting.dart';
import 'package:hotels/pages/loginpage.dart';
import 'package:velocity_x/velocity_x.dart';
class Profilepage extends StatefulWidget {
  const Profilepage({ Key? key }) : super(key: key);

  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
 
  final _usernamecontoller=TextEditingController();
  final _emailcontroller=TextEditingController();
  var _isnotifaction=false;
  final  user =FirebaseAuth.instance.currentUser;
  Authclass authclass=Authclass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(   
      title: "Profile".text.black.make().centered() ,
      backgroundColor: Colors.white,
      elevation: 0.0,
    ),
     body: ListView(
       children: [
       Container(
         child: CircleAvatar(
           radius: 50,
          backgroundImage: NetworkImage(user!.photoURL!),
         ),
       ),
       SizedBox(height: 40,),
       TextFormField(
         controller: _usernamecontoller,
         decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
           hintText: "Name:${user!.displayName}",  
         ),
       ),
       SizedBox(height: 10,),
       TextFormField(
         controller: _emailcontroller,
         decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
           hintText: "Email:${user!.email}", 
         ),
       ),
       SizedBox(height: 10,),
       Divider(
         color: Colors.black,
       ),
       SwitchListTile(
         title: Text("Notifaction"), value:_isnotifaction ,
          onChanged: (newValue)=>setState(()=>_isnotifaction=newValue)
          ),
       
        SizedBox(height: 10,),
       InkWell(
         onTap: ()async{
          await authclass.logout();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
         },
                child: Card(
                  child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10)
             ),  
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Row(  
                 children: [
                   Icon(Icons.logout),
                   SizedBox(width: 20,),
                   Text("Logout",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                 ],
               ),
             ),
           ),
         ),
       ),
       TextButton(onPressed: saveprofile, child: Text("Save profile"))
       ],
     ),
    
    );
  }
  void saveprofile(){
      
         final newprofile=Setting(
           email: _emailcontroller.text,
           username: _usernamecontoller.text,
           isnotifaction: _isnotifaction
         
      
     );

   
  }
}