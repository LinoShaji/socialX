import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/error.dart';
import 'package:news_api_flutter_package/model/source.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News API Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final NewsAPI _newsAPI = NewsAPI("e129e4a3eca540609b88441f9aef8875");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: TextFormField(
          decoration: const InputDecoration(
              hintText: "Search in feed",
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ))),
      bottom: _buildTabBar(),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
      tabs: [
        Tab(text: "Top Headlines"),
      ],
    );
  }

  Widget _buildBody() {
    return TabBarView(
      children: [
        _buildTopHeadlinesTabView(),
      ],
    );
  }

  Widget _buildTopHeadlinesTabView() {
    return Container(
      margin: EdgeInsets.all(20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
            blurStyle: BlurStyle.normal, blurRadius: 2.0, color: Colors.grey),
      ]),
      child: FutureBuilder<List<Article>>(
          future: _newsAPI.getTopHeadlines(country: "us"),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? snapshot.hasData
                    ? _buildArticleListView(snapshot.data!)
                    : _buildError(snapshot.error as ApiError)
                : _buildProgress();
          }),
    );
  }

  Widget _buildArticleListView(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        Article article = articles[index];
        return Card(
          child: ListTile(
            title: Text(article.title!, maxLines: 2),
            subtitle: Text(article.description ?? "", maxLines: 3),
            trailing: article.urlToImage == null
                ? null
                : Image.network(article.urlToImage!),
          ),
        );
      },
    );
  }

  Widget _buildProgress() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildError(ApiError error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error.code ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(error.message!, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
