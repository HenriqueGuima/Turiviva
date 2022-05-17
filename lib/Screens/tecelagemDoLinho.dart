// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turiviva/Screens/menu.dart';
import 'package:video_player/video_player.dart';

class TecelagemDoLinho extends StatefulWidget {
  const TecelagemDoLinho({Key? key}) : super(key: key);

  @override
  State<TecelagemDoLinho> createState() => _TecelagemDoLinhoState();
}

class _TecelagemDoLinhoState extends State<TecelagemDoLinho> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/linho.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            icon: Icon(Icons.keyboard_arrow_left,
                color: Color.fromRGBO(0, 79, 79, 1)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              Text(
                  'Tecelagem do Linho',
                  style: TextStyle(
                    fontSize: 40,
                    color: Color.fromRGBO(0, 79, 79, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
              Container(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_controller),
                      _ControlsOverlay(controller: _controller),
                      VideoProgressIndicator(_controller, allowScrubbing: true),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  '   O linho proveniente do interior de uma planta (herbácea) que atinge cerca de um metro de altura. O cultivo do linho foi introduzido no século XVII beneficiando novos alentos para a região, sendo a base de sustento de muitas famílias. Plantado em março e apanhado em agosto, proporcionou grandes convivências entre os locais. A produção do linho, processo complexo desde a sua apanha, passando pelos vários processos de secagem, gramação, tecelagem e fiação. Atualmente a Tecelagem do Linho (loja museu) é um lugar único, tendo sido inaugurado por Maria de Lurdes Lindo em 1999, no qual se dedica à produção da tecelagem e ensinamentos de todo o processo do linho. Neste local são partilhas memórias de um passado e tradições que refletem o papel na condição de mulher na ilha de São Miguel.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration(milliseconds: 0),
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
