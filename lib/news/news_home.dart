import 'package:flutter/material.dart';
import 'package:weather_app/news/news_api.dart';

import '../utilities/app_theme.dart';
import '../utilities/news_customWidget.dart';
import 'news_card.dart';
import 'news_class.dart';

class NewsHomePage extends StatelessWidget {
  Widget _headerNews(Article article) {
    return Builder(
      builder: (context) {
        return InkWell(
            onTap: () {},
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Hero(
                  tag: 'headerImage',
                  child: customImage(article.urlToImage!),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 10, bottom: 20, top: 20),
                  color: Colors.black26,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(article.title!,
                          style: AppTheme.headline4.copyWith(
                              color: Theme.of(context).colorScheme.onSurface)),
                      Text(article.getTime(),
                          style: AppTheme.subtitle2
                              .copyWith(color: Theme.of(context).disabledColor))
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  Widget _body(
    BuildContext context,
    List<Article> list, {
    required String type,
  }) {
    print(list.length);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          title: Text(
            '${type.toUpperCase()}',
            style: AppTheme.headline5.copyWith(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 10.0,
          shadowColor: Colors.grey,
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => NewsCard(artical: list[index]),
                childCount: list.length))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     systemNavigationBarColor: Theme.of(context).backgroundColor,
    //     statusBarColor: Theme.of(context).backgroundColor));
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: FutureBuilder<List<Article>?>(
                future: NewsApiProvider().fetchNewsList(),
                builder: (context, snapshot) {
                  print(snapshot.error);

                  if (snapshot.hasData) {
                    return _body(context, snapshot.data!,
                        type: 'Top - Headlines');
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
