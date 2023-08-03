import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PropertyDetailScreen extends StatefulWidget {

  final DocumentSnapshot<Object?> course;

  PropertyDetailScreen(this.course);

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("${widget.course['city']}"),
        elevation: 2,
      ),

      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
       Container(
      height: 400.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          NetworkImage("${widget.course['cover img']}"),
          NetworkImage("${widget.course[' img']}"),

        ],
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 0.0,
        indicatorBgPadding: 0.0,

      ),
    ),

            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
              child: Container(
                alignment: Alignment.centerLeft,
                child: RichText(text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Rent - ',style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold,fontSize: 16)),
                      TextSpan(text: ("${widget.course['price']}"),style: TextStyle(color: Colors.black87))
                    ]
                )),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 4),
              child: Column(
                children: [
                 Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Description - ',style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold,fontSize: 16)),
                            TextSpan(text: ("${widget.course['discription']}"),style: TextStyle(color: Colors.black87))
                          ]
                      )),
                    ),
                  ),

                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Address - ',style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold,fontSize: 16)),
                            TextSpan(text: ("${widget.course['address']}"),style: TextStyle(color: Colors.black87))
                          ]
                      )),
                    ),
                  ),

                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'City - ',style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold,fontSize: 16)),
                            TextSpan(text: ("${widget.course['city']}"),style: TextStyle(color: Colors.black87))
                          ]
                      )),
                    ),
                  ),

                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'State - ',style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold,fontSize: 16)),
                            TextSpan(text: ("${widget.course['state']}"),style: TextStyle(color: Colors.black87))
                          ]
                      )),
                    ),
                  ),

                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Facilities - \n',style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold,fontSize: 16)),
                            TextSpan(text: ("${widget.course['facilities']}"),style: TextStyle(color: Colors.black87))
                          ]
                      )),
                    ),
                  ),

                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'T&C - \n',style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold,fontSize: 16)),
                            TextSpan(text: ("${widget.course['t&c']}"),style: TextStyle(color: Colors.black87))
                          ]
                      )),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 100,),

                ],
              ),
            ),
          ],
        ),
      ),



    );
  }
}
