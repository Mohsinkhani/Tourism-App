// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tour4you/google_maps.dart';

class HotelViewPage extends StatefulWidget {
  const HotelViewPage({Key? key}) : super(key: key);

  @override
  State<HotelViewPage> createState() => _HotelViewPageState();
}

class _HotelViewPageState extends State<HotelViewPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController1 = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 10,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                image: AssetImage("assets/images/hotel.png")),
            TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelColor: Color(0xff29235c),
                labelStyle: TextStyle(fontWeight: FontWeight.w900),
                unselectedLabelColor: Colors.grey,
                controller: _tabController1,
                indicator:
                    CircleTabIndicator(color: Color(0xff29235c), radius: 4),
                tabs: [
                  Tab(text: "Details"),
                  Tab(text: "Facilities"),
                  Tab(text: "Review"),
                  Tab(text: "Maps"),
                ]),
            // Image.asset("assete/images/hotel.png"),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(controller: _tabController1, children: [
                //  1st Tab view of TabBar
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Text("Details"),
                ),
                // 2nd Tab view of TabBar
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [Text("Facilities")],
                  ),
                ),
                //3rd Tab view of TabBar
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      // Start of Review
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, left: 10, bottom: 2),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/profile.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: RichText(
                                        text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: "Saad ALi",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: "\n19-May-2022",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black)),
                                    ])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 3, bottom: 3),
                                    child: SmoothStarRating(
                                      starCount: 5,
                                      rating: 4,
                                      color: Colors.orange,
                                      borderColor: Colors.orange,
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_vert))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 90, right: 40),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "This Comment Input Section This Comment Input Section This Com Input Section This Comment Input Section This Comment Input Section",
                                    style: TextStyle(fontSize: 12),
                                  )),
                            )
                          ],
                        ),
                      ),
                      // End of Review
                      SizedBox(
                        height: 10,
                      ),
                      // Start of Review
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, left: 10, bottom: 2),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/profile.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: RichText(
                                        text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: "Saad ALi",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: "\n19-May-2022",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black)),
                                    ])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 3, bottom: 3),
                                    child: SmoothStarRating(
                                      starCount: 5,
                                      rating: 4,
                                      color: Colors.orange,
                                      borderColor: Colors.orange,
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_vert))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 90, right: 40),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "This Comment Input Section This Comment Input Section This Com Input Section This Comment Input Section This Comment Input Section",
                                    style: TextStyle(fontSize: 12),
                                  )),
                            )
                          ],
                        ),
                      ),
                      // End of Review
                      // Start of Review
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, left: 10, bottom: 2),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/profile.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: RichText(
                                        text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: "Saad ALi",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: "\n19-May-2022",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black)),
                                    ])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 3, bottom: 3),
                                    child: SmoothStarRating(
                                      starCount: 5,
                                      rating: 4,
                                      color: Colors.orange,
                                      borderColor: Colors.orange,
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_vert))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 90, right: 40),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "This Comment Input Section This Comment Input Section This Com Input Section This Comment Input Section This Comment Input Section",
                                    style: TextStyle(fontSize: 12),
                                  )),
                            )
                          ],
                        ),
                      ),
                      // End of Review
                      // Start of Review
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, left: 10, bottom: 2),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/profile.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: RichText(
                                        text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: "Saad ALi",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: "\n19-May-2022",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black)),
                                    ])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 3, bottom: 3),
                                    child: SmoothStarRating(
                                      starCount: 5,
                                      rating: 4,
                                      color: Colors.orange,
                                      borderColor: Colors.orange,
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_vert))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 90, right: 40),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "This Comment Input Section This Comment Input Section This Com Input Section This Comment Input Section This Comment Input Section",
                                    style: TextStyle(fontSize: 12),
                                  )),
                            )
                          ],
                        ),
                      ),
                      // End of Review
                    ],
                  ),
                ),
                //4th Tab view of TabBar
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                              "This hotel is locATED ON longitude 23.343c and attitude 34.77676"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // ignore: deprecated_member_use
                        ElevatedButton(
                            //color: Color(0xff23295c),
                            //textColor: Colors.white,
                            //splashColor: Colors.white70,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GoogleMaps()));
                            },
                            child: Text("Get Direction"))
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
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
