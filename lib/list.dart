import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'PropertyDetailScreen.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,

      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Room Details').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GestureDetector(

            child: ListView(
              children: snapshot.data!.docs.map((course){
                return Center(
                  child: GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PropertyDetailScreen(course)));},
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(height: 40,),
                          Container(
                            height: 200,
                            width: 300,
                            child:Image.network(course['cover img'],fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 18,),
                              Icon((Icons.location_on),color: Colors.black54,),
                              SizedBox(height: 10,),
                              Text(course['city'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                              SizedBox(width: 160,),
                              SmoothStarRating(size: 18,
                                  color: Colors.amber,
                                  borderColor: Colors.amber,
                                  spacing: 0,
                                  rating: 4.5),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24,bottom: 10),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(course['address'],style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}