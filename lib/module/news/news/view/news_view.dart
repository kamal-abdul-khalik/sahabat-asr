import 'package:flutter/material.dart';
import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';

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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: KListView(
                enableSearch: true,
                future: (page, search) async {
                  return await NewsService.getAllNews(page, search);
                },
                itemBuilder: (Map item, int index) {
                  return InkWell(
                    onTap: () => Get.to(NewsSingleView(news: item)),
                    child: NewsCard(
                      imageUrl: AppConfig.urlImage + item['thumbnail'],
                      category: item['category']['name'],
                      title: item['title'],
                      createdAt: item['created_at'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<NewsView> createState() => NewsController();
}
