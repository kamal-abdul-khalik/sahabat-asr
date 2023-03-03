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
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[300]!,
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: null,
                      decoration: const InputDecoration.collapsed(
                        filled: true,
                        fillColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        hintText: "Search",
                      ),
                      onChanged: (value) {
                        // controller.runFilter(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: KListView(
                future: (page) async {
                  return await NewsService.getAllNews();
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
