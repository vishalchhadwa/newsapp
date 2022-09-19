import 'package:flutter/material.dart';
import 'package:newsapp/article_model.dart';

class Detail_Page extends StatefulWidget {
  final ArticleModel articleModel;
  const Detail_Page({Key? key,required this.articleModel}) : super(key: key);

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(scrollDirection:Axis.vertical ,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios),
                  CircleAvatar(
                    child: Image.asset('assets/images/sport.png'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                      child: Image.network(widget.articleModel.urlToImage)),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          color: Colors.orange,
                          thickness: 3,
                        ),
                        Column(
                          children: [
                            Text(widget.articleModel.publishedAt,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              (widget.articleModel.author),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              (widget.articleModel.title),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              (widget.articleModel.content),
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
            Image.network(
              widget.articleModel.urlToImage,
              width: 400,
              height: 280,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    ) ;
  }
}
