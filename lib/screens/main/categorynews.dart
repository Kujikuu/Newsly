import 'package:Newsly/models/genNews.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'newstile.dart';

class CategoryNewsPage extends StatefulWidget {
  final String catname;
  CategoryNewsPage({this.catname});
  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  var _loading;
  var newslist;

  void getNews() async {
    CatNews news = CatNews();
    await news.getNews(widget.catname);
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 25, right: 25),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.catname.toUpperCase(),
                style: TextStyle(color: Colors.orange, fontSize: 12),
              ),
              SizedBox(height: 10),
              Expanded(
                child: _loading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: newslist.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsTile(
                            imgUrl: newslist[index].urlToImage ?? "",
                            title: newslist[index].title ?? "",
                            desc: newslist[index].description ?? "",
                            content: newslist[index].content ?? "",
                            posturl: newslist[index].articleUrl ?? "",
                            dateTime:
                                newslist[index].publshedAt ?? DateTime.now(),
                            author: newslist[index].author ?? "",
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
