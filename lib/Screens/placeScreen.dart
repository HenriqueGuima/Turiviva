// ignore_for_file: unnecessary_new, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:turiviva/Maps/grandeRota.dart';
import 'package:turiviva/Screens/menu.dart';

class PlaceScreen extends StatefulWidget {
  const PlaceScreen(
      {Key? key,
      required this.title,
      // required this.image,
      required this.text,
      required this.index})
      : super(key: key);
  final int index;
  final String title;
  // final String image;
  final String text;

  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  List<String> list = [
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A1-placa+entrada.jpg',
    'https://byacores.com/wp-content/uploads/2017/10/IMG_20160919_160549.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Portas_p_delgada.jpg/1200px-Portas_p_delgada.jpg',
    'https://museucarlosmachado.azores.gov.pt/media/cache/18/24/1824b86ca4145788d2f9bba4adbfa505.jpg',
    'http://artesanato.azores.gov.pt/wp-content/uploads/2019/10/upa-129-ceramica-vieria-foto-02.jpg',
    'https://lagoa-acores.pt/api/v1/portal/nodes/48d4e377b5734de68b507551b32443fa/binary/conteudo?lang=pt',
    'https://www.allfromazores.pt/sites/default/files/styles/big_artigo/public/igreja_matriz_nossa_senhora_mae_de_deus.jpg?itok=3IN1aWV9',
    'https://upload.wikimedia.org/wikipedia/commons/1/1d/Capela_de_Nossa_Senhora_das_Vit%C3%B3rias.jpg',
    'https://dobrarfronteiras.com/wp-content/uploads/2015/04/fumarola.jpg',
    'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/1b/48/62/terra-nostra-garden-pool.jpg?w=1200&h=-1&s=1',
    'https://i.pinimg.com/originals/60/19/f0/6019f0bb28e35f7728715c2e4fc758d5.jpg',
    'https://www.igrejaacores.pt/wp-content/uploads/2016/02/ermida_sra_pranto_0_dr_ia_600-400.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCYylNe5XtnlZxt0UEEGUmKA2lJ52A34_0sE2MqVaGojguU5JDVBfGxQQbmIDyuZMnf8U&usqp=CAU',
    'https://ensina.rtp.pt/site-uploads/2020/03/MuseuTabacoMaia-854x480.jpg',
    'https://byacores.com/wp-content/uploads/2017/11/IMG_1051-3-1800x1200.jpg',
    'https://byacores.com/wp-content/uploads/2019/08/cha-porto-formoso-rone-view-byacores-sao-miguel-acores-01.jpg',
    'https://bordalo.observador.pt/v2/q:85/rs:fill:3900:2196/c:3900:2196:nowe:0:202/plain/https://s3.observador.pt/wp-content/uploads/2022/02/01001559/GettyImages-170498179.jpg',
    'https://bandeiraazul.abae.pt/plataforma/public/images/p22.Po%C3%A7os_2020.JPG',
    'https://thebestofazores.com/wp-content/uploads/2019/09/Best-of-Azores-oficina-Museu-2.jpg',
    'https://www.destinazores.com/wp-content/uploads/2018/04/Vista-do-Rei-2.jpg',
    'http://d3e1m60ptf1oym.cloudfront.net/205f13b8-515e-11e0-80d2-83ae51a0538e/10382d4_xgaplus.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A8-ancoradouro.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A9-ancoradouro.jpg',
  ];
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
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GrandeRota()),
                  );
              },
            )),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 40,
                    color: Color.fromRGBO(0, 79, 79, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Image(
                  // image: AssetImage(widget.image),
                  image: NetworkImage(
                    list[widget.index],
                  ),
                  height: 250,
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  // new Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisSize: MainAxisSize.max,
                  //   children: [

                  //     // Container(
                  //     //   child: ClipRRect(
                  //     //     borderRadius: BorderRadius.circular(15),
                  //     //     child: ElevatedButton(
                  //     //       style: ElevatedButton.styleFrom(
                  //     //         padding: EdgeInsets.symmetric(
                  //     //             vertical: 15, horizontal: 40),
                  //     //         elevation: 0,
                  //     //         primary: Color.fromRGBO(254, 191, 44, 1),
                  //     //       ),
                  //     //       onPressed: () {},
                  //     //       child: Text(
                  //     //         "LER MAIS",
                  //     //         style: TextStyle(fontSize: 20),
                  //     //       ),
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
