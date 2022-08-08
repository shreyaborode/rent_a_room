
import 'dart:developer';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shreya_flutter/SignIn.dart';
import 'package:shreya_flutter/SignUp.dart';
import 'package:shreya_flutter/main.dart';
import 'package:shreya_flutter/users.dart';
import 'HomeScreen.dart';
import 'SearchList.dart';
import 'about.dart';
import 'categories.dart';
import 'contactUs.dart';
import 'favourite.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/img1.jpg'),
          AssetImage('images/img3.jpg'),
          AssetImage('images/img4.jpg'),
          AssetImage('images/img5.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 0.0,
        indicatorBgPadding: 0.0,

      ),
    );

    final currentUser = FirebaseAuth.instance;
    Future<Map<String, dynamic>?> _showData() async {
      var  document = await FirebaseFirestore.instance.collection('UserData').doc(currentUser.currentUser!.uid).get();
      Map<String,dynamic>? value = document.data();
      return value;
    }

    Future logout() async {
      await FirebaseAuth.instance.signOut()
          .then((value) => Navigator.of(context)
          .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInScreen()),
              (route) => false)
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.redAccent,
        title: Text('Rent A Room'),
        actions: <Widget>[
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchList()));}, icon: Icon(Icons.search_rounded))
        ],

      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            FutureBuilder<Map<String, dynamic>?>(
              future: _showData(),
              builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                if(snapshot.hasData){
                  return
                  ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      itemBuilder: (context,i){
                        var data = snapshot.data!;
                        return UserAccountsDrawerHeader(
                          accountName: Text(data['name']),
                          accountEmail: Text(data['email']
                          ),

                          currentAccountPicture: GestureDetector(
                            child: new CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          decoration: new BoxDecoration(
                            color: Colors.redAccent,
                          ),

                        );
                      });

                }else{
                  return CircularProgressIndicator();
                }
              },
            ),





            // StreamBuilder(
            //     stream: FirebaseFirestore.instance.collection("UserData")
            //         .where("uid", isEqualTo: currentUser.currentUser!.uid)
            //         // .doc(currentUser.currentUser!.uid)
            //         .snapshots(),
            //     builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
            //
            //       if(snapshot.hasData){
            //
            //         return ListView.builder(
            //             itemCount: snapshot.data!.docs.length,
            //             shrinkWrap: true,
            //             itemBuilder: (context,i){
            //               var data = snapshot.data!.docs[i];
            //               return UserAccountsDrawerHeader(
            //                   accountName: Text(data['name']),
            //                   accountEmail: Text(data['email']
            //                   ),
            //
            //                 currentAccountPicture: GestureDetector(
            //                   child: new CircleAvatar(
            //                     backgroundColor: Colors.grey,
            //                     child: Icon(
            //                       Icons.person_outline,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                 ),
            //                 decoration: new BoxDecoration(
            //                   color: Colors.redAccent,
            //                 ),
            //
            //               );
            //             });
            //
            //       }else{
            //         log("Snapshot data not found");
            //         return CircularProgressIndicator();
            //       }
            //     }),



            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HouseScreen()),
                );
              },
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home,color: Colors.redAccent),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.account_circle_outlined,color: Colors.redAccent),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Favourite()),
                );
              },
              child: ListTile(
                title: Text('Favorite'),
                leading: Icon(Icons.favorite_border,color: Colors.redAccent),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()),
                );
              },
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard_customize_outlined,color: Colors.redAccent),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){

              },
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.redAccent),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => About()),
                );
              },
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.lightBlueAccent,),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => contactUs()),
                );
              },
              child: ListTile(
                title: Text('Contact Us'),
                leading: Icon(Icons.phone, color: Colors.lightBlueAccent,),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){
                  logout();
              },
              child: ListTile(
                title: Text('Sign Out',
                    style: TextStyle(color: Colors.redAccent),
                ),
                leading: Icon(Icons.logout_outlined, color: Colors.redAccent,),
              ),
            ),

          ],
        ),
      ),
      body:  Column(
        children: [
          image_carousel
        ],
      ),
    );
  }
}



