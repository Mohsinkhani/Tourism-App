import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour4you/userprofile.dart';

import 'Data Entry/drawer_firestore.dart';
import 'userProfile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // String userId = "";
  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    final color = Color(0xff29235c);
    final hovercolor = Color(0xff29235c);
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        textScaleFactor: 1.2,
      ),
      onTap: onTap,
    );
  }

  createDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Hello Sir Please Log In"),
            content: TextButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => UserProfile()));
                },
                child: Text("Sign In")),
          );
        });
  }

  // var user;
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       final User? user = auth.currentUser;
  //       final uid = user!.uid;
  //       userId = uid;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            //decoration: BoxDecoration(color: Color(0xff29235c)),
            padding: EdgeInsets.zero,
            child: Stack(
              children: [
                FutureBuilder(
                  // future: FirebaseFirestore.instance
                  //     .collection("customer")
                  //     .where('uid', isEqualTo: userId)
                  //     .get(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return StreamBuilder(
                      // stream: FirebaseFirestore.instance
                      //     .collection("customer")
                      //     .where('uid', isEqualTo: userId)
                      //     .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          print("Something Went Wrong");
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final List userDataList = [];
                        // snapshot.data!.docs.map((DocumentSnapshot documet) {
                        //   Map a = documet.data() as Map<String, dynamic>;
                        //   userDataList.add(a);
                        // }).toList();
                        if (userDataList.isEmpty) {
                          return GestureDetector(
                            onTap: () {
                              createDialogBox(context);
                            },
                            child: UserAccountsDrawerHeader(
                              decoration:
                                  BoxDecoration(color: Color(0xff29235c)),
                              accountName: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Please Sign in First",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )),
                              accountEmail: Text(""),
                            ),
                          );
                        } else {
                          return UserAccountsDrawerHeader(
                            accountName: Text(userDataList[0]["name"]),
                            accountEmail: Text(userDataList[0]["email"]),
                            currentAccountPicture: userDataList[0]["image"] !=
                                    ""
                                ? CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(userDataList[0]["image"]),
                                  )
                                : CircleAvatar(
                                    child: Text(
                                      "${userDataList[0]["name"][0]}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.amber,
                                  ),
                          );
                        }
                      },
                    );
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CloseButton(
                    color: Colors.white,
                    onPressed: Navigator.of(context).pop,
                  ),
                )
              ],
            ),
          ),
          _createDrawerItem(
              icon: CupertinoIcons.profile_circled,
              text: "Profile",
              onTap: () {
                // if (userId == "") {
                //   showDialog(
                //       context: context,
                //       builder: (context) {
                //         return AlertDialog(
                //           title: Text("Hello Sir Please Log in"),
                //           content: TextButton(
                //               onPressed: () {
                //                 // Navigator.push(
                //                 //     context,
                //                 //     MaterialPageRoute(
                //                 //         builder: (context) => login()));
                //               },
                //               child: Text("Sign In")),
                //         );
                //       });
                // } else {
                //   // Navigator.push(
                //   //     context,
                //   //     MaterialPageRoute(
                //   //         builder: (context) => UserProfile(
                //   //               userUid: userId,
                //   //             )));
                // }
              }),
          // _createDrawerItem(
          //     icon: CupertinoIcons.group,
          //     text: "Team Members",
          //     onTap: () {
          //       Navigator.pushNamed(context, MyRoute.ourTeam);
          //     }),
          _createDrawerItem(
              icon: Icons.hotel,
              text: "Hotels",
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Hotel()));
              }),
          _createDrawerItem(
              icon: Icons.location_on,
              text: "Destinations",
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => AllDistinations()));
              }),
          _createDrawerItem(
              icon: Icons.contact_mail_sharp,
              text: "Contact Us",
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, MyRoute.contactUs);
              }),
          _createDrawerItem(
              icon: CupertinoIcons.gift, text: "Pacakges", onTap: () {}),
          _createDrawerItem(
              icon: Icons.report_sharp,
              text: "About Us",
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, MyRoute.aboutUs);
              }),
          _createDrawerItem(
              icon: Icons.report_sharp,
              text: "Data Entry",
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, MyRoute.aboutUs);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DrawerFirestore()));
              }),
        ],
      ),
    );
  }
}
