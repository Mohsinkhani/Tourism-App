//@dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tour4you/Hotel_view_page.dart';
import 'package:tour4you/Register.dart';
import 'package:tour4you/Start_Slider.dart';
import 'package:tour4you/allhotelview.dart';
import 'package:tour4you/demo.dart';
import 'package:tour4you/firebase_options.dart';
import 'package:tour4you/home.dart';
import 'package:tour4you/login.dart';
import 'package:tour4you/navigationbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);
  // final color = Color(0xff29235c);
//   final Map<int, Color> _themecolor = {
//   50: Color(0xFF29235c),
//   // 100: Colors.yellow[100],
//   // 200: Colors.yellow[200],
//   // 300: Colors.yellow[300],
//   // 400: Colors.yellow[400],
//   // 500: Colors.yellow[500],
//   // 600: Colors.yellow[600],
//   // 700: Colors.yellow[800],
//   // 800: Colors.yellow[900],
//   // 900: Colors.yellow[700],
// };

// final MaterialColor _themecolor1 =
//   MaterialColor(Colors.yellow[700]!.value, _themecolor1);
  // This widget is thze root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eventour',
      theme: ThemeData(
        //
        //appBarTheme: AppBarTheme(color: Color(0xff29235c)),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: _themecolor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // primary: const Colors.yellow[700],
          // secondary: const Colors.yellow.shade700,

          // or from RGB

          primary: const Color(0xFF29235c),
          secondary: const Color(0xFF29235c),
        ),
      ),
      home: StartSlider(),
    );
  }
}
