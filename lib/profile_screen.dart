// ignore_for_file: prefer_const_constructors

import 'package:adib/mail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:adib/main.dart';
import 'package:adib/search.dart';
import 'package:adib/home_screen.dart';
import 'package:adib/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Color.fromARGB(255, 36, 145, 248),
              secondary: Color.fromARGB(255, 36, 145, 248),
              tertiary: Color.fromARGB(255, 35, 57, 129)),
          scaffoldBackgroundColor: Color.fromARGB(255, 208, 196, 229)),
      home: const MyHomePage(
        title: 'MarketSpace',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  late FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.formMap(value.data());
      setState(() {});
    });
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var _page = 0;
  final pages = [HomeScreen(), Mail(), Search()];
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: FancyDrawerWrapper(
            backgroundColor: Color.fromARGB(255, 241, 69, 126),
            controller: _controller,
            drawerItems: <Widget>[
              Text(
                  "${loggedInUser.firstName} "
                  "${loggedInUser.secondName}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 32, 55, 129),
                      fontWeight: FontWeight.w500)),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 32, 55, 129),
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
            child: Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _controller.toggle();
                  },
                ),
              ),
              body: PageView(
                controller: _pageController,
                onPageChanged: (newIndex) {
                  setState(() {
                    _currentIndex = newIndex;
                  });
                },
                children: [
                  HomeScreen(),
                  Search(),
                  Mail(),
                ],
              ),
              bottomNavigationBar: CurvedNavigationBar(
                index: _currentIndex,
                color: Color.fromARGB(255, 36, 145, 248),
                backgroundColor: Color.fromARGB(255, 233, 130, 61),
                buttonBackgroundColor: Color.fromARGB(255, 36, 145, 248),
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 400),
                onTap: (newIndex) {
                  setState(() {
                    _pageController.animateToPage(newIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  });
                },
                items: [
                  Icon(Icons.home, color: Colors.white),
                  Icon(Icons.search, color: Colors.white),
                  Icon(Icons.mail, color: Colors.white),
                ],
              ),
            )));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
