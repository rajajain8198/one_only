import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:one_only/Screens/signIn_signUp_screen/signIn_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorName = "",
      errorMobileNumber = "",
      errorEmail = "",
      errorPassword = "";

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
                    controller: nameController,
                    onChanged: (text) {
                      setState(() {
                        errorName = "";
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                      hintText: 'Enter Full Name',
                      errorText: errorName.isNotEmpty ? errorName : null,
                    )),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: mobileNumberController,
                  onChanged: (text) {
                    setState(() {
                      errorMobileNumber = "";
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile Number',
                    hintText: 'Enter Mobile Number',
                    errorText:
                        errorMobileNumber.isNotEmpty ? errorMobileNumber : null,
                  ),
                ),
              ),
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
                      errorText:
                          errorPassword.isNotEmpty ? errorPassword : null,
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
                      nameController.text.isEmpty
                          ? errorName = "Name can't be null"
                          : null;
                      mobileNumberController.text.isEmpty
                          ? errorMobileNumber = "UserId can't be null"
                          : null;
                      emailController.text.isEmpty
                          ? errorEmail = "Email can't be null"
                          : null;
                      passwordController.text.isEmpty
                          ? errorPassword = "Password can't be null"
                          : null;
                      if (mobileNumberController.text.isNotEmpty &&
                          nameController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(emailController.text);
                        bool passwordValid =
                            passwordController.text.length >= 6;
                        if (mobileNumberController.text.length == 10) {
                          if (emailValid == true) {
                            if (passwordValid == true) {
                              AlertDialog alert = AlertDialog(
                                title:
                                    Text("ID - ${mobileNumberController.text}"),
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
                        } else {
                          setState(() {
                            errorMobileNumber =
                                "Mobile Number can't be less or more then 10 digit";
                          });
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
