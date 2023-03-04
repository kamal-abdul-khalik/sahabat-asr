import 'package:flutter/material.dart';
import 'package:kta_asr/shared/widget/form/textfield/text_field_search.dart';

class KListView extends StatefulWidget {
  final Function(int page, String search) future;
  final Function(Map item, int page) itemBuilder;
  const KListView({
    super.key,
    required this.future,
    required this.itemBuilder,
  });

  @override
  State<KListView> createState() => _KListViewState();
}

class _KListViewState extends State<KListView> {
  List items = [];
  int page = 1;
  String search = '';
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    loadData();
    scrollController.addListener(() {
      var offset = scrollController.offset;
      var maxOffset = scrollController.position.maxScrollExtent;
      if (offset == maxOffset) {
        page++;
        loadData();
      }
    });

    super.initState();
  }

  loadData() async {
    var newItems = await widget.future(page, search);
    items.addAll(newItems);
    setState(() {});
  }

  reload() async {
    page = 1;
    items.clear();
    await loadData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => reload(),
      child: Column(
        children: [
          KTextFieldSearch(
            onFieldSubmitted: (val) {
              search = val;
              page = 1;
              items.clear();
              loadData();
            },
          ),
          const SizedBox(height: 5.0),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: items.length,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                var item = items[index];
                return widget.itemBuilder(item, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
