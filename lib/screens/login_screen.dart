import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../widgets/input_field.dart';

import '../constants/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TabController _tabController;

  late Size screenSize;
  late TextTheme textTheme;

  @override
  void initState() {
    super.initState();

    //initializing tab controller
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              //logo here
              Transform.translate(
                offset: Offset(
                  screenSize.width * 0.05,
                  0.0,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/logo/logo.png',
                  ),
                ),
              ),
              //app name
              Center(
                child: Text(
                  '2STEP',
                  style: textTheme.headline6,
                ),
              ),
              //app tagline
              Center(
                child: Text(
                  'URBAN FOOTWEAR',
                  style: textTheme.subtitle1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 42.0,
                  vertical: 12.0,
                ),
                child: TabBar(
                  controller: _tabController,
                  labelStyle: textTheme.subtitle2,
                  unselectedLabelStyle: textTheme.subtitle2!.copyWith(
                    fontSize: 16.0,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black38,
                  indicator: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 4.0,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: <Widget>[
                    Tab(
                      text: 'LOGIN',
                    ),
                    Tab(
                      text: 'SINGUP',
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    //login form
                    _buildLoginForm(),
                    //signup form
                    _buildSignupForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///[return Login Form]
  Widget _buildLoginForm() {
    return AnimationLimiter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: 500),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: -screenSize.width,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: <Widget>[
              //email input
              InputField(
                label: 'EMAIL',
                icon: Icons.email,
                obscureText: false,
                isSuffix: false,
              ),
              //password input field
              InputField(
                label: 'PASSWORD',
                icon: Icons.lock,
                obscureText: true,
                isSuffix: true,
              ),
              //login button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.HOME_SCREEN);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 12.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text(
                    'LOGIN',
                    style: textTheme.button,
                  ),
                ),
              ),
              //forget password button
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forget your password ?',
                  style: textTheme.subtitle1!.copyWith(
                    letterSpacing: 0.8,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///[return Signup Form]
  Widget _buildSignupForm() {
    return AnimationLimiter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: 500),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: screenSize.width,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: <Widget>[
              //email input
              InputField(
                label: 'EMAIL',
                icon: Icons.email,
                obscureText: false,
                isSuffix: false,
              ),
              //phone input
              InputField(
                label: 'CONTACT NUMBER',
                icon: Icons.phone,
                obscureText: false,
                isSuffix: false,
              ),
              //password input field
              InputField(
                label: 'PASSWORD',
                icon: Icons.lock,
                obscureText: true,
                isSuffix: true,
              ),
              //login button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 12.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text(
                    'SIGNUP',
                    style: textTheme.button,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
