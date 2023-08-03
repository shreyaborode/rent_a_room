import 'dart:developer';
import 'list.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shreya_flutter/SignIn.dart';
import 'package:shreya_flutter/SignUp.dart';
import 'package:shreya_flutter/main.dart';
import 'package:shreya_flutter/setting_page.dart';
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
        title: Text('Mess App'),
        actions: <Widget>[
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>List()));}, icon: Icon(Icons.search_rounded))
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()),
                );
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            image_carousel,

            SizedBox(height: 20,
              child: Divider(color: Colors.black54,),),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              //height: 80,
              decoration: BoxDecoration(
                color: Color(0xff4a3298),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text.rich(
                  TextSpan(
                      text: 'Special offer\n',style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                            text: 'Cashback 20%',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400)
                        )
                      ]
                  )
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Categories',style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500
                  ),),
                  SizedBox(width: 130,),
                  Text('Scroll for more',style: TextStyle(color: Colors.black54),)
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Image.asset('images/img5.jpg'),
                  title: Text('Rooms',style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.w400),),
                  trailing: Icon(Icons.arrow_forward_outlined),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Image.asset('images/img5.jpg'),
                  title: Text('Flats',style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.w400),),
                  trailing: Icon(Icons.arrow_forward_outlined),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Image.asset('images/img5.jpg'),
                  title: Text('Houses',style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.w400),),
                  trailing: Icon(Icons.arrow_forward_outlined),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Image.asset('images/img5.jpg'),
                  title: Text('View All',style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.w400),),
                  trailing: Icon(Icons.arrow_forward_outlined),
                  onTap: (){},
                ),
              ),
            ),
            SizedBox(
              child: Divider(),
            ),

            SizedBox(
              height: 50,
              child: Divider(color: Colors.grey,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Future scopes',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black54),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 160,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('images/google_maps.jpg',fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 10,),
                  Text('Users are able to locate the rooms using Google Maps',style: TextStyle(
                      color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w400
                  ),),
                  Divider(color: Colors.grey,),
                  SizedBox(height: 15,),
                  Container(
                    height: 160,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('images/Upi.jpg',fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 10,),
                  Text('Payments are directly done in the Application',style: TextStyle(
                      color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w400
                  ),),
                  Divider(color: Colors.grey,),
                  SizedBox(height: 15,),
                  Container(
                    height: 160,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('images/otp.jpg',fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 10,),
                  Text('Verify the user using OTP',style: TextStyle(
                      color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w400
                  ),),
                  Divider(color: Colors.grey,),
                  SizedBox(height: 15,),
                  Container(
                    height: 160,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('images/chatbot.jpg',fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 10,),
                  Text('Implementing Chatbots..',style: TextStyle(
                      color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w400
                  ),),
                  SizedBox(height: 50,)
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}



