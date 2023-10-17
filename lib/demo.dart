import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CarouselSlider(
            items: [
              'assets/images/start_slider/hotel.jpg',
              'assets/images/start_slider/Transport.jpg',
              'assets/images/start_slider/Guidance.jpg',
              'assets/images/start_slider/Shopping.jpg'
            ].map(
              (i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(children: <Widget>[
                          InkWell(
                              onTap: () {
                                print("you click  ${i} ");
                              },
                              child: Image.network(i,
                                  fit: BoxFit.cover, width: 1000.0)),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Text(
                                'No. $i image',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    );
                  },
                );
              },
            ).toList(),
            options: CarouselOptions(
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
            )));

    //     body: Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 60),
    //   child: Container(
    //     height: 50,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(30),
    //       color: Colors.grey[500],
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.black38,
    //           blurRadius: 25,
    //           offset: const Offset(0, 10),
    //         ),
    //       ],
    //     ),
    //     child: InkWell(
    //       child: IgnorePointer(
    //         child: TextFormField(
    //           decoration: InputDecoration(
    //               hintText: "Search here",
    //               hintStyle: TextStyle(color: Colors.black),
    //               border: InputBorder.none,
    //               suffixIcon: Container(
    //                 child: ElevatedButton(
    //                   onPressed: () {},
    //                   child: Icon(Icons.search),
    //                   style: ElevatedButton.styleFrom(
    //                     shape: CircleBorder(),
    //                     padding: EdgeInsets.all(10),
    //                     primary: Colors.redAccent, // <-- Button color
    //                     onPrimary: Colors.white, // <-- Splash color
    //                   ),
    //                 ),
    //               )),
    //         ),
    //       ),
    //     ),
    //   ),
    // ));
  }
}

//  child: TabBarView(controller: _tabController, children: [
                        
//                         // ListView(children: [
//                         //   Container(
//                         //     width: MediaQuery.of(context).size.width,
//                         //     height: 150,
//                         //     child: Card(
//                         //       margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                         //       elevation: 4,
//                         //       clipBehavior: Clip.antiAlias,
//                         //       shape: RoundedRectangleBorder(
//                         //           borderRadius: BorderRadius.circular(10.0)),
//                         //       child: Stack(
//                         //         children: [
//                         //           Container(
//                         //             height: MediaQuery.of(context).size.height,
//                         //             width: MediaQuery.of(context).size.width,
//                         //             child: Image(
//                         //               image: AssetImage(
//                         //                   'assets/images/hujra_restaurant.jpg'),
//                         //               fit: BoxFit.fill,
//                         //             ),
//                         //           ),
//                         //           Positioned(
//                         //               bottom: 10,
//                         //               left: 10,
//                         //               child: ClipRRect(
//                         //                 borderRadius: BorderRadius.circular(5),
//                         //                 child: BackdropFilter(
//                         //                   filter: ImageFilter.blur(
//                         //                       sigmaX: 19.2, sigmaY: 19.2),
//                         //                   child: Padding(
//                         //                     padding: const EdgeInsets.all(8.0),
//                         //                     child: Row(
//                         //                       children: [
//                         //                         Icon(Icons.place_outlined,
//                         //                             color: Colors.white),
//                         //                         Text("Hujra Restaurant",
//                         //                             style: TextStyle(
//                         //                                 color: Colors.white,
//                         //                                 fontSize: 20,
//                         //                                 fontWeight:
//                         //                                     FontWeight.w600)),
//                         //                       ],
//                         //                     ),
//                         //                   ),
//                         //                 ),
//                         //               )),
//                         //         ],
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ]),

//                         //end of Card
//                         //****************** */
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 150,
//                           child: Card(
//                             margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                             elevation: 4,
//                             clipBehavior: Clip.antiAlias,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0)),
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   height: MediaQuery.of(context).size.height,
//                                   width: MediaQuery.of(context).size.width,
//                                   child: Image(
//                                     image: AssetImage(
//                                         'assets/images/hujra_restaurant.jpg'),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                                 Positioned(
//                                     bottom: 10,
//                                     left: 10,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(5),
//                                       child: BackdropFilter(
//                                         filter: ImageFilter.blur(
//                                             sigmaX: 19.2, sigmaY: 19.2),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Row(
//                                             children: [
//                                               Icon(Icons.place_outlined,
//                                                   color: Colors.white),
//                                               Text("Hujra Restaurant",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.w600)),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )),
//                               ],
//                             ),
//                           ),
//                         ),

//                         //Start of Card
//                         //******************** */
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 150,
//                           child: Card(
//                             margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                             elevation: 4,
//                             clipBehavior: Clip.antiAlias,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0)),
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   height: MediaQuery.of(context).size.height,
//                                   width: MediaQuery.of(context).size.width,
//                                   child: Image(
//                                     image: AssetImage(
//                                         'assets/images/hujra_restaurant.jpg'),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                                 Positioned(
//                                     bottom: 10,
//                                     left: 10,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(5),
//                                       child: BackdropFilter(
//                                         filter: ImageFilter.blur(
//                                             sigmaX: 19.2, sigmaY: 19.2),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Row(
//                                             children: [
//                                               Icon(Icons.place_outlined,
//                                                   color: Colors.white),
//                                               Text("Hujra Restaurant",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.w600)),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )),
//                               ],
//                             ),
//                           ),
//                         ),

//                         //end of Card
//                         //****************** */
//                         //Start of Card
//                         //******************** */
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 150,
//                           child: Card(
//                             margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                             elevation: 4,
//                             clipBehavior: Clip.antiAlias,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0)),
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   height: MediaQuery.of(context).size.height,
//                                   width: MediaQuery.of(context).size.width,
//                                   child: Image(
//                                     image: AssetImage(
//                                         'assets/images/hujra_restaurant.jpg'),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                                 Positioned(
//                                     bottom: 10,
//                                     left: 10,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(5),
//                                       child: BackdropFilter(
//                                         filter: ImageFilter.blur(
//                                             sigmaX: 19.2, sigmaY: 19.2),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Row(
//                                             children: [
//                                               Icon(Icons.place_outlined,
//                                                   color: Colors.white),
//                                               Text("Hujra Restaurant",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.w600)),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )),
//                               ],
//                             ),
//                           ),
//                         ),

//                         //end of Card
//                         //****************** */
//                         //Start of Card
//                         //******************** */
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 150,
//                           child: Card(
//                             margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                             elevation: 4,
//                             clipBehavior: Clip.antiAlias,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0)),
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   height: MediaQuery.of(context).size.height,
//                                   width: MediaQuery.of(context).size.width,
//                                   child: Image(
//                                     image: AssetImage(
//                                         'assets/images/hujra_restaurant.jpg'),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                                 Positioned(
//                                     bottom: 10,
//                                     left: 10,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(5),
//                                       child: BackdropFilter(
//                                         filter: ImageFilter.blur(
//                                             sigmaX: 19.2, sigmaY: 19.2),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Row(
//                                             children: [
//                                               Icon(Icons.place_outlined,
//                                                   color: Colors.white),
//                                               Text("Hujra Restaurant",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.w600)),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )),
//                               ],
//                             ),
//                           ),
//                         ),

//                         //end of Card
//                         //****************** */
//                         //Start of Card
//                         //******************** */
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 150,
//                           child: Card(
//                             margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                             elevation: 4,
//                             clipBehavior: Clip.antiAlias,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0)),
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   height: MediaQuery.of(context).size.height,
//                                   width: MediaQuery.of(context).size.width,
//                                   child: Image(
//                                     image: AssetImage(
//                                         'assets/images/hujra_restaurant.jpg'),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                                 Positioned(
//                                     bottom: 10,
//                                     left: 10,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(5),
//                                       child: BackdropFilter(
//                                         filter: ImageFilter.blur(
//                                             sigmaX: 19.2, sigmaY: 19.2),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Row(
//                                             children: [
//                                               Icon(Icons.place_outlined,
//                                                   color: Colors.white),
//                                               Text("Hujra Restaurant",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.w600)),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )),
//                               ],
//                             ),
//                           ),
//                         ),

//                         //end of Card
//                         //****************** */
//                         //Start of Card
//                         //******************** */
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 150,
//                           child: Card(
//                             margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                             elevation: 4,
//                             clipBehavior: Clip.antiAlias,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0)),
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   height: MediaQuery.of(context).size.height,
//                                   width: MediaQuery.of(context).size.width,
//                                   child: Image(
//                                     image: AssetImage(
//                                         'assets/images/hujra_restaurant.jpg'),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                                 Positioned(
//                                     bottom: 10,
//                                     left: 10,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(5),
//                                       child: BackdropFilter(
//                                         filter: ImageFilter.blur(
//                                             sigmaX: 19.2, sigmaY: 19.2),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Row(
//                                             children: [
//                                               Icon(Icons.place_outlined,
//                                                   color: Colors.white),
//                                               Text("Hujra Restaurant",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.w600)),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             //Start of Card
//                             //******************** */
//                             Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: 150,
//                               child: Card(
//                                 margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                                 elevation: 4,
//                                 clipBehavior: Clip.antiAlias,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height,
//                                       width: MediaQuery.of(context).size.width,
//                                       child: Image(
//                                         image: AssetImage(
//                                             'assets/images/hujra_restaurant.jpg'),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     Positioned(
//                                         bottom: 10,
//                                         left: 10,
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           child: BackdropFilter(
//                                             filter: ImageFilter.blur(
//                                                 sigmaX: 19.2, sigmaY: 19.2),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Row(
//                                                 children: [
//                                                   Icon(Icons.place_outlined,
//                                                       color: Colors.white),
//                                                   Text("Hujra Restaurant",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 20,
//                                                           fontWeight:
//                                                               FontWeight.w600)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             ),

//                             //end of Card
//                             //****************** */
//                             Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: 150,
//                               child: Card(
//                                 margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                                 elevation: 4,
//                                 clipBehavior: Clip.antiAlias,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height,
//                                       width: MediaQuery.of(context).size.width,
//                                       child: Image(
//                                         image: AssetImage(
//                                             'assets/images/hujra_restaurant.jpg'),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     Positioned(
//                                         bottom: 10,
//                                         left: 10,
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           child: BackdropFilter(
//                                             filter: ImageFilter.blur(
//                                                 sigmaX: 19.2, sigmaY: 19.2),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Row(
//                                                 children: [
//                                                   Icon(Icons.place_outlined,
//                                                       color: Colors.white),
//                                                   Text("Hujra Restaurant",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 20,
//                                                           fontWeight:
//                                                               FontWeight.w600)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             ),

//                             //Start of Card
//                             //******************** */
//                             Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: 150,
//                               child: Card(
//                                 margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                                 elevation: 4,
//                                 clipBehavior: Clip.antiAlias,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height,
//                                       width: MediaQuery.of(context).size.width,
//                                       child: Image(
//                                         image: AssetImage(
//                                             'assets/images/hujra_restaurant.jpg'),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     Positioned(
//                                         bottom: 10,
//                                         left: 10,
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           child: BackdropFilter(
//                                             filter: ImageFilter.blur(
//                                                 sigmaX: 19.2, sigmaY: 19.2),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Row(
//                                                 children: [
//                                                   Icon(Icons.place_outlined,
//                                                       color: Colors.white),
//                                                   Text("Hujra Restaurant",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 20,
//                                                           fontWeight:
//                                                               FontWeight.w600)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             ),

//                             //end of Card
//                             //****************** */
//                             //Start of Card
//                             //******************** */
//                             Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: 150,
//                               child: Card(
//                                 margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                                 elevation: 4,
//                                 clipBehavior: Clip.antiAlias,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height,
//                                       width: MediaQuery.of(context).size.width,
//                                       child: Image(
//                                         image: AssetImage(
//                                             'assets/images/hujra_restaurant.jpg'),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     Positioned(
//                                         bottom: 10,
//                                         left: 10,
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           child: BackdropFilter(
//                                             filter: ImageFilter.blur(
//                                                 sigmaX: 19.2, sigmaY: 19.2),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Row(
//                                                 children: [
//                                                   Icon(Icons.place_outlined,
//                                                       color: Colors.white),
//                                                   Text("Hujra Restaurant",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 20,
//                                                           fontWeight:
//                                                               FontWeight.w600)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             ),

//                             //end of Card
//                             //****************** */
//                             //Start of Card
//                             //******************** */
//                             Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: 150,
//                               child: Card(
//                                 margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                                 elevation: 4,
//                                 clipBehavior: Clip.antiAlias,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height,
//                                       width: MediaQuery.of(context).size.width,
//                                       child: Image(
//                                         image: AssetImage(
//                                             'assets/images/hujra_restaurant.jpg'),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     Positioned(
//                                         bottom: 10,
//                                         left: 10,
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           child: BackdropFilter(
//                                             filter: ImageFilter.blur(
//                                                 sigmaX: 19.2, sigmaY: 19.2),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Row(
//                                                 children: [
//                                                   Icon(Icons.place_outlined,
//                                                       color: Colors.white),
//                                                   Text("Hujra Restaurant",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 20,
//                                                           fontWeight:
//                                                               FontWeight.w600)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             ),

//                             //end of Card
//                             //****************** */
//                             //Start of Card
//                             //******************** */
//                             Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: 150,
//                               child: Card(
//                                 margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                                 elevation: 4,
//                                 clipBehavior: Clip.antiAlias,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height,
//                                       width: MediaQuery.of(context).size.width,
//                                       child: Image(
//                                         image: AssetImage(
//                                             'assets/images/hujra_restaurant.jpg'),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     Positioned(
//                                         bottom: 10,
//                                         left: 10,
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           child: BackdropFilter(
//                                             filter: ImageFilter.blur(
//                                                 sigmaX: 19.2, sigmaY: 19.2),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Row(
//                                                 children: [
//                                                   Icon(Icons.place_outlined,
//                                                       color: Colors.white),
//                                                   Text("Hujra Restaurant",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 20,
//                                                           fontWeight:
//                                                               FontWeight.w600)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             ),

//                             //end of Card
//                             //****************** */
//                             //Start of Card
//                             //******************** */
//                             Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: 150,
//                               child: Card(
//                                 margin: EdgeInsets.only(left: 10.0, bottom: 10),
//                                 elevation: 4,
//                                 clipBehavior: Clip.antiAlias,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height,
//                                       width: MediaQuery.of(context).size.width,
//                                       child: Image(
//                                         image: AssetImage(
//                                             'assets/images/hujra_restaurant.jpg'),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     Positioned(
//                                         bottom: 10,
//                                         left: 10,
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           child: BackdropFilter(
//                                             filter: ImageFilter.blur(
//                                                 sigmaX: 19.2, sigmaY: 19.2),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Row(
//                                                 children: [
//                                                   Icon(Icons.place_outlined,
//                                                       color: Colors.white),
//                                                   Text("Hujra Restaurant",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 20,
//                                                           fontWeight:
//                                                               FontWeight.w600)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             ),

//                             //end of Card
//                             //****************** */
//                           ],
//                         ),
//                         Text("welcome")
//                       ]),