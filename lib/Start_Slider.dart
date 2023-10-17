import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tour4you/home.dart';
import 'package:tour4you/navigationbar.dart';

class StartSlider extends StatefulWidget {
  const StartSlider({Key? key}) : super(key: key);

  @override
  State<StartSlider> createState() => _StartSliderState();
}

class _StartSliderState extends State<StartSlider> {
  //** List For Slider Header */
  var HeaderTextlist = [
    'Reserve Your Room With Us',
    'Avail Transport Services With US',
    'Avail Trip or Custom Trip as you want',
    'Traditioanl  and  Hike Products, Dry And Fruits Shop'
  ];
  //** List For Silder Regular Text */
  var Textlist = [
    'Enjoy your Tour with on best way and with good facilities',
    'We are Happy to announce that we are Proving Transport sevices to our customer to Make thier tour Comfortable',
    'We are Providing Guidence Service for Hiking and tracking Lovers to Explore Touristic Places ',
    'We are Happy to announce that we are Proving Transport sevices to our customer to Make thier tour Comfortable'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CarouselSlider(
            //** Slider Item  */
            items: [
              'assets/images/start_slider/hotel.jpg',
              'assets/images/start_slider/Transport.jpg',
              'assets/images/start_slider/Guidance.jpg',
              'assets/images/start_slider/Shopping.jpg'
            ].map(
              (i) {
                //*** Slider Builder in which items is to be Map */
                //*** Interface Code For Slider  */
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 50),
                      padding: EdgeInsets.all(15),
                      child: ListView(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //*** Mapping Slider Items */
                          Container(
                              height: MediaQuery.of(context).size.height / 2,
                              //width: MediaQuery.of(context).size.width,
                              child: Image.asset(i)),
                          SizedBox(
                            height: 10,
                          ),
                          //*** Mapping text for 1st Item */
                          (i == 'assets/images/start_slider/hotel.jpg')
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${HeaderTextlist[0]}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${Textlist[0]}",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ],
                                )
                              : (i == 'assets/images/start_slider/Transport.jpg')
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${HeaderTextlist[1]}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${Textlist[1]}",
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                      ],
                                    )
                                  : (i == 'assets/images/start_slider/Guidance.jpg')
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${HeaderTextlist[2]}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${Textlist[2]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Text(
                                              "${HeaderTextlist[3]}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${Textlist[3]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        )
                        ],
                      ),
                    );
                  },
                );
              },
            ).toList(),
            //*** Properties for Carousel */
            options: CarouselOptions(
              // height: double.infinity,
              height: MediaQuery.of(context).size.height / 1.2,
              viewportFraction: 1,
              //aspectRatio: 16 / 16,
              // disableCenter: false,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              scrollDirection: Axis.horizontal,
              //enableInfiniteScroll: false,
            ),
          ),
          // ignore: deprecated_member_use

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NavigationBarPage()));
            },
            child: Text(
              "Start",
              style: TextStyle(color: Colors.white),
            ),
            // color: Color(0xff29235c),
            // splashColor: Colors.white,
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          )
        ],
      ),
    ));
  }
}
