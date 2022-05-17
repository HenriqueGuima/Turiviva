// ignore_for_file: unnecessary_new, prefer_const_constructors, sized_box_for_whitespace

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(102,153,153, 1),
          elevation: 0.0,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50),
          ),
        ),
        child: FittedBox(
          child: Text(text),
        ),
        onPressed: onClicked,
      );
}

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(102,153,153, 1),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: new Row(
                    children: [
                      Container(
                        width: 250,
                        child: Text(
                          "Contacte-nos",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                ),
                Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
          //leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ),
        backgroundColor: const Color(0xfff5f5fd),
        body: Center(
          child: Container(
            height: 450,
            width: 400,
            margin: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: Colors.grey[300]!)
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Envie-nos uma mensagem!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Obrigatório';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Obrigatório*';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: messageController,
                    decoration: const InputDecoration(hintText: 'Mensagem'),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Obrigatório';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 45,
                    width: 110,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color.fromRGBO(102,153,153, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final response = await sendEmail(
                              nameController.value.text,
                              emailController.value.text,
                              messageController.value.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            response == 200
                                ? const SnackBar(
                                    content: Text('Mensagem enviada!'),
                                    backgroundColor: Colors.green)
                                : const SnackBar(
                                    content: Text('Falha ao enviar mensagem!'),
                                    backgroundColor: Colors.red),
                          );
                          nameController.clear();
                          emailController.clear();
                          messageController.clear();
                        }
                      },
                      child: const Text(
                        'Enviar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future sendEmail(String name, String email, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(
      {
        'service_id': 'service_x2wispo',
        'template_id': 'template_3kf0hue',
        'user_id': 'YyjLGX4ebDhpgSPd4',
        'template_params': {
          'from_name': name,
          'from_email': email,
          'message': message
        }
      },
    ),
  );
  return response.statusCode;
}
