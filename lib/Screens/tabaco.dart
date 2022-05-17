// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:turiviva/Screens/menu.dart';
import 'package:video_player/video_player.dart';

class Tabaco extends StatefulWidget {
  const Tabaco({Key? key}) : super(key: key);

  @override
  State<Tabaco> createState() => _TabacoState();
}

class _TabacoState extends State<Tabaco> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/tabaco.mp4')
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
                  'Museu do Tabaco',
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
                  '   A fábrica de Tabacos da Maia, fundada em 1971 por Manuel Bento Sousa, laborou até 1988, permanecendo as memórias dos processos técnicos da produção agrária e industrial do tabaco. Este museu contribuiu para a preservação da memória histórica, social e cultural do tabaco, que apesar de ser uma fábrica familiar, foi considerado o maior espaço de trabalho da freguesia da Maia. Integra recursos de património que podem ser contemplados através da sala de pesagem e prensagem, secador de lume direto e indireto, ponte-báscula e plantações de tabaco.',
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
