import 'package:Newsly/screens/article/sourceview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:html/dom.dart' as dom;

class ArticleView extends StatefulWidget {
  final String imgUrl, title, desc, content, posturl, author;
  final DateTime datetime;
  ArticleView(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      this.datetime,
      this.author,
      @required this.posturl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SourceView(postUrl: widget.posturl)));
              },
              child: Text(
                'source'.toUpperCase(),
                style: TextStyle(color: Colors.orange),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 15, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(imageUrl: widget.imgUrl),
              ),
              SizedBox(height: 20),
              // Text(
              //   'TRENDING',
              //   style: TextStyle(color: Colors.orange, fontSize: 11),
              // ),
              SizedBox(height: 5),
              Text(
                widget.title,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30),
              // Html(
              //   data: widget.content,
              //   padding: EdgeInsets.all(8.0),
              //   onLinkTap: (url) {
              //     print("Opening $url...");
              //   },
              //   customRender: (node, children) {
              //     if (node is dom.Element) {
              //       switch (node.localName) {
              //         case "custom_tag": // using this, you can handle custom tags in your HTML
              //           return Column(children: children);
              //       }
              //     }
              //   },
              // ),
              Text(
                widget.desc,
                // maxLines: 2,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    timeago.format(widget.datetime, allowFromNow: false),
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                  // Text(
                  //   widget.author,
                  //   maxLines: 2,
                  //   style: TextStyle(
                  //       color: Colors.black87,
                  //       fontSize: 10,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
