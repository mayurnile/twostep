import 'package:flutter/material.dart';

import './screens/splash_screen.dart';
import './screens/home_screen.dart';
import './screens/shoe_details_screen.dart';

import './constants/routes.dart';
void main() => runApp(TwoStep());

class TwoStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2 Step',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff3598DB),
        accentColor: Colors.blueAccent,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              buttonColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 36.0,
            color: Colors.black,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
          headline5: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 32.0,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
          headline4: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
          headline3: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 28.0,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
          headline2: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 18.0,
            color: Colors.black.withOpacity(0.75),
            fontWeight: FontWeight.bold,
          ),
           headline1: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w900,
            fontSize: 24.0,
            color: Colors.white,
            letterSpacing: 3.0,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 22.0,
            color: Colors.black,
            fontWeight: FontWeight.w300,
            letterSpacing: 5,
          ),
          subtitle2: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20.0,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16.0,
            color: Colors.black87,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      routes: {
        Routes.HOME_SCREEN: (ctx) => HomeScreen(),
        Routes.SHOE_DETAILS_SCREENS:(ctx) => ShoeDetailsScreen(),
      },
      home: MySplashScreen(),
    );
  }
}
