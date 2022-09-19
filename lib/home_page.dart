import 'package:flutter/material.dart';
import 'package:newsapp/detail_page.dart';
import 'package:newsapp/theame/colors.dart';


import 'artical_view.dart';
import 'article_model.dart';
import 'dbhelper.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DatabaseHelper.instance;
  List<ArticleModel> articles = <ArticleModel>[];
  late ArticleModel articalmodel;

  @override
  void initState() {
    _query();
    super.initState();
  }
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((element) {
      if (element['urlToImage'] != null && element['title'] != null && element['author']!=null &&element['url'] != null &&element['description'] != null &&element['publishedAt'] != null &&element['content'] != null  ) {
        ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            publishedAt: element["publishedAt"],
            content: element["content"]
        );

        articles.add(articleModel);

      }

    });
    setState(() => articles,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
              DrawerHeader(
                child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: FractionalOffset.topLeft,
                              child: Text("CNBC",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                  textAlign: TextAlign.left),
                            ),
                            Icon(Icons.menu)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: FractionalOffset.topLeft,
                            child: Text(
                              "Hey,Jon!",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                              ),
                            )),
                        Text(
                          "Discover Latest News",
                          style: TextStyle(fontSize: 35),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 15),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for News",
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          child: Image.asset('assets/images/politics.png'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: kPrimary,
                            fixedSize: const Size(70, 70),
                            shape: const CircleBorder(),
                          ),
                        ),
                      ),
                      Text("Politics")
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          child: Image.asset('assets/images/sport.png'),
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            primary: kPrimary,
                            fixedSize: const Size(70, 70),
                            shape: const CircleBorder(),
                          ),
                        ),
                      ),
                      Text("Sport")
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          child: Image.asset('assets/images/movie1.png'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: kPrimary,
                            fixedSize: const Size(70, 70),
                            shape: const CircleBorder(),
                          ),
                        ),
                      ),
                      Text("Movie")
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          child: Image.asset('assets/images/politics.png'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: kPrimary,
                            fixedSize: const Size(70, 70),
                            shape: const CircleBorder(),
                          ),
                        ),
                      ),
                      Text("Crime")
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    VerticalDivider(
                      color: Colors.orange,
                      thickness: 3,
                    ),
                    Text('Breaking News',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    print("object vishal");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Detail_Page(articleModel: articalmodel)));
                  },
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        articalmodel = articles[index];
                        return DrawerList(
                          image: articles[index].urlToImage,
                          title: articles[index].title,
                          time: articles[index].publishedAt,
                          url: articles[index].url,
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ArticalView(articale: articles[index]),));
                          },
                        );
                      }),
                ),
              )
            ],
          ),
        )

    );
  }
}
