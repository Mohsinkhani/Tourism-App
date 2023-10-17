// ignore: invalid_language_version_override
//@dart=2.9;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tour4you/home.dart';

// import 'package:tourmate1/home.dart';
// import 'package:tourmate1/loading.dart';
// import 'package:tourmate1/login_admin.dart';
import 'Register.dart';
import 'auth.dart';

import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

dialogBox(BuildContext context, status, text) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(status,
              style: TextStyle(
                  color: status == "Error" ? Colors.redAccent : Colors.green)),
          content: Text(text),
        );
      });
}

// ignore: camel_case_types
class _loginState extends State<login> {
  void initState() {
    super.initState();
    FirebaseAuth.instance.signOut();
  }

  // ignore: unused_field
  final AuthService _auth = AuthService();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String error = "";
  String email = "";
  String password = "";
  String massege = "";
  bool isHiddenPassword = true;
  bool loading = false;

  String uid = "";
  final auth = FirebaseAuth.instance;
  login() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Myhome()));
      print(userCredential);
      dialogBox(context, "Success", "Login Successful!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() => loading = false);
        print('No user found for Given Email');
        dialogBox(context, "Error", "Emial Is InValid!");
      } else if (e.code == 'wrong-password') {
        setState(() => loading = false);
        print('Wrong Password');
        dialogBox(context, "Error", "Wrong Password");
      }
    }
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      print("ok");
    } else
      print("Error");
  }

  @override
  Widget build(BuildContext context) {
    // return loading
    //     ? Loading()
    //:
    return Scaffold(
      backgroundColor: Colors.grey[220],
      resizeToAvoidBottomInset: false,
      /*appBar: AppBar(
        title: Center(child: Text("")),
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: const Icon(Icons.arrow_back),
                      color: Color(0xff29235c),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10),
                      shape: CircleBorder(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    InkWell(
                      child: Text("Admin Login",
                          style: TextStyle(color: Colors.redAccent)),
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => LoginAdmin()));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              //height: 160,
                              ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Login",
                                style: TextStyle(
                                    color: Color(0xff29235c),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        'RobotoMono-VariableFont_wght')),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "Email",
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Icon(
                                        Icons.email,
                                        color: Color(0xff29235c),
                                      ))),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Please enter your Email"),
                                EmailValidator(
                                    errorText: "Input Should be Email")
                              ])),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: "Enter Your Password",
                                  prefixIcon: Icon(Icons.lock,
                                      color: Color(0xff29235c)),
                                  suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(Icons.visibility,
                                          color: Color(0xff29235c)))),
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              obscureText: isHiddenPassword,
                              validator: RequiredValidator(
                                  errorText: "Please Enter your Password!")),
                          SizedBox(
                            height: 30,
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 80,
                                // ignore: deprecated_member_use
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (formkey.currentState!.validate()) {
                                      setState(() => loading = true);
                                      login();
                                    }
                                  },
                                  child: Text(
                                    "Login",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  //color: Color(0xff29235c),
                                  //splashColor: Colors.white,
                                  //textColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Text(
                                  "Forget Your Password?",
                                  style: TextStyle(
                                      color: Color(0xff29235c),
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {},
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Not a Member?"),
                                  SizedBox(width: 5.0),
                                  InkWell(
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(color: Colors.redAccent),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  register()));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // SizedBox(
                          //   height: 10,
                          // ),

                          SizedBox(height: 20.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    // if (isHiddenPassword == true) {
    //   isHiddenPassword = false;
    // } else {
    //   isHiddenPassword = true;
    // }

    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
