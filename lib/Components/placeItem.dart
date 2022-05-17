// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
//typedef RouteOneCallBack = SingleRoute Function(String value);

class PlaceItem extends StatelessWidget {
  PlaceItem(
      {Key? key,
      required this.index,
      required this.height,
      required this.width,
      required this.title,
      this.child
      //required this.destination,
      })
      : super(key: key);
  final int index;
  final double height;
  final double width;
  final String title;
  final Widget? child;
  //final RouteOneCallBack destination;
  //final Function() destination;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              child: Column(
                children: [
                  Image.network(
                    list[index],
                    fit: BoxFit.cover,
                    height: height,
                    width: width,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    color: Color.fromRGBO(102,153,153, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(7),
                            width: 150,
                            height: 40,
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  overflow: TextOverflow.visible,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 20),
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => child!, //change this to get parameter
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
