import 'package:flutter/material.dart';
import 'package:one_only/Screens/signIn_signUp_screen/signUp_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreen createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validateEmail = false, _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
                controller: emailController,
                onChanged: (text) {
                  setState(() {
                    text.isNotEmpty ? _validateEmail = false : null;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter Email',
                  errorText: _validateEmail ? 'Email can\'t be null' : null,
                )),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
                controller: passwordController,
                onChanged: (text) {
                  setState(() {
                    text.isNotEmpty ? _validatePassword = false : null;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  errorText:
                      _validatePassword ? 'Password can\'t be null' : null,
                )),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Sign In'),
              onPressed: () {
                setState(() {
                  emailController.text.isEmpty
                      ? _validateEmail = true
                      : _validateEmail = false;
                  passwordController.text.isEmpty
                      ? _validatePassword = true
                      : _validatePassword = false;
                  if (_validateEmail == false && _validatePassword == false) {
                    bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailController.text);
                    bool passwordValid = passwordController.text.length >= 6;
                    if (emailValid == true && passwordValid == true) {
                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        title: Text("User ID - ${emailController.text}"),
                        content: Text(
                            "${emailController.text} \nPassword : ${passwordController.text}"),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("okay"),
                          )
                        ],
                      );

                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }
                  }

                });
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have account? ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              GestureDetector(
                child: Text(
                  "Click Here",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                          color: Colors.blueAccent,
                          offset: Offset(2, 1),
                          blurRadius: 10)
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
