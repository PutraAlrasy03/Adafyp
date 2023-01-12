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
  final List<String> _imageUrls = [
    "assets/images/socmed.png",
    "assets/images/socmed.png",
    "assets/images/socmed.png",
    "assets/images/socmed.png",
  ];

  final List<String> _captions = [
    'Caption for image 1',
    'Caption for image 2',
    'Caption for image 3',
    'Caption for image 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _imageUrls.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('assets/images/${_imageUrls[index]}',
                width: 50, height: 50, fit: BoxFit.cover),
            title: Text(_captions[index]),
          );
        },
      ),
    );
  }
}
