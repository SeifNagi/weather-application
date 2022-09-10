import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: const VerticalDivider(
        color: Colors.grey,
        thickness: 1,
        indent: 20,
        width: 20,
      ),
    );
  }
}
