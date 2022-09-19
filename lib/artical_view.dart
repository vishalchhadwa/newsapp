import 'package:flutter/material.dart';
import 'package:newsapp/article_model.dart';
import 'package:newsapp/theame/colors.dart';


class ArticalView extends StatefulWidget {
   ArticleModel articale;
  ArticalView({required this.articale});
  @override
  State<ArticalView> createState() => _ArticalViewState();
}

class _ArticalViewState extends State<ArticalView> {

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(

    body:
      SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon:Image.asset('assets/images/back.png'), onPressed: () {
                    Navigator.pop(context);
                  },),
                  CircleAvatar(
                    child: Image.asset('assets/images/user1.png'),
                  )
                ],
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(

                      child: Text("C"),backgroundColor: kPrimary),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          color: Colors.orange,
                          thickness: 3,
                        ),
                        Column(
                          children: [
                            Text(widget.articale.publishedAt,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              (widget.articale.author),
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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                (widget.articale.title),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                (widget.articale.content),
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.articale.urlToImage,
                  width: 400,
                  height: 280,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
