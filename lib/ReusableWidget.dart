import 'package:flutter/material.dart';

TextField ReusableTextField(String text, IconData icon , bool isPasswordType,TextEditingController controller){
  return TextField(controller: controller,
    obscureText: false,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.redAccent,
    style: TextStyle(color: Colors.redAccent.withOpacity(0.9)),
    decoration: InputDecoration(prefixIcon: Icon(icon, color: Colors.redAccent),
        labelText: text,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 0,
                style: BorderStyle.none)
        )
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(BuildContext context , bool isLogin, Function onTap){
  return Container(width: MediaQuery.of(context).size.width,height: 50,
    margin: const EdgeInsets.fromLTRB(0 , 10 , 0 , 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      child: Text(
        isLogin ?'LOG IN' : 'SIGN IN',
        style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if(states.contains(MaterialState.pressed)){
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
      ),
    ),
  );
}