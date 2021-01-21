import 'package:Newsly/models/genNews.dart';
import 'package:Newsly/screens/main/home.dart';
import 'package:Newsly/screens/main/newstile.dart';
import 'package:Newsly/screens/main/trending.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  var searchQuery;
  SearchPage({this.searchQuery});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void handleTextInputSubmit(var input) {
    if (input != '') {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (_) => new SearchPage(searchQuery: input)));
    }
  }

  var _loading;
  var newslist;

  void getNews() async {
    SearchNews news = SearchNews();
    await news.getNews(widget.searchQuery);
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

  final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios),
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => HomeScreen(),
        //         ));
        //   },
        // ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: widget.searchQuery == null ? buildTitle() : Container(),
        // actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: widget.searchQuery == null ? Container() : buildContents(),
    );
  }

  Container buildContents() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 25, right: 25),
      child: _loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (newslist.length >= 1)
                    Expanded(
                      child: _loading
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: newslist.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return buildNews(index);
                              }),
                    )
                  else
                    Center(
                      child: Text(
                          'Threse no data with query${widget.searchQuery}'),
                    )
                ],
              ),
            ),
    );
  }

  NewsTile buildNews(int index) {
    return NewsTile(
      imgUrl: newslist[index].urlToImage ?? "",
      title: newslist[index].title ?? "",
      desc: newslist[index].description ?? "",
      content: newslist[index].content ?? "",
      posturl: newslist[index].articleUrl ?? "",
      dateTime: newslist[index].publshedAt ?? DateTime.now(),
      author: newslist[index].author ?? "",
    );
  }

  Padding buildTitle() {
    return Padding(
        padding: new EdgeInsets.all(0.0),
        child: new PhysicalModel(
          color: Colors.white,
          // elevation: 3.0,
          child: new TextField(
            controller: _controller,
            onSubmitted: handleTextInputSubmit,
            decoration: new InputDecoration(
                hintText: 'Finding a News?', icon: new Icon(Icons.search)),
          ),
        ));
  }
}
