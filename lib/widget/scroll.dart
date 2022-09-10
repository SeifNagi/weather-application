import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("My App Bar"),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: Colors.teal),
            ),
            backgroundColor: Colors.yellow,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const SingleChildScrollView(
                child: Text("Hosain"),
              ),
              childCount: 90,
            ),
          )
        ],
      ),
    );
  }
}
