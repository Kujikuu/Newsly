import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Newsly/models/article.dart';

class GenNews {
  List<Article> news = [];

  Future<void> getNews() async {
    String apiKey = '4cbd1f1711314c15a965251a4dfa7d5d';

    String url =
        "http://newsapi.org/v2/top-headlines?excludeDomains=stackoverflow.com&excludeDomains=aljazeera.com&sortBy=publishedAt&language=en&apiKey=${apiKey}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class TrendNews {
  List<Article> news = [];

  Future<void> getNews() async {
    String apiKey = '4cbd1f1711314c15a965251a4dfa7d5d';

    String url =
        "http://newsapi.org/v2/top-headlines?excludeDomains=stackoverflow.com&excludeDomains=aljazeera.com&sortBy=popularity&language=en&apiKey=${apiKey}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class CatNews {
  List<Article> news = [];

  Future<void> getNews(String category) async {
    String apiKey = '4cbd1f1711314c15a965251a4dfa7d5d';

    String url =
        "http://newsapi.org/v2/top-headlines?language=ar&category=${category}&apiKey=${apiKey}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class SearchNews {
  List<Article> news = [];

  Future<void> getNews(String category) async {
    String apiKey = '4cbd1f1711314c15a965251a4dfa7d5d';

    String url =
        "http://newsapi.org/v2/top-headlines?q=${category}&apiKey=${apiKey}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
