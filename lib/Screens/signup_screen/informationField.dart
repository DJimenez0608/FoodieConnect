import 'package:flutter/material.dart';

class Informationfield extends StatelessWidget {
  const Informationfield(
      {super.key, required this.textEditingController, required this.label});
  final String label;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
      child: SizedBox(
        width: 400,
        child: TextField(
          controller: textEditingController,
          cursorColor: Colors.orangeAccent,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            label: Text(
              label,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
