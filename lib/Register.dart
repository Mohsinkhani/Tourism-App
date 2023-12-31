// ignore: invalid_language_version_override
//@dart=2.9;
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tour4you/login.dart';
import 'auth.dart';
import 'home.dart';
// import 'tearm_and_conditions.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

// ignore: camel_case_types
class _registerState extends State<register> {
  bool isChecked = false;
  bool value = false;
  String chkError = "";
  void initState() {
    super.initState();

    ///get current user and assign his id
    // FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
    //   setState(() {
    //     uid = user.uid;
    //     print(uid);
    //   });
    // });
    // _checkCurruntUser();
    //FirebaseAuth.instance.signOut();
  }
  // void _checkCurruntUser() { User? user = FirebaseAuth.instance.currentUser;
  //  //_updateUser(user);
  //   }

  final AuthService _auth = AuthService();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  final nameController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  String erorr = "";
  String name = "";
  String email = "";
  String password = "";
  String confirmpassword = "";
  String massege = "";
  String contact = "";
  String address = "";
  bool valueFirst = false;
  bool valueSecond = false;
  @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   super.setState(fn);
  //   int len = 0;
  //   if (email != null) {
  //     len = email.length;
  //   } else {
  //     len = 0; //return value if str is null
  //   }
  //   if (password != null) {
  //     len = password.length;
  //   } else {
  //     len = 0; //return value if str is null
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[220],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: MaterialButton(
          child: const Icon(Icons.arrow_back),
          textColor: Color(0xff29235c),
          padding: EdgeInsets.all(5),
          shape: CircleBorder(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          //height: 160,
                          ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Sign up",
                            style: TextStyle(
                                color: Color(0xff29235c),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RobotoMono-VariableFont_wght')),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: "Full Name",
                              hintText: "Enter Your Full Name",
                              prefixIcon: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(Icons.person,
                                      color: Color(0xff29235c)))),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Please Enter your name!"),
                          ])),
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
                              hintText: "Enter Your Email",
                              prefixIcon: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(Icons.email,
                                      color: Color(0xff29235c)))),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Please Enter your Email"),
                            EmailValidator(errorText: "Input Should be Email")
                          ])),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter Your Password",
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xff29235c))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Password";
                          }
                          confirmpassword = value;
                          print(value);
                        },
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: confirmpasswordController,
                        decoration: InputDecoration(
                            labelText: "Confirm Password",
                            hintText: "Enter Password Again",
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xff29235c))),
                        onChanged: (value) {
                          setState(() {
                            confirmpassword = value;
                          });
                        },
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Confirm Password";
                          }
                          if (value != confirmpassword) {
                            return "Confirm Password not Matching";
                          }
                          print(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: addressController,
                        keyboardType: TextInputType.streetAddress,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            labelText: "Address",
                            hintText: "Address",
                            prefixIcon: Icon(Icons.navigation,
                                color: Color(0xff29235c))),
                        onChanged: (value) {
                          setState(() {
                            address = value;
                          });
                        },
                        validator: (val) => val!.length < 10
                            ? "Address Should be Complete"
                            : null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: contactController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Contact",
                            hintText: "Enter Your Contact NO",
                            prefixIcon:
                                Icon(Icons.phone, color: Color(0xff29235c))),
                        onChanged: (value) {
                          setState(() {
                            contact = value;
                          });
                        },
                        validator: (val) =>
                            val!.length < 11 ? "Enter valid number" : null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: this.value,
                              onChanged: (value) {
                                setState(() {
                                  this.value = value!;
                                });
                              }),
                          InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             TermsAndConditions()));
                              },
                              child: Text("Terms and condition"))
                        ],
                      ),
                      value
                          ? Container()
                          : Text(
                              chkError,
                              style: TextStyle(color: Colors.red),
                            ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        // ignore: deprecated_member_use
                        child: ElevatedButton(
                          onPressed: () async {
                            if (value == false) {
                              setState(() {
                                chkError =
                                    "Please accept our term and conditions";
                              });
                            }
                            if (formkey.currentState!.validate() &&
                                value == true) {
                              // ignore: unused_local_variable
                              dynamic result =
                                  await _auth.RegisterWithEmailAndPassword(
                                          email, password, context)
                                      .then((value) async {
                                User? user = FirebaseAuth.instance.currentUser;
                                await FirebaseFirestore.instance
                                    .collection("User")
                                    .doc(user!.uid)
                                    .set({
                                  'name': name,
                                  'email': email,
                                  'password': password,
                                  'address': address,
                                  'Contact': contact,
                                  'uid': user.uid,
                                  'image': "",
                                  'role': "User",
                                  //'uid': uid
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => login()));
                                // Navigator.pushNamed(context, '/login');
                                //.doc(user.uid)
                                // .set({});
                              });
                              //registeration();
                            }
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          //color: Color(0xff29235c),
                          //splashColor: Colors.white,
                          //textColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   // ignore: deprecated_member_use
                      //   child: RaisedButton(
                      //     onPressed: () {
                      //       // Navigator.push(
                      //       //     context,
                      //       //     MaterialPageRoute(
                      //       //         builder: (context) => home()));
                      //     },
                      //     child: Text("Go Back to home"),
                      //     color: Colors.redAccent,
                      //     splashColor: Colors.white,
                      //     textColor: Colors.white,
                      //   ),
                      // ),

                      // Text(
                      //   erorr,
                      //   style: TextStyle(color: Colors.redAccent),
                      // ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
