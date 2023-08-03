import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('About'),
          elevation: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('About / Rent A Room', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
          ),

              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.all(24),
                child: Text('Rent A Room is a one stop destination for all your property renting needs. Being the largest property renting platform of India, Rent A Room aims at providing a hassle free renting of the proprties accross the country. Rent A Room values resolve around giving consumers the ease in renting properties.',
                  style: TextStyle(fontSize: 15,),
                  textAlign: TextAlign.justify,
                ),
              ),

              SizedBox(
                height: 1,
              ),

              Container(
                padding: EdgeInsets.all(24),
                child: Text('Rent A Rooom is a platform between the property owner and the interested user in renting.',
                style: TextStyle(fontSize: 15,),
                  textAlign: TextAlign.justify,
                ),
              ),

            ],
          ),
        ),




      ),
    );
  }
}
