import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NewsAPI _newsAPI = NewsAPI("e129e4a3eca540609b88441f9aef8875");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: const [
              Icon(Icons.search, color: Colors.blue),
              Text(
                "   Search in feed",
                style: TextStyle(color: Colors.blue),
              )
            ],
          )),
    );
  }
}
