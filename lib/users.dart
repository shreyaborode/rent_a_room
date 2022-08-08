import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('My Profile'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                width: 150,
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage('images/img.png'),
                ),
                decoration: BoxDecoration(
                    shape:  BoxShape.circle,
                    border: Border.all(
                        color: Colors.redAccent,
                        width: 2.0
                    )
                ),
              ),

              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width*.4,
                child: Row(
                  children: [
                    Center(
                      child: Text('      Shreya ',style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),),
                    ),

                    SizedBox(
                      height: 18.0,
                      child: Image.asset('images/img_1.png'),
                    ),
                  ],
                ),
              ),
              Text('shreya@gmail.com',style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12
              ),),

              SizedBox(
                height: 10,
              ),
              Divider(color: Colors.redAccent,),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.account_circle_outlined,size: 26,),
                    title: Text('Edit Profile'),
                    trailing: Icon(Icons.arrow_forward_outlined),
                    onTap: (){},
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.share_rounded,size: 26,),
                    title: Text('Refer'),
                    trailing: Icon(Icons.arrow_forward_outlined),
                    onTap: (){},
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.account_balance_wallet_outlined,size: 25,),
                    title: Text('My Rewards'),
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