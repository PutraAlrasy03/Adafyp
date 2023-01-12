import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:adib/item.dart';
import 'package:adib/add_post.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbRef = FirebaseDatabase.instance.reference().child('Posts');
  List<Item> searchList = ITEM_LIST;

  void _toggleFavorite(int index) {
    setState(() {
      searchList[index].favorite = searchList[index].favorite == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Item> searchList = ITEM_LIST
        .where((element) =>
            element.name.toLowerCase().contains(text.toLowerCase()))
        .toList();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 130, 61),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FirebaseAnimatedList(
                        query: dbRef.child('Post List'),
                        itemBuilder: (BuildContext context,
                            DataSnapshot snapshot,
                            Animation<double> _,
                            int index) {
                          return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 185, 175, 241),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: FadeInImage.assetNetwork(
                                              fit: BoxFit.cover,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .25,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1,
                                              placeholder:
                                                  'assets/images/load.png',
                                              image: snapshot
                                                  .child('pImage')
                                                  .value
                                                  .toString()),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            snapshot
                                                .child('pTitle')
                                                .value
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            snapshot
                                                .child('pDescription')
                                                .value
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        //Add the row widget here to display the icons side by side
                                        Row(
                                          children: <Widget>[
                                            searchList[index].favorite == 0
                                                ? IconButton(
                                                    icon: Icon(
                                                        Icons.favorite_border),
                                                    color: Colors.red,
                                                    onPressed: () {
                                                      _toggleFavorite(index);
                                                    },
                                                  )
                                                : IconButton(
                                                    icon: Icon(Icons.favorite,
                                                        color: Colors.red),
                                                    onPressed: () {
                                                      _toggleFavorite(index);
                                                    },
                                                  ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            //Other icons here
                                            searchList[index].favorite == 0
                                                ? IconButton(
                                                    icon: Icon(
                                                        Icons.favorite_border),
                                                    color: Colors.red,
                                                    onPressed: () {
                                                      _toggleFavorite(index);
                                                    },
                                                  )
                                                : IconButton(
                                                    icon: Icon(Icons.favorite,
                                                        color: Colors.red),
                                                    onPressed: () {
                                                      _toggleFavorite(index);
                                                    },
                                                  ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            //Other icons here
                                          ],
                                        )
                                      ])));
                        }),
                  )
                ])),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddPostScreen()));
          },
          child: const Icon(Icons.edit),
        ));
  }
}
