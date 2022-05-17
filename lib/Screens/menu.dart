// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:turiviva/Components/menuBtn.dart';
import 'package:turiviva/Components/openLink.dart';
import 'package:turiviva/Screens/about.dart';
import 'package:turiviva/Screens/contactScreen.dart';
import 'package:turiviva/Screens/pontosDeInteresse.dart';
import 'routes.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            //Logo image
            Container(
              child: Image(
                image: AssetImage("assets/logo1.png"),
                height: 150,
              ),
            ),
            //Menu buttons
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuButton(
                      title: "Sobre",
                      child: AboutScreen(),
                      icon: Icon(Icons.info),
                    ),
                    //Rotas
                    MenuButton(
                      title: "Rotas",
                      child: Routes(),
                      icon: Icon(Icons.directions),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Pontos de Interesse
                    MenuButton(
                      title: "Visite",
                      child: PontosDeInteresse(),
                      icon: Icon(Icons.place),
                    ),
                    //Sistema de Informação Geográfica
                    OpenLink(
                        title: 'Plataforma',
                        icon: Icon(Icons.map),
                        link:
                            'https://turiviva.maps.arcgis.com/apps/Embed/index.html?webmap=b3a287dfab8b453d9dd9a0feb5bdfc1b&extent=-25.9987,37.5908,-24.9845,38.0048&home=true&zoom=true&scale=false&search=true&searchextent=true&disable_scroll=true&theme=light'),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OpenLink(
                        title: 'Questionário',
                        icon: Icon(Icons.question_answer_outlined),
                        link: 'https://forms.gle/p1GihzsCFdnQ1Zym9'),

                    //Contacto
                    MenuButton(
                      title: "Contacto",
                      child: ContactScreen(),
                      icon: Icon(Icons.contact_mail),
                    ),
                  ],
                ),

                // Container(
                //   margin: EdgeInsets.only(top: 40),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         "EN",
                //         style: TextStyle(fontSize: 20),
                //       ),
                //       Text(
                //         "|",
                //         style: TextStyle(fontSize: 20),
                //       ),
                //       Text(
                //         "PT",
                //         style: TextStyle(fontSize: 20),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
