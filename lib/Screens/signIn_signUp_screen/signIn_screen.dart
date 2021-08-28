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
  String errorEmail = "", errorPassword = "";

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
                    errorEmail = "";
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter Email',
                  errorText: errorEmail.isNotEmpty ? errorEmail : null,
                )),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
                controller: passwordController,
                onChanged: (text) {
                  setState(() {
                    errorPassword = "";
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  errorText: errorPassword.isNotEmpty ? errorPassword : null,
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
                      ? errorEmail = "Email can't be null"
                      : null;
                  passwordController.text.isEmpty
                      ? errorPassword = "Password can't be null"
                      : null;
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailController.text);
                    bool passwordValid = passwordController.text.length >= 6;
                    if (emailValid == true) {
                      if (passwordValid == true) {
                        print("Email and Password valid");
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      } else {
                        setState(() {
                          errorPassword =
                              "Password must be greater or equal to 6 letter";
                        });
                      }
                    } else {
                      setState(() {
                        errorEmail = "Enter Correct Email";
                      });
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
