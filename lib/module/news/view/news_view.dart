import 'package:flutter/material.dart';
import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';
import 'package:kta_asr/module/news/widget/news_card.dart';
import 'package:kta_asr/service/news_service.dart';
import 'package:kta_asr/shared/widget/form/list/k_list_view.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  Widget build(context, NewsController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Kabar Asr"),
        actions: const [],
      ),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: KListView(
                future: (page, search) async {
                  return await NewsService.getAllNews(page, search);
                },
                itemBuilder: (Map item, int index) {
                  return NewsCard(
                    imageUrl: AppConfig.urlImage + item['thumbnail'],
                    category: item['category']['name'],
                    title: item['title'],
                    body: item['content'],
                    createdAt: item['created_at'],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<NewsView> createState() => NewsController();
}
