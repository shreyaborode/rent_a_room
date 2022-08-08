import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'ReusableWidget.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class AuthService{
  final auth = FirebaseAuth.instance;
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController _passwordTextController = new TextEditingController();
  TextEditingController _emailTextController = new TextEditingController();
  TextEditingController _userNameTextController = new TextEditingController();
  TextEditingController _phoneNumberTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xffffffff),
                Color(0xffffffff),
                Color(0xffffffff),
                Color(0xffd8d8d8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height *0.2, 20,0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 90,
                  child: Image.asset("images/login2.png",fit: BoxFit.contain),),
                SizedBox(height: 10),
                const SizedBox(height: 20),
                ReusableTextField("User Name", Icons.person_outline, false , _userNameTextController),
                const SizedBox(height: 20),
                ReusableTextField("Email Id", Icons.mail_lock, false , _emailTextController),
                const SizedBox(height: 20),
                ReusableTextField("Password", Icons.lock_outline, false, _passwordTextController),
                const SizedBox(height: 20),
                ReusableTextField("Phone Number", Icons.phone, false, _phoneNumberTextController),
                SizedBox(height: 20),
                signInSignUpButton(context, false, (){

                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                      password: _passwordTextController.text).then((value) {
                    FirebaseFirestore.instance.collection('UserData').doc(value.user?.uid).set(
                        {
                          "name": _userNameTextController.text,
                          "password": _passwordTextController.text,
                          'email': _emailTextController.text,
                          'phone': _phoneNumberTextController.text
                        });


                    print("Created New Account");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HouseScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}