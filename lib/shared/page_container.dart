import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  final Widget child;

  const PageContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Corex Flutter Test"),
      //   centerTitle: true,
      //   backgroundColor: Colors.grey.shade300,
      //   toolbarHeight: 30,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: child,
      ),
    );
  }
}
