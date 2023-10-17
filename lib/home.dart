import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour4you/Hotel_view_page.dart';
import 'package:tour4you/allhotelview.dart';
import 'package:tour4you/login.dart';
import 'package:tour4you/navigationbar.dart';
import 'package:tour4you/search_page.dart';
import 'package:tour4you/userprofile.dart';

import 'drawer.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  final Stream<QuerySnapshot> promotions = FirebaseFirestore.instance
      .collection("Events")
      .where("event", isEqualTo: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxisScrollled) => [
          SliverAppBar(
            iconTheme: IconThemeData(color: Color(0xff29235c)),
            floating: true,
            // snap: true,
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Text("Login")),
              Container(
                margin: EdgeInsets.only(top: 12, left: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserProfile()));
                  },
                  child: FaIcon(FontAwesomeIcons.user),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    primary: Color(0xff29235C), // <-- Button color
                    onPrimary: Colors.white, // <-- Splash color
                  ),
                ),
              ),
            ],
          ),
        ],
        //controller: _scrollViewController,
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Eventour",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 40),
                        ),
                        Text(
                          "   events & tour",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () => showSearch(
                            context: context, delegate: MySearchDelegate()),
                        child: InkWell(
                          child: IgnorePointer(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: "Search here",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  suffixIcon: Container(
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             SearchPage()));
                                      },
                                      child: Icon(Icons.search),
                                      style: ElevatedButton.styleFrom(
                                        //shape: CircleBorder(),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        padding: EdgeInsets.all(15),
                                        primary: Color(
                                            0xff29235C), // <-- Button color
                                        onPrimary:
                                            Colors.white, // <-- Splash color
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Our Services",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // wrap contain all Servies Icon code
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 18,
                    runSpacing: 10,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            splashColor: Colors.black12,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AllHotelViewPage()));
                            },
                            child: Material(
                              shape: CircleBorder(),
                              elevation: 6,
                              child: Ink.image(
                                image: AssetImage('assets/images/hotel.png'),
                                height: 50,
                                width: 50,
                                // fit: BoxFit.cover,
                                // child: Text('Hotel'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Hotel',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            splashColor: Colors.black12,
                            onTap: () {},
                            child: Material(
                              shape: CircleBorder(),
                              elevation: 6,
                              child: Ink.image(
                                image: AssetImage('assets/images/vehicles.png'),
                                height: 50,
                                width: 50,
                                // fit: BoxFit.cover,
                                // child: Text('Hotel'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Transport',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            splashColor: Colors.black12,
                            onTap: () {},
                            child: Material(
                              shape: CircleBorder(),
                              elevation: 6,
                              child: Ink.image(
                                image: AssetImage(
                                    'assets/images/shopping-cart.png'),
                                height: 50,
                                width: 50,
                                // fit: BoxFit.cover,
                                // child: Text('Hotel'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Traditional\n Shopping',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            splashColor: Colors.black12,
                            onTap: () {},
                            child: Material(
                              shape: CircleBorder(),
                              elevation: 6,
                              child: Ink.image(
                                image: AssetImage('assets/images/guidance.png'),
                                height: 50,
                                width: 50,
                                // fit: BoxFit.cover,
                                // child: Text('Hotel'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Guidance',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            splashColor: Colors.black12,
                            onTap: () {},
                            child: Material(
                              shape: CircleBorder(),
                              elevation: 6,
                              child: Ink.image(
                                image: AssetImage('assets/images/travel.png'),
                                height: 50,
                                width: 50,
                                // fit: BoxFit.cover,
                                // child: Text('Hotel'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Tour\nPackages',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            splashColor: Colors.black12,
                            onTap: () {},
                            child: Material(
                              shape: CircleBorder(),
                              elevation: 6,
                              child: Ink.image(
                                image: AssetImage('assets/images/party.png'),
                                height: 50,
                                width: 50,
                                // fit: BoxFit.cover,
                                // child: Text('Hotel'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Events',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            splashColor: Colors.black12,
                            onTap: () {},
                            child: Material(
                              shape: CircleBorder(),
                              elevation: 6,
                              child: Ink.image(
                                image: AssetImage('assets/images/travel.png'),
                                height: 50,
                                width: 50,
                                // fit: BoxFit.cover,
                                // child: Text('Hotel'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Customize\nTour',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                  //Our Services code end
                  //************************ */
                  //********************** */
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      //Start of Advertisement Area
                      //************************* */
                      StreamBuilder(
                          stream: promotions,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print("Error Occurs");
                              return Center(
                                child: Text("No internet Connection"),
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final List promotionlist = [];

                            snapshot.data!.docs.map((DocumentSnapshot e) {
                              Map dataList = e.data() as Map<String, dynamic>;
                              promotionlist.add(dataList);
                            }).toList();
                            return Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text("Promotions",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: List.generate(
                                        promotionlist.length,
                                        (index) => Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.3,
                                          child: Card(
                                            margin: EdgeInsets.only(
                                                left: 10.0, bottom: 10),
                                            elevation: 4,
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Image(
                                                    image: NetworkImage(
                                                        promotionlist[0]
                                                            ['image']),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                // Positioned(
                                                //     bottom: 10,
                                                //     left: 10,
                                                //     child: ClipRRect(
                                                //       borderRadius:
                                                //           BorderRadius.circular(5),
                                                //       child: BackdropFilter(
                                                //         filter: ImageFilter.blur(
                                                //             sigmaX: 19.2, sigmaY: 19.2),
                                                //         child: Padding(
                                                //           padding:
                                                //               const EdgeInsets.all(8.0),
                                                //           child: Row(
                                                //             children: [
                                                //               Icon(Icons.place_outlined,
                                                //                   color: Colors.white),
                                                //               Text("Kalam Swat",
                                                //                   style: TextStyle(
                                                //                       color:
                                                //                           Colors.white,
                                                //                       fontSize: 12,
                                                //                       fontWeight:
                                                //                           FontWeight
                                                //                               .w600)),
                                                //             ],
                                                //           ),
                                                //         ),
                                                //       ),
                                                //     )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                      // children: [

                                      // ],
                                      ),
                                ),
                              ],
                            );
                          }),
                      //End of Advertisement Area
                      //start of tourist point slider
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tourist points",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800)),
                              InkWell(
                                onTap: () {},
                                child: Text("See all"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/kalam.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 19.2, sigmaY: 19.2),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.place_outlined,
                                                          color: Colors.white),
                                                      Text("Kalam Swat",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/kalam.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 19.2, sigmaY: 19.2),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.place_outlined,
                                                          color: Colors.white),
                                                      Text("Kalam Swat",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/kalam.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 19.2, sigmaY: 19.2),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.place_outlined,
                                                          color: Colors.white),
                                                      Text("Kalam Swat",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/kalam.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: Text("Kalam Swat",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //end of tourist points slider
                      //start of hotel listview slider
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Hotels",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800)),
                              InkWell(
                                onTap: () {},
                                child: Text("See all"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HotelViewPage()));
                            },
                            child: SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Card(
                                      margin: EdgeInsets.only(
                                          left: 10.0, bottom: 10),
                                      elevation: 4,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/hh.jpg'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 10,
                                              left: 10,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 19.2,
                                                      sigmaY: 19.2),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .place_outlined,
                                                            color:
                                                                Colors.white),
                                                        Text("Grand Holiday",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Card(
                                      margin: EdgeInsets.only(
                                          left: 10.0, bottom: 10),
                                      elevation: 4,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/hh.jpg'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 10,
                                              left: 10,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 19.2,
                                                      sigmaY: 19.2),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .place_outlined,
                                                            color:
                                                                Colors.white),
                                                        Text("Grand Holiday",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Card(
                                      margin: EdgeInsets.only(
                                          left: 10.0, bottom: 10),
                                      elevation: 4,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/hh.jpg'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 10,
                                              left: 10,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 19.2,
                                                      sigmaY: 19.2),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .place_outlined,
                                                            color:
                                                                Colors.white),
                                                        Text("Grand Holiday",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Card(
                                      margin: EdgeInsets.only(
                                          left: 10.0, bottom: 10),
                                      elevation: 4,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/hh.jpg'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 10,
                                              left: 10,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 19.2,
                                                      sigmaY: 19.2),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .place_outlined,
                                                            color:
                                                                Colors.white),
                                                        Text("Grand Holiday",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //end of hotel listview slider
                      //******************* *//
                      //Start of Restaurant slider
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Restaurants",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800)),
                              InkWell(
                                onTap: () {},
                                child: Text("See all"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/hujra_restaurant.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 19.2, sigmaY: 19.2),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.place_outlined,
                                                          color: Colors.white),
                                                      Text("Hujra Restaurant",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/hujra_restaurant.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 19.2, sigmaY: 19.2),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.place_outlined,
                                                          color: Colors.white),
                                                      Text("Hujra Restaurant",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/hujra_restaurant.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 19.2, sigmaY: 19.2),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.place_outlined,
                                                          color: Colors.white),
                                                      Text("Hujra Restaurant",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/hujra_restaurant.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 19.2, sigmaY: 19.2),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.place_outlined,
                                                          color: Colors.white),
                                                      Text("Hujra Restaurant",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //end of Restaurant Slider
                      //Start of transport listview slider
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Transport",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800)),
                              InkWell(
                                onTap: () {},
                                child: Text("See all"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/coaster.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 19.2, sigmaY: 19.2),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.place_outlined,
                                                          color: Colors.white),
                                                      Text("Saad Travel",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/coaster.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: Text("Saad Travel",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/coaster.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: Text("Saad Travel",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/coaster.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: Text("Saad Travel",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //end of transport slider
                      //*********************//
                      //Start of Guidance listview slider
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Guidance",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800)),
                              InkWell(
                                onTap: () {},
                                child: Text("See all"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/guidance.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 19.2, sigmaY: 19.2),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.place_outlined,
                                                          color: Colors.white),
                                                      Text("ECT Company",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/guidance.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 19.2, sigmaY: 19.2),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.place_outlined,
                                                          color: Colors.white),
                                                      Text("ECT Company",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/guidance.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: Text("ECT Company",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Card(
                                    margin:
                                        EdgeInsets.only(left: 10.0, bottom: 10),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/guidance.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: Text("ECT Company",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //end of Guidance listview slider
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard() => Container(
        height: 400,
        width: MediaQuery.of(context).size.width / 2,
        child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: AssetImage('assets/images/hh.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text("Grand Holiday",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600))),
              ],
            )),
      );
}
