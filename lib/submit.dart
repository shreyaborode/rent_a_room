import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class Submit extends StatefulWidget {
  const Submit({Key? key}) : super(key: key);

  @override
  State<Submit> createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){},
        ),
      ),

        body: Center(
        child: Column(
          children: <Widget>[
                Image.asset('images/img_4.png',
                height: 250,
                width: 250,
                ),
            SizedBox(height: 5,),
            Center(
              child: Text('Posted Successfully..',style: TextStyle(
                color: Colors.red,
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),),
            ),

            Padding(padding: EdgeInsets.only(top: 50.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
              child: Card(
                child: ListTile(
                  title: Text('Continue'),
                  trailing: Icon(Icons.arrow_forward_outlined),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HouseScreen()),
                    );
                  },
                ),
              ),
            ),
            ),
          ]
        )
      )
    );
  }
}
