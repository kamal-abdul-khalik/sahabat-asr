import 'package:flutter/material.dart';

class KListView extends StatefulWidget {
  final Function(int page) future;
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
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    items = await widget.future(page);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        var item = items[index];
        return widget.itemBuilder(item, index);
      },
    );
  }
}
