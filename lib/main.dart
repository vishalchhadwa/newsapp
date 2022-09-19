import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/GetSampleApi.dart';
import 'package:newsapp/artical_view.dart';
import 'package:newsapp/article_model.dart';
import 'package:newsapp/everything_model.dart';

import 'package:newsapp/theame/app_theme.dart';

import 'dbhelper.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class DrawerList extends StatefulWidget {
  final String image, title, time, url;
  Function onTap;
  DrawerList(
      {required this.image,
      required this.title,
      required this.time,
      required this.url,
     required this.onTap,});

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  int click = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    widget.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  )),
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.title,
                        textDirection: TextDirection.ltr,
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                Text(widget.time,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black38)),
                SizedBox(
                  height: 5,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final dbHelper = DatabaseHelper.instance;
  List<ArticleModel> articles_old=<ArticleModel>[];
  List<ArticleModel> articles_sport_old=<ArticleModel>[];

  late ArticleModel articalmodel;



  getHeadlines() async {
    Everything news = Everything();
    await news.getHeadlines("in","sports");
    articles_old = news.news;


    _insert();

    // _query();
    setState(() {});
  }
  void _insert() async {
    // row to insert
    print("calling inside _insert()${articles_old.length}");
   for(int i=0;i<articles_old.length;i++) {
     Map<String, dynamic> row = {
       DatabaseHelper.author: articles_old[i].author,
       DatabaseHelper.title: articles_old[i].title,
       DatabaseHelper.description: articles_old[i].description,
       DatabaseHelper.url: articles_old[i].url,
       DatabaseHelper.urlToImage: articles_old[i].urlToImage,
       DatabaseHelper.publishedAt: articles_old[i].publishedAt,
       DatabaseHelper.content: articles_old[i].content,
     };
     final id = await dbHelper.insert(row);
     print('inserted row id: $id');
   }
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getHeadlines();


    print("Vishal init state");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,

      home: HomePage(),
    );
  }
}




