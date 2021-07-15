import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:one_only/Screens/signIn_signUp_screen/signIn_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validateName = false,
      _validateUserId = false,
      _validateEmail = false,
      _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration Screen')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: userIdController,
                  onChanged: (text) {
                    setState(() {
                      text.isNotEmpty ? _validateUserId = false : null;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User ID',
                    hintText: 'Enter User ID',
                    errorText:
                        _validateUserId ? 'User Id can\'t be null' : null,
                  ),
                  // onChanged: (text){
                  //
                  // },
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                    controller: nameController,
                    onChanged: (text) {
                      setState(() {
                        text.isNotEmpty ? _validateName = false : null;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                      hintText: 'Enter Full Name',
                      errorText: _validateName ? 'Name can\'t be null' : null,
                    )),
              ),
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
                  child: Text('Sign Up'),
                  onPressed: () {
                    setState(() {
                      userIdController.text.isEmpty
                          ? _validateUserId = true
                          : _validateUserId = false;
                      nameController.text.isEmpty
                          ? _validateName = true
                          : _validateName = false;
                      emailController.text.isEmpty
                          ? _validateEmail = true
                          : _validateEmail = false;
                      passwordController.text.isEmpty
                          ? _validatePassword = true
                          : _validatePassword = false;
                      if (_validateUserId == false &&
                          _validateName == false &&
                          _validateEmail == false &&
                          _validatePassword == false) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(emailController.text);
                        bool passwordValid =
                            passwordController.text.length >= 6;
                        if (emailValid == true && passwordValid == true) {
                          // set up the AlertDialog
                          AlertDialog alert = AlertDialog(
                            title: Text("ID - ${userIdController.text}"),
                            content: Text(
                                "Name : ${nameController.text} \nEmail : ${emailController.text} \nPassword : ${passwordController.text}"),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have Account ",
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
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
