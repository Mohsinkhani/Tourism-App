import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tour4you/about_us_page.dart';
import 'package:tour4you/demo.dart';
import 'package:tour4you/home.dart';
import 'package:tour4you/review_page.dart';
import 'package:tour4you/search_page.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({Key? key}) : super(key: key);

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens = [Myhome(), SearchPage(), ReviewPage(), AboutUsPage()];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.search,
        size: 30,
      ),
      Icon(
        Icons.person,
        size: 30,
      ),
      Icon(
        Icons.reviews,
        size: 30,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            key: navigationKey,
            height: 60,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Color(0xff29235c),
            color: Color(0xff29235c),
            index: index,
            items: items,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(
              milliseconds: 300,
            ),

            // onTap: (value) => setState(() => this.index = value)
            // selectedItemColor: colors[index],
            onTap: (index) => setState(() {
              this.index = index;
            }),
          ),
        ),
        body: screens[index],
      ),
    );
  }
}

// class NavigationBar1 {
//   int index = 0;
//   NavigationBar() {
//     return Scaffold(
//        bottomNavigationBar: CurvedNavigationBar(
//         height: 60,
//         backgroundColor: Colors.transparent,
//         buttonBackgroundColor: Color(0xff29235c),
//         color: Color(0xff29235c),
//         index: index,
//         items:[
//       Icon(
//         Icons.home,
//         size: 30,
//         color: Colors.white,
//       ),
//       Icon(
//         Icons.search,
//         size: 30,
//         color: Colors.white,
//       ),
//       Icon(
//         Icons.person,
//         size: 30,
//         color: Colors.white,
//       ),
//       Icon(
//         Icons.reviews,
//         size: 30,
//         color: Colors.white,
//       ),
//     ],

//         // onTap: (value) => setState(() => this.index = value)
//         // selectedItemColor: colors[index],
//         onTap: (index) => 
//           this.index = index,
       
//       ),
//     );
//   }
// }
