import 'package:flutter/material.dart';

class NewsLimit extends StatefulWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String createdAt;
  const NewsLimit({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.createdAt,
  });

  @override
  State<NewsLimit> createState() => _NewsLimitState();
}

class _NewsLimitState extends State<NewsLimit> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.category,
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.createdAt,
                          style: const TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      widget.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
