import 'package:flutter/material.dart';

class hhhh extends StatefulWidget {
  const hhhh({Key? key}) : super(key: key);

  @override
  State<hhhh> createState() => _hhhhState();
}

class _hhhhState extends State<hhhh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 100,
          ),
          SliverList(delegate: SliverChildListDelegate([])),
        ],
      ),
    );
  }
}
