import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie_connect/Screens/classes/fire_store_clase.dart';

class Profileview extends StatelessWidget {
  Profileview({super.key});

  final Future<Map<String, dynamic>> infoUser = FireStoreclase().getUserInfo();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: infoUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final userInfo = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                      userInfo['name'] ??
                          'No Name Provided', // Valor predeterminado
                      style: TextStyle(
                        fontFamily: 'PlaywriteGBS',
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // USER INFORMATION
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "When did I born? ${userInfo['birthday'] ?? 'Unknown'}", // Valor predeterminado
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Where am I from? ${userInfo['country'] ?? 'Unknown'}", // Valor predeterminado
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "My Email: ${userInfo['email'] ?? 'Unknown'}", // Valor predeterminado
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('No se encontraron datos.');
        }
      },
    );
  }
}
