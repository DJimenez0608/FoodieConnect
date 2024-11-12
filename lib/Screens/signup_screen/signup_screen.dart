import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie_connect/Screens/classes/auth_class.dart';
import 'package:foodie_connect/Screens/classes/store_clase.dart';
import 'package:foodie_connect/Screens/classes/user_class.dart';
import 'package:foodie_connect/Screens/signup_screen/informationField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String fecha =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();
  String? country;
  void showDialogError(String m) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Text(
                'ERROR!',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                m,
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'))
          ],
        );
      },
    );
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      final userCredencial = await AuthClass().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialogError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showDialogError('The account already exists for that email.');
      }
    } catch (e) {
      showDialogError(e.toString());
    }

    UserC newUser = UserC(
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      country: country,
      birthday: fecha,
    );

    try {
      Storeclase().saveUser(newUser);
    } catch (e) {
      showDialogError(e.toString());
    }
  }

  void showCalendar() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'))
          ],
          content: SizedBox(
            height: 350,
            width: 350,
            child: CalendarDatePicker(
              initialDate: DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              onDateChanged: (date) {
                setState(
                  () {
                    fecha = '${date.day}/${date.month}/${date.year}';
                    _dateController.text = fecha;
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text(
            'New Chef',
            style: TextStyle(
              fontFamily: 'PlaywriteGBS',
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Informationfield(
              label: "Chef's name",
              textEditingController: _nameController,
            ),
            Informationfield(
              textEditingController: _emailController,
              label: 'Associated email',
            ),
            Informationfield(
              textEditingController: _passwordController,
              label: 'Password',
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        fecha.toString(),
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.centerLeft,
                    icon: Icon(Icons.calendar_month),
                    onPressed: showCalendar,
                    iconSize: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  showCountryPicker(
                      countryListTheme: const CountryListThemeData(
                        backgroundColor: Colors.white,
                      ),
                      showPhoneCode: false,
                      showWorldWide: true,
                      searchAutofocus: true,
                      context: context,
                      onSelect: (Country c) {
                        setState(() {
                          country = c.name.toString().toUpperCase();
                        });
                      });
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  width: 400,
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      country ?? 'Where do you live',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 370,
              child: ElevatedButton(
                onPressed: createUserWithEmailAndPassword,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
