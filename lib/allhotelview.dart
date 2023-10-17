import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour4you/Hotel_view_page.dart';
import 'package:tour4you/userprofile.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

class AllHotelViewPage extends StatefulWidget {
  const AllHotelViewPage({Key? key}) : super(key: key);

  @override
  State<AllHotelViewPage> createState() => _AllHotelViewPageState();
}

class _AllHotelViewPageState extends State<AllHotelViewPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
        appBar: AppBar(
          // floating: true,
          // snap: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 16,
              )),
          actions: [
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Types of Hotel",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                              // isScrollable: true,
                              labelPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              labelColor: Color(0xff29235c),
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w900),
                              unselectedLabelColor: Colors.grey,
                              indicator: CircleTabIndicator(
                                  color: Color(0xff29235c), radius: 4),
                              controller: _tabController,
                              tabs: [
                                Tab(
                                  text: "All",
                                ),
                                Tab(
                                  text: "Swat",
                                ),
                                Tab(
                                  text: "Chitral",
                                ),
                                Tab(
                                  text: "Kumrat",
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 200,
                        height: MediaQuery.of(context).size.height,
                        child: TabBarView(
                          children: [
                            /******************************** */
                            //tabbar view 1st item
                            Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height - 20,
                                  child: ListView(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HotelViewPage()));
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 150,
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
                                                          BorderRadius.circular(
                                                              5),
                                                      child: BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                                sigmaX: 19.2,
                                                                sigmaY: 19.2),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .place_outlined,
                                                                  color: Colors
                                                                      .white),
                                                              Text(
                                                                  "Hujra Restaurant",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20,
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
                                      ),

                                      //end of Card
                                      //****************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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
                            //end of tabbarview 1st item
                            //tabbar view 2nd item
                            Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height - 20,
                                  child: ListView(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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
                            //end of tabbarview 2nd item
                            //tabbar view 3rd item
                            Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height - 20,
                                  child: ListView(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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
                            //end of tabbarview 3rd item
                            //tabbar view 4th item
                            Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height - 20,
                                  child: ListView(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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

                                      //end of Card
                                      //****************** */
                                      //Start of Card
                                      //******************** */
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
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
                                                      'assets/images/hujra_restaurant.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 19.2,
                                                          sigmaY: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                "Hujra Restaurant",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
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
                            //end of tabbarview 4th item
                          ],
                          controller: _tabController,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = Paint()..isAntiAlias = true;
    final Offset circleOffset = offset +
        Offset(
            configuration.size!.width / 2, configuration.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
