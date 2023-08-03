import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class Post_successful extends StatefulWidget {
  const Post_successful({Key? key}) : super(key: key);

  @override
  State<Post_successful> createState() => _Post_successfulState();
}

class _Post_successfulState extends State<Post_successful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 280,),
            Container(
              alignment: Alignment.center,
              height: 150,
              width: 200,
              child: Image.asset('images/5sec.gif',),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Container(
                child: Text('Ad successfully posted',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                ),),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent.shade200,
              ),
              height: 40,
              width: 90,
              child: InkWell(
                child: Center(child: Text("OK",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HouseScreen()));},
              ),
            )
          ],
        ),
      ),
    );
  }
}