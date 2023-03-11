import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class NewsLimit extends StatefulWidget {
  final Function() future;
  final Function(Map item, int page) itemBuilder;
  final double? height;
  const NewsLimit({
    super.key,
    required this.future,
    required this.itemBuilder,
    this.height,
  });

  @override
  State<NewsLimit> createState() => _NewsLimitState();
}

class _NewsLimitState extends State<NewsLimit> {
  List items = [];
  int page = 1;
  String search = '';
  bool loading = true;
  DioError? dioError;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future loadData() async {
    if (!mounted) return;
    loading = true;
    setState(() {});

    dioError = null;
    try {
      items = await widget.future();
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

    loading = false;
    if (mounted) setState(() {});
  }

  reload() async {
    if (mounted) {
      await loadData();
    }
  }

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
              "Belum ada data",
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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];
        return widget.itemBuilder(item, index);
      },
    );
  }
}
