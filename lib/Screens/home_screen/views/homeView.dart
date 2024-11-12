import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homeview extends StatelessWidget {
  Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange[300],
        child: Icon(Icons.add_to_photos),
      ),
    );
  }
}
