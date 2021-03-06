import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:CountDays/pages/auth/auth_home.dart';
import 'package:CountDays/pages/start_loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  //grey color
  final lightBackgroundColor = const Color(0xFFEEF2F5);
  @override
  Widget build(BuildContext context) {
    print(kIsWeb);
    if (kIsWeb) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => StartLoading(),
          '/authwrapper': (context) => AuthHome(),
        },
      );
    } else if (Platform.isAndroid) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => AuthHome(),
        },
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => StartLoading(),
          '/authwrapper': (context) => AuthHome(),
        },
      );
    }
  }
}
