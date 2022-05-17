// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turiviva/Components/topBar.dart';
import 'package:readmore/readmore.dart';
import 'package:turiviva/Screens/menu.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              Container(
                width: 50,
              ),
              Container(
                width: 140,
                child: Image(
                  image: AssetImage("assets/logo2.png"),
                ),
              ),
              Container(
                width: 50,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                },
                icon: Icon(Icons.menu, color: Color.fromRGBO(0, 79, 79, 1)),
              ),
            ],
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            shadowColor: Color.fromARGB(0, 0, 0, 0),
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,color: Color.fromRGBO(0, 79, 79, 1)
              ),
              onPressed: () {
                Navigator.pop(context);
              
              },
            )),

        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          "Sobre",
                          style: TextStyle(
                            fontSize: 40,
                            color: Color.fromRGBO(0, 79, 79, 1),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        child: Image(
                          image: AssetImage("assets/acores.png"),
                          height: 250,
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Container(
                        height: 650,
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                        child: ReadMoreText(
                          '   Em parceria com todos os municípios da ilha de São Miguel, o projeto Turismo sénior: rotas de bem-estar e experiências locais em um ecossistema insular (Turiviva+), visa alcançar os seguintes objetivos:  i) conhecer o bem-estar global, o grau de satisfação, as experiências emocionais positivas, o envolvimento com o ecossistema insular da ilha de S. Miguel, as recomendações/sugestões expressas pelos turistas seniores que visitam a ilha de S. Miguel; apresentar narrativas de tradições e experiências/relações com os lugares mais emblemáticos da ilha; apresentar um espólio sobre o património natural e cultural e a biodiversidade da ilha de São Miguel, nos seus diferentes municípios, criar conteúdo audiovisual com exposição científica a serem divulgadas nas tecnologias de informação e comunicação com recurso a tecnologia de realidade aumentada, apresentar toras de turismo natural e cultural que promovam o bem-estar global para turistas seniores; promover os Açores como destino sénior por excelência, entre outros. Pretende-se com este projeto, evolver o turista sénior com o ecossistema insular da ilha de São Miguel e fornecer experiências positivas de bem-estar através de uma rota inovadora.',
                          trimLines: 18,
                          textAlign: TextAlign.justify,
                          colorClickableText: Colors.black,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Ler mais',
                          trimExpandedText: 'Ler menos',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          lessStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          moreStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
