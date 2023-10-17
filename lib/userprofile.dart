import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 16,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Profile",
          // style: GoogleFonts.roboto(color: Colors.black, fontSize: 15)
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        // title: Text(
        //   "Historical Areas in Swat",
        //   style: GoogleFonts.roboto(color: Colors.black,fontSize: 15)
        // ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(children: [
            // top pic and user name
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              width: MediaQuery.of(context).size.height,
              // height: MediaQuery.of(context).size.height/2 - 100,
              color: Color(0xff29235C),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    // child: allUsersList[0]["image"] != ""
                    //     ? CircleAvatar(
                    //         backgroundImage:
                    //             NetworkImage(allUsersList[0]["image"]),
                    //       )
                    //     : CircleAvatar(
                    //         child: Text(
                    //           "${allUsersList[0]["name"][0]}",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 48,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //         backgroundColor: Colors.amber,
                    //       )
                    child: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Text(
                        "S",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Saad Ali",
                    //allUsersList[0]["name"],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            //  last row email contact and address
            Container(
                padding: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        children: [
                          Row(children: [
                            Icon(
                              Icons.mail,
                              color: Color(0xff29235c),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "tour4you111@gmail.com",
                              //allUsersList[0]["email"],
                              style: TextStyle(fontSize: 16),
                            )
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(
                              Icons.phone_android,
                              color: Color(0xff29235c),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "03496260256",
                              // allUsersList[0]["Contact"],
                              style: TextStyle(fontSize: 16),
                            )
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(
                              Icons.home,
                              color: Color(0xff29235c),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Shin Khwaza khela Swat",
                              // allUsersList[0]["address"],
                              style: TextStyle(fontSize: 16),
                            )
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xff29235c)),
                                    onPressed: () {
                                      // firebaseAuth.signOut();
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => home()));
                                    },
                                    child: Row(children: [
                                      Text("Sign Out"),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.logout,
                                        color: Colors.white,
                                        size: 16,
                                      )
                                    ]))
                              ]),
                        ],
                      ))
                ]))
          ]),
        ),
      ),
    );
  }
}
