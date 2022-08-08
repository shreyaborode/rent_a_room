import 'package:flutter/material.dart';

class contactUs extends StatefulWidget {
  const contactUs({Key? key}) : super(key: key);

  @override
  State<contactUs> createState() => _contactUsState();
}

class _contactUsState extends State<contactUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Contact Us'),
          elevation: 2,
        ),

        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset('images/img_3.png',
                height: 300,
                width: 300,
              ),

              Container(
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.email,size: 26,color: Colors.redAccent,),
                    title: Text('Email Us'),
                    trailing: Icon(Icons.arrow_forward_outlined),
                    onTap: (){},
                  ),
                ),
              ),

              Container(
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.phone,size: 26,color: Colors.redAccent),
                    title: Text('Talk to Customer Executive'),
                    trailing: Icon(Icons.arrow_forward_outlined),
                    onTap: (){},
                  ),
                ),
              ),

            ],
          ),
        ),
        
      ),
    );
  }
}
