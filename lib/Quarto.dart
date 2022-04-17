import 'package:flutter/material.dart';

import 'PageQuarto.dart';

abstract class Quarto {
  String nomeQuarto;
  int quantidadeQuarto;
  List<Widget> adds = [];

  Quarto({
    required this.nomeQuarto,
    required this.quantidadeQuarto,
  });

  List<Widget> get getListaAdd {
    return adds;
  }

  Widget QuartoLuxo = Expanded(
      child: Container(
    height: 400,
    width: 400,
    margin: const EdgeInsets.all(10),
    color: Colors.tealAccent,
    child: const Center(
      child: Text("Luxo"),
    ),
  ));

  Widget QuartoSimple = Expanded(
      child: Container(
          height: 200,
          width: 200,
          margin: const EdgeInsets.all(10),
          color: Colors.amberAccent,
          child: Row(
            children: [
              const Expanded(
                child: Icon(Icons.bed),
                flex: 1,
              ),
              const Expanded(
                child: Icon(Icons.person),
                flex: 2,
              ),
              Expanded(
                child: IconButton(
                  onPressed: (() {}),
                  icon: Icon(Icons.more_vert),
                ),
                flex: 1,
              ),
            ],
          )));
}

class QuartoSimples extends Quarto {
  QuartoSimples({
    required String nomeQuarto,
    required int quantidadeQuarto,
  }) : super(
          nomeQuarto: nomeQuarto,
          quantidadeQuarto: quantidadeQuarto,
        );

  CriarQuartoSimples() {
    if (adds.length <= 6) {
      return adds.add(QuartoSimple);
    } else {
      print("Quarto cheio");
    }
  }

  CriarQuartoLuxo() {
    if (adds.length <= 6) {
      return adds.add(QuartoLuxo);
    } else {
      print("Quarto cheio");
    }
  }
}
