import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;

  Color backgroundColor = Colors.blueGrey;

  @override
  void initState() {
    scrollController = ScrollController();

    scrollController.addListener(() {
      print(scrollController.offset);

      if (scrollController.offset > 1000.00) {
        setState(() {
          backgroundColor = Colors.lightBlue;
        });
      } else {
        setState(() {
          backgroundColor = Colors.blueGrey;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: ListView(
          controller: scrollController,
          children: const [
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
            Text('SEif'),
          ],
        ),
      ),
    );
  }
}
