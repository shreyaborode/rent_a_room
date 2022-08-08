import 'package:flutter/material.dart';
import 'notify_route.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.redAccent,

      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 38,),
                  title: Text('New rooms posted in your location',style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Shreya Borode'),
                  trailing: Icon(Icons.arrow_forward_outlined,color: Colors.redAccent.shade100,),
                  onTap: (){},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 38,),
                  title: Text('Your next Rent due is 2 days away!!',style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('shreya@gmail.com'),
                  trailing: Icon(Icons.arrow_forward_outlined,color: Colors.redAccent.shade100,),
                  onTap: (){},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 38,),
                  title: Text('Someone showed interest in your property. View Profile',style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('shreya@gmail.com'),
                  trailing: Icon(Icons.remove_red_eye,color: Colors.redAccent.shade100,),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Notify_Route()));},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 38,),
                  title: Text('Your Ad is posted Succesfully..',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('shreya@gmail.com'),
                  trailing: Icon(Icons.schedule_sharp,color: Colors.redAccent.shade100,),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Notify_Route()));},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 38,),
                  title: Text('Someone is Interested in your Property',style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('rohit@gmail.com'),
                  trailing: Icon(Icons.schedule_sharp,color: Colors.redAccent.shade100,),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Notify_Route()));},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 38,),
                  title: Text('Details Updated',style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('shreya@gmail.com'),
                  trailing: Icon(Icons.remove_red_eye,color: Colors.redAccent.shade100,),
                  onTap: (){},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 38,),
                  title: Text("Request Accepted ",style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('of Soham'),
                  trailing: Icon(Icons.remove_red_eye,color: Colors.redAccent.shade100,),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Notify_Route()));},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 38,),
                  title: Text('Payment received',style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('from Soham'),
                  trailing: Icon(Icons.call_received,color: Colors.redAccent.shade100,),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Notify_Route()));},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 38,),
                  title: Text('Location permission required',style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('shreya@gmail.com'),
                  trailing: Icon(Icons.remove_red_eye,color: Colors.redAccent.shade100,),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Notify_Route()));},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 38,),
                  title: Text('Get your Profile verified',style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('shreya@gmail.com'),
                  trailing: Icon(Icons.remove_red_eye,color: Colors.redAccent.shade100,),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Notify_Route()));},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 38,),
                  title: Text('Welcome to Rent A Room',style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('shreya@gmail.com'),
                  trailing: Icon(Icons.remove_red_eye,color: Colors.redAccent.shade100,),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Notify_Route()));},
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}