import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'ReusableWidget.dart';
import 'SignUp.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
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


                  SizedBox(height: 120,
                    child: Image.asset("images/house.png",fit: BoxFit.contain),
                  ),

                  SizedBox(height: 20),
                  ReusableTextField("Enter User Name", Icons.person_outline, false, _emailTextController),

                  SizedBox(height: 30),

                  ReusableTextField("Enter Password", Icons.lock_outline, false, _passwordTextController),

                  SizedBox(height: 5),

                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  signInSignUpButton(context, true, (){
                    FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text,
                        password: _passwordTextController.text).then((value) {
                      print("Login Successful !!");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HouseScreen()));
                    });
                  }),
                  SignUpOption()
                ],
              ),
            ),
          ),
        )
    );
  }

  Row SignUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account ?",
          style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));

          },
          child: const Text(" Sign Up",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold)),
        )

      ],
    );
  }
}