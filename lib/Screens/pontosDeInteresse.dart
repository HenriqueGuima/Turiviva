// ignore_for_file: unnecessary_new, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:turiviva/Components/placeItem.dart';
import 'package:turiviva/Components/topBar.dart';
import 'package:turiviva/Screens/menu.dart';
import 'package:turiviva/Screens/placeScreen.dart';
import 'package:turiviva/Screens/tabaco.dart';
import 'package:turiviva/Screens/tecelagemDoLinho.dart';

class PontosDeInteresse extends StatefulWidget {
  const PontosDeInteresse({Key? key}) : super(key: key);

  @override
  State<PontosDeInteresse> createState() => _PontosDeInteresseState();
}

class _PontosDeInteresseState extends State<PontosDeInteresse> {
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
            )),

        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1,
            children: [
              PlaceItem(
                index: 1,
                width: 150,
                height: 110,
                title: 'Caldeiras',
                child: PlaceScreen(
                  title: 'Caldeiras',
                  index: 1,
                  text:
                      '   Situadas na freguesia das Furnas (Povoação), as caldeiras são consideradas o ex-líbris por quem as visita, podendo ser observadas aqui um conjunto de caldeiras com águas em grande erupção. Aqui podem ser vistas as lamas sulfúricas e a enorme quantidade de nascentes de água (quentes, temperadas, frias e gasificadas), tendo uma das fontes de água mineral azeda, dado origem ao famoso queijo artesanal, considerado como único. Nestas caldeiras são cozidas as maçarocas de milho que podem ser saboreadas no Verão. Aqui se encontra o Observatório Microbiano dos Açores, promotor do conhecimento sobre a biodiversidade e ecologia microbiana.',
                ),
              ),
              PlaceItem(
                index: 2,
                width: 150,
                height: 110,
                title: 'Portas da Cidade',
                child: PlaceScreen(
                  title: 'Portas da Cidade',
                  index: 2,
                  text: 'A Inserir Informação',
                ),
              ),
              PlaceItem(
                index: 3,
                width: 150,
                height: 110,
                title: 'Museu de Arte Sacra',
                child: PlaceScreen(
                  title: 'Museu de Arte Sacra',
                  index: 3,
                  text: 'A Inserir Informação',
                ),
              ),
              PlaceItem(
                index: 4,
                width: 150,
                height: 110,
                title: 'Cerâmica Vieira',
                child: PlaceScreen(
                  title: 'Cerâmica Vieira',
                  index: 4,
                  text:
                      '   A primeira geração da fábrica de Cerâmica Vieira remonta de 1896 por Bernardino da Silva que para a concretização deste projeto constituiu sociedade com Manuel Leite Pereira, Tomás D’Água Boim e Manuel Joaquim D’Amaral. A segunda geração foi representada por António Jacinto da Silva (natural da lagoa) casado com a sobrinha de Bernardino da Silva a quem deixou a fábrica através de herança. Sucederam à terceira geração Guilherme Borges Gouveia e José Augusto Martins Vieira, este último, assume a fábrica em 1941 até 1974, dando do seu nome à indústria. A quarta geração representada por António José da Silva Martins Vieira, em 1985 adquire a Cerâmica Leite integrando-a na Cerâmica Vieira em 1991. A quinta geração é assim composta por uma sociedade por António José da Silva Martins Vieira e suas três filhas.',
                ),
              ),
              PlaceItem(
                index: 5,
                width: 150,
                height: 110,
                title: 'Convento dos Franciscanos',
                child: PlaceScreen(
                  title: 'Convento dos Franciscanos',
                  index: 5,
                  text:
                      '   A primeira geração da fábrica de Cerâmica Vieira remonta de 1896 por Bernardino da Silva que para a concretização deste projeto constituiu sociedade com Manuel Leite Pereira, Tomás D’Água Boim e Manuel Joaquim D’Amaral. A segunda geração foi representada por António Jacinto da Silva (natural da lagoa) casado com a sobrinha de Bernardino da Silva a quem deixou a fábrica através de herança. Sucederam à terceira geração Guilherme Borges Gouveia e José Augusto Martins Vieira, este último, assume a fábrica em 1941 até 1974, dando do seu nome à indústria. A quarta geração representada por António José da Silva Martins Vieira, em 1985 adquire a Cerâmica Leite integrando-a na Cerâmica Vieira em 1991. A quinta geração é assim composta por uma sociedade por António José da Silva Martins Vieira e suas três filhas.',
                ),
              ),
              PlaceItem(
                index: 6,
                width: 150,
                height: 110,
                title: 'Igreja Matriz',
                child: PlaceScreen(
                  title: 'Igreja Matriz',
                  index: 6,
                  text:
                      '   A Igreja Matriz de São Miguel Arcanjo, na qual a sua construção foi ordenada por Infante Dom Henrique no século XV. Apesar de existir informação se que a igreja fora soterrada em 1522 por um grande sismo, Gaspar Frutuoso (cronista Micaelense) atribui a tragédia à fragilidade dos terrenos causada pela cultura intensa do pastel (planta Isatis Tinctoria) utilizada nos processos de tinturaria caseira. ',
                ),
              ),
              PlaceItem(
                index: 7,
                width: 150,
                height: 110,
                title: 'Ermida Nossa Senhora das Vitórias',
                child: PlaceScreen(
                  title: 'Ermida Nossa Senhora das Vitórias',
                  index: 7,
                  text:
                      '   Inaugurada em 1886, a Ermida Nossa Senhora das Vitórias, de estilo neogótico, foi mandada erguer por José do Canto (promotor da introdução de novas culturas e tecnologias agrícolas nos Açores), cumprindo assim um voto formulado por ocasião de uma doença grave de sua esposa. Nesta ermida jaz José do Canto e sua esposa Maria Guilhermina Taveira Brum do Canto. A sua riqueza é caracterizada pela imagem do altar-mor feita de jaspe (quartzo de coloração vermelha) e pelos riquíssimos vitrais em toda a ermida que além de evocar os passos da vida de nossa Senhora das Vitórias, estão gravadas iniciais dos nomes José do Canto e sua esposa (JM). Pretendeu José do Canto que a presente ermida fosse uma imitação das grandes catedrais europeias.',
                ),
              ),
              PlaceItem(
                index: 8,
                width: 150,
                height: 110,
                title: 'Fumarolas',
                child: PlaceScreen(
                  title: 'Fumarolas',
                  index: 8,
                  text: '   A inserir informação',
                ),
              ),
              PlaceItem(
                index: 9,
                width: 150,
                height: 110,
                title: 'Jardim Terra Nostra',
                child: PlaceScreen(
                  title: 'Jardim Terra Nostra',
                  index: 9,
                  text:
                      '   A origem deste parque teve início em 1775 quando Thomas Hickling mandou construir uma casa em madeira com um grande tanque de água e o rodeou de árvores. Propriedade adquirida pelo Visconde da Praia em 1848, tendo aumentado a propriedade em dois hectares onde construiu a casa do Parque e plantou um belo jardim. A ampliação do espaço pela aquisição de várias parcelas durou até 1890, tendo sido adquirido mais tarde (1935) pela Sociedade Terra Nostra sob direção de Vasco Bensaude que restaurou o Jardim com a intervenção do jardineiro John McInroy. O Parque Nostra conta com mais de 3 000 exemplares de espécies arbóreas e arbustos, permitindo assim uma riqueza de flora endémica dos Açores.',
                ),
              ),
              PlaceItem(
                index: 10,
                width: 150,
                height: 110,
                title: 'Praça do Município',
                child: PlaceScreen(
                  title: 'Praça do Município',
                  index: 10,
                  text: '   Inserir Informção',
                ),
              ),
              PlaceItem(
                index: 11,
                width: 150,
                height: 110,
                title: 'Ermida Nossa Senhora do Pranto',
                child: PlaceScreen(
                  title: 'Ermida Nossa Senhora do Pranto',
                  index: 11,
                  text:
                      '   Ermida de Nossa Senhora do Pranto é um espaço de grande devoção religiosa desde o ano de 1523. Segundo a tradição, numa época em que um surto de peste assolava o concelho de Ponta Delgada, um jovem pastor avistou a Nossa Senhora e a Virgem que ordenou a construção de uma ermida. A lenda, faz referência que os populares decidiram levantar a ermida junto à estrada de forma a facilitar a sua construção, muito influenciada pela falta de água. Para espanto da população as pedras foram movimentadas por Nossa Senhora para o local junto ao mar, no qual mais tarde brotou água da parede da ermida. Muitas pessoas acorrem à ermida nos sete domingos da Quaresma para pagar as suas promessas à Senhora do Pranto.',
                ),
              ),
              PlaceItem(
                index: 12,
                width: 150,
                height: 110,
                title: 'Tecelagem do Linho',
                child: TecelagemDoLinho(),
              ),
              PlaceItem(
                index: 13,
                width: 150,
                height: 110,
                title: 'Museu do Tabaco',
                child: Tabaco(),
              ),
              PlaceItem(
                index: 14,
                width: 150,
                height: 110,
                title: 'Fábrica de Chá Gorreana',
                child: PlaceScreen(
                  title: 'Fábrica de Chá Gorreana',
                  index: 14,
                  text:
                      '   A Fábrica de Chá Gorreana, iniciou a sua produção em 1883, considerando-se a mais antiga e única plantação de chá da Europa. Chá cem por cento biológico, no qual não são utilizados quaisquer tipos de produtos químicos (herbicidas, pesticidas, fungicidas, outros). Através da visita à fábrica é possível contemplar as memórias de cinco gerações na plantação e todo o processo de produção do chá. Além da visita à fábrica de Chá Gorreana e prova dos tipos de chá, pode disfrutar-se dos trilhos através das plantações de chã, usufruindo de paisagens únicas para o mar. ',
                ),
              ),
              PlaceItem(
                index: 15,
                width: 150,
                height: 110,
                title: 'Fábrica de Chá Porto Formoso',
                child: PlaceScreen(
                  title: 'Fábrica de Chá Porto Formoso',
                  index: 15,
                  text: '   Inserir Informação',
                ),
              ),
              PlaceItem(
                index: 16,
                width: 150,
                height: 110,
                title: 'Praça do Município',
                child: PlaceScreen(
                  title: 'Praça do Município',
                  index: 16,
                  text:
                      '   Na praça do município da Ribeira Grande além de se completar o seu jardim, é possível visitar três edifícios de relevo no concelho: A igreja do Senhor dos Passos, também conhecida como igreja do Espirito Santo datado de 1592, na qual está bem presente o estilo açórico, com traços de barroco com uma decoração exuberante e o uso de basalto de rocha negra; a Câmara Municipal que tem a sua data de construção no século XVI, apresentando uma escadaria exterior, uma torre do relógio e uma janela do estilo manuelino, símbolo do poder político e municipal; o teatro da Ribeira Grande com uma construção mais recente datado de 1920, tornou-se uma verdadeira sala de espetáculos.',
                ),
              ),
              PlaceItem(
                index: 17,
                width: 150,
                height: 110,
                title: 'Poços de São Vicente',
                child: PlaceScreen(
                  title: 'Poços de São Vicente',
                  index: 17,
                  text: '   Inserir Informação',
                ),
              ),
              PlaceItem(
                index: 18,
                width: 150,
                height: 110,
                title: 'Oficina Museu',
                child: PlaceScreen(
                  title: 'Oficina Museu',
                  index: 18,
                  text: '   Inserir Informação',
                ),
              ),
              PlaceItem(
                index: 19,
                width: 150,
                height: 110,
                title: 'Vista do Rei',
                child: PlaceScreen(
                  title: 'Vista do Rei',
                  index: 19,
                  text: '   Inserir Informação',
                ),
              ),
              PlaceItem(
                index: 20,
                width: 150,
                height: 110,
                title: 'Campo de São Francisco',
                child: PlaceScreen(
                  title: 'Campo de São Francisco',
                  index: 20,
                  text: '   Inserir Informação',
                ),
              ),
            ],
          ),
        ),

        // Column(
        //   children: [
        //     TopBar(),
        //     Container(
        //       height: 20,
        //     ),
        //     Expanded(
        //       child: new Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisSize: MainAxisSize.max,
        //         children: [
        //           Container(
        //             child: Text(
        //               "Pontos de Interesse",
        //               style: TextStyle(
        //                 fontSize: 40,
        //                 color: Color.fromRGBO(0, 79, 79, 1),
        //               ),
        //             ),
        //           ),
        //           Container(
        //             height: 20,
        //           ),
        //           ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
