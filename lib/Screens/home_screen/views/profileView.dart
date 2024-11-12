import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie_connect/Screens/classes/store_clase.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)),
                height: 100,
                width: 100,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Profile Name',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          SizedBox(height: 30),
          //USER INFORMATION
          Text('NAME'),
          Text('COUNTRY'),
          Text('DESCRIPTION (OPTIONAL)'),

          TextButton(
              onPressed: () {
                Storeclase().getUserInfo();
              },
              child: Icon(Icons.abc))
        ],
      ),
    );
  }
}
