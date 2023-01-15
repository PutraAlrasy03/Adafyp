import 'package:adib/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:adib/main.dart';
import 'package:adib/user_model.dart';
import 'package:adib/category_card.dart';
import 'package:adib/search_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Mail extends StatefulWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  State<Mail> createState() => _MailState();
}

class _MailState extends State<Mail> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final SATimages = [
    'assets/images/pts.jpg',
    'assets/images/jpas.png',
    'assets/images/mara.jpg',
    'assets/images/pt2.png',
    'assets/images/ua.jpg',
    'assets/images/is.jpg',
    'assets/images/phg.jpg',
  ];

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
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: CarouselSlider.builder(
                        itemCount: SATimages.length,
                        itemBuilder: (context, index, realIndex) {
                          final SATimage = SATimages[index];
                          return buildImage(SATimage, index);
                        },
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.3,
                          //height: 300,
                          //viewportFraction: 1,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          //enlargeStrategy: CenterPageEnlargeStrategy.height,
                          //autoPlayInterval: Duration(seconds: 3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Chinese New Year",
                          subtitle: "1/02/2023",
                          svgSrc: "assets/icons/Banknegara.svg",
                          press: () => launch(
                              'https://www.bnm.gov.my/careers/scholarships'),
                        ),
                        CategoryCard(
                          title: "Awal Ramadan",
                          subtitle: "3/04/2023",
                          svgSrc: "assets/icons/jpa.svg",
                          press: () => launch(
                              'https://www.index.my/permohonan-biasiswa-jpa-program-ijazah-dalam-negara-pidn/'),
                        ),
                        CategoryCard(
                          title: "Hari Pekerja",
                          subtitle: "1/05/2023",
                          svgSrc: "assets/icons/PTPTN1.svg",
                          press: () => launch('https://www.ptptn.gov.my/'),
                        ),
                        CategoryCard(
                          title: "Hari Raya Aidilfitri",
                          subtitle: "2/05/2023",
                          svgSrc: "assets/icons/shell3.svg",
                          press: () => launch(
                              'https://www.shell.com.my/careers/students-and-graduates/scholarships.html'),
                        ),
                        CategoryCard(
                          title: "Hari Wesak",
                          subtitle: "15/05/23",
                          svgSrc: "assets/icons/yk4.svg",
                          press: () =>
                              launch('https://www.yayasankhazanah.com.my'),
                        ),
                        CategoryCard(
                          title: "Hari Gawai",
                          subtitle: "1/06/2023",
                          svgSrc: "assets/icons/tun2.svg",
                          press: () => launch(
                              'https://www.yayasantar.org.my/scholarships/biasiswa-tunku-abdul-rahman/'),
                        ),
                        CategoryCard(
                          title: "Hari Keputeraan YDP Agong",
                          subtitle: "6/06/2023",
                          svgSrc: "assets/icons/kt2.svg",
                          press: () => launch(
                              'https://www.karangkraf.com/biasiswa-karangkraf/'),
                        ),
                        CategoryCard(
                          title: "Hari Raya Haji",
                          subtitle: "11/07/2023",
                          svgSrc: "assets/icons/br1.svg",
                          press: () => launch(
                              'https://application.yayasanbankrakyat.com.my/'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }

  Widget buildImage(String SATimage, int index) => ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 1), //40  //1
          color: Colors.grey,
          child: Image.asset(SATimage, fit: BoxFit.cover),
        ),
      );
}
