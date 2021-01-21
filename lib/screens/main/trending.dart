import 'package:Newsly/models/genNews.dart';
import 'package:Newsly/screens/article/articleview.dart';
import 'package:Newsly/screens/main/categorynews.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'newstile.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  var _loading;
  var newslist;

  void getNews() async {
    TrendNews news = TrendNews();
    await news.getNews();
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
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TRENDING',
              style: TextStyle(color: Colors.orange, fontSize: 12),
            ),
            _loading
                ? Center(child: CircularProgressIndicator())
                : buildTrending(),
            SizedBox(height: 5),
            Text(
              'Today`s Reads',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Expanded(
              // height: 400,
              child: _loading
                  ? Center(child: CircularProgressIndicator())
                  : _buildTodays(),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildTodays() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        if (index == 0)
          return Container();
        else
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ArticleView(
                          posturl: newslist[index].articleUrl ?? "",
                          imgUrl: newslist[index].urlToImage ?? "",
                          desc: newslist[index].description ?? "",
                          title: newslist[index].title ?? "",
                          content: newslist[index].content ?? "",
                          datetime:
                              newslist[index].publshedAt ?? DateTime.now(),
                          author: newslist[index].author ?? "")));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      newslist[index].urlToImage,
                      height: 200,
                      width: MediaQuery.of(context).size.width * .7,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(newslist[index].title,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }

  ListView buildTrending() {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              NewsTile(
                imgUrl: newslist[index].urlToImage ?? "",
                title: newslist[index].title ?? "",
                desc: newslist[index].description ?? "",
                content: newslist[index].content ?? "",
                posturl: newslist[index].articleUrl ?? "",
                dateTime: newslist[index].publshedAt ?? DateTime.now(),
                author: newslist[index].author ?? "",
              )
            ],
          );
        });
  }
}
