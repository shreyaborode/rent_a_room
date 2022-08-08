import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {

  TextEditingController searchController = TextEditingController();
  String search = "";

  navigateDetails(AsyncSnapshot post){

    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPages(post: post)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Recently added Rooms",style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.w500
        ),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10),

          Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(

                    child: TextField(
                      onChanged: (value){
                      },
                      controller: searchController,
                      decoration:  InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                          ),

                        ),

                        prefixIcon: Icon(Icons.search_outlined),
                        hintText: '   Search',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(width: 0,
                                style: BorderStyle.none)
                        ),
                        contentPadding: EdgeInsets.all(15.0),
                      ),
                    ),
                  ),
                ],
              )
          ),

          SizedBox(height : 10),

          Expanded(

            child : Padding(
              padding: EdgeInsets.all(8),
              child: StreamBuilder<QuerySnapshot> (
                stream: FirebaseFirestore.instance.collection("Room Details").snapshots(),
                builder: (context, AsyncSnapshot snapshot){
                  return
                    ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index){
                        DocumentSnapshot course = snapshot.data!.docs[index];
                        return Card(
                          child: ListTile(
                            onTap: () {},// ONTAP
                            leading : Image.network(course['cover img']),
                            title: Text(course ['city']),
                            subtitle: Text(course['address']),
                            trailing: Text(course['price'],style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold,
                              color : Colors.redAccent,

                            ),),
                          ),

                        );
                      },
                    );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPages extends StatefulWidget {
  final AsyncSnapshot post ;
  DetailPages({required this.post});

  @override
  State<DetailPages> createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(widget.post.data['address']),
          subtitle: Text(widget.post.data['price']),
        ),
      ),
    );
  }
}