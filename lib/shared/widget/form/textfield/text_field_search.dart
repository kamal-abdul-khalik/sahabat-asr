import 'package:flutter/material.dart';

class KTextFieldSearch extends StatefulWidget {
  final Function(String)? onFieldSubmitted;
  final Function()? onPressed;
  final Widget? icon;
  const KTextFieldSearch(
      {super.key, required this.onFieldSubmitted, this.onPressed, this.icon});

  @override
  State<KTextFieldSearch> createState() => _KTextFieldSearchState();
}

class _KTextFieldSearchState extends State<KTextFieldSearch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
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
                    // onChanged: widget.onChanged,
                    onFieldSubmitted: widget.onFieldSubmitted,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: widget.onPressed,
          icon: widget.icon ??
              const Icon(
                Icons.refresh,
                size: 24.0,
              ),
        ),
      ],
    );
  }
}
