import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Settings'),
        elevation: 2,
      ),

      body: Center(
        child: Column(
          children: <Widget>[

            Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.dark_mode,size: 26,color: Colors.redAccent),
                  title: Text('Theme'),
                  trailing: LiteRollingSwitch(
                    value: true,
                    textOn: "Light",
                    textOff: "Dark",
                    colorOn: Colors.grey,
                    colorOff: Colors.black,
                    iconOn: Icons.sunny,
                    iconOff: Icons.dark_mode,
                    textSize: 14.0,
                    onChanged: (bool position) {
                      print("The theme is $position");
                    },
                  ),

                  onTap: (){},
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.key_off,size: 26,color: Colors.redAccent),
                  title: Text('Permissions'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: (){},
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.language,size: 26,color: Colors.redAccent,),
                  title: Text('Language'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: (){},
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.privacy_tip_outlined,size: 26,color: Colors.redAccent),
                  title: Text('Privacy'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: (){},
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.password_outlined,size: 26,color: Colors.redAccent),
                  title: Text('Passwords'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: (){},
                ),
              ),
            ),

          ],
        ),
      ),

    );

  }
}
