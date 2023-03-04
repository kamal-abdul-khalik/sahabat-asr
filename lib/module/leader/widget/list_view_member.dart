import 'package:flutter/material.dart';

class ListViewMember extends StatefulWidget {
  final String imageUrl;
  final Widget trailing;
  final String title;
  final String subtitle;
  const ListViewMember({
    super.key,
    required this.imageUrl,
    required this.trailing,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ListViewMember> createState() => _ListViewMemberState();
}

class _ListViewMemberState extends State<ListViewMember> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          backgroundImage: NetworkImage(
            widget.imageUrl,
          ),
        ),
        trailing: widget.trailing,
        title: Text(widget.title),
        subtitle: Text(widget.subtitle),
      ),
    );
  }
}
