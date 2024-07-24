import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        height: 40,
        child: Text("Post 1"),
      ),
    );
  }
}
