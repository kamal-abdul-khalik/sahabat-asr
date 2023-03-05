import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';
import 'package:kta_asr/shared/widget/form/textfield/text_field_search.dart';

class KListView extends StatefulWidget {
  final Function(int page, String search) future;
  final Function(Map item, int page) itemBuilder;
  final double? height;
  final bool enableSearch;
  const KListView({
    super.key,
    required this.future,
    required this.itemBuilder,
    this.enableSearch = false,
    this.height,
  });

  @override
  State<KListView> createState() => _KListViewState();
}

class _KListViewState extends State<KListView> {
  List items = [];
  int page = 1;
  String search = '';
  bool loading = true;
  DioError? dioError;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    loadData();
    initScrollController();
    super.initState();
  }

  initScrollController() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        loadData(nextPage: true);
      }
    });
  }

  Future loadData({
    bool nextPage = false,
  }) async {
    if (!mounted) return;
    if (!nextPage) {
      page = 1;
      items.clear();
      loading = true;
      setState(() {});
    } else {
      page++;
    }

    dioError = null;
    try {
      var newItems = await widget.future(page, search);
      items.addAll(newItems);
    } on DioError catch (_) {
      dioError = _;
      debugPrint("DioError: $_");
    } on Exception catch (_) {
      debugPrint("Exception: $_");
    }

    if (dioError != null) {
      loading = false;
      if (mounted) setState(() {});
      return;
    }

    // Map responseMap = response?.data;
    // List data = responseMap["data"];

    if (items.isEmpty) {
      page--;
    }

    // for (var i = 0; i < data.length; i++) {
    //   var item = data[i];
    //   items.add(item);
    // }

    loading = false;
    if (mounted) setState(() {});
  }

  // loadData() async {
  //   var newItems = await widget.future(page, search);
  //   items.addAll(newItems);
  //   setState(() {});
  // }

  reload() async {
    if (mounted) {
      await loadData();
    }
  }

  // reload() async {
  //   page = 1;
  //   items.clear();
  //   await loadData();
  // }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      );
    }
    if (dioError != null) {
      return SizedBox(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dio Error : ${dioError?.message}",
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text("Retry"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                loadData();
              },
            ),
          ],
        ),
      );
    }

    if (items.isEmpty) {
      return SizedBox(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Terjadi kesalahan tak terduga",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text("Refresh"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                loadData();
              },
            ),
          ],
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: () => reload(),
      child: Column(
        children: [
          if (widget.enableSearch) ...[
            KTextFieldSearch(
              onPressed: () => reload(),
              onFieldSubmitted: (val) {
                search = val;
                page = 1;
                items.clear();
                loadData();
              },
            ),
            const SizedBox(height: 5.0),
          ],
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
