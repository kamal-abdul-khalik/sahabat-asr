import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';
import '../controller/news_single_controller.dart';

class NewsSingleView extends StatefulWidget {
  final Map? news;
  const NewsSingleView({Key? key, this.news}) : super(key: key);

  Widget build(context, NewsSingleController controller) {
    controller.view = this;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "${news!['title']}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    AppConfig.urlImage + news!['thumbnail'],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news!['title'],
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    news!['created_at'],
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const Divider(),
                  const SizedBox(height: 5.0),
                  Html(data: """ ${news!['content']} """),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<NewsSingleView> createState() => NewsSingleController();
}
