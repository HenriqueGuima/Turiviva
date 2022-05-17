// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_new, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:turiviva/Components/routeItem.dart';
import 'package:turiviva/Screens/menu.dart';
import '../Maps/grandeRota.dart';

class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
              icon: Icon(Icons.keyboard_arrow_left,
                  color: Color.fromRGBO(0, 79, 79, 1)),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Column(
          children: [
            Container(
              height: 20,
            ),
            Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: Text(
                      "Rotas",
                      style: TextStyle(
                        fontSize: 40,
                        color: Color.fromRGBO(0, 79, 79, 1),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  Column(children: <Widget>[
                    RouteItem(
                      index: 9,
                      width: 250,
                      height: 200,
                      title: "Grande Rota",
                      child: GrandeRota(),
                    ),
                  ])
                  // GridView.count(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   crossAxisCount: 2,
                  //   childAspectRatio: 1,
                  //   children: [
                  //     RouteItem(
                  //       index: 0,
                  //       width: 150,
                  //       height: 110,
                  //       title: "Rota Religiosa",
                  //       child: RotaReligiosa(),
                  //       //destination: RouteOne(),
                  //     ),
                  //     RouteItem(
                  //       index: 1,
                  //       width: 150,
                  //       height: 110,
                  //       title: "Grande Rota",
                  //       child: GrandeRota(),
                  //     ),
                  //     RouteItem(
                  //       index: 1,
                  //       width: 150,
                  //       height: 110,
                  //       title: "Rota Histórica",
                  //       child: RotaHistorica(),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
