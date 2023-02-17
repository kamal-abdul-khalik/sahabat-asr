import 'package:flutter/material.dart';
import 'package:kta_asr/config.dart';
import 'package:kta_asr/core.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  Widget build(context, NewsController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<NewsView> createState() => NewsController();
}
