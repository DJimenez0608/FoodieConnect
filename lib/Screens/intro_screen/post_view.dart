import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  const PostView(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          width: 400,
          height: 500,
          decoration: const BoxDecoration(
            color: Color(0xffFFF4CC),
            borderRadius: BorderRadius.all(
              Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                image,
                width: 320,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontFamily: 'PlaywriteGBS',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 2),
                child: Text(textAlign: TextAlign.center, description),
              )
            ],
          ),
        ),
      ),
    );
  }
}
