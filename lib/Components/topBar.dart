import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turiviva/Screens/menu.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Color.fromRGBO(0,79,79, 1)
              ),
            ),
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
              icon: Icon(
                Icons.menu,
                color: Color.fromRGBO(0,79,79, 1)
              ),
            ),
          ],
        ),
      );

  }
}
