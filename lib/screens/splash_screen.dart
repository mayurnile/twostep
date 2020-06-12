import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

import './login_screen.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SplashScreen.navigate(
          name: 'assets/splash/2 step.flr',
          next: (_) => LoginScreen(),
          until: () => Future.delayed(Duration(seconds: 5)),
          startAnimation: 'splash',
        ),
      ),
    );
  }
}
