import 'package:flutter/material.dart';

import 'PageQuarto.dart';

abstract class Quarto {
  String _nomeQuarto;
  int _quantidadeQuarto;
  List<Widget> adds = [];

  Quarto({
    required nomeQuarto,
    required quantidadeQuarto,
  })  : _nomeQuarto = nomeQuarto,
        _quantidadeQuarto = quantidadeQuarto;

  List<Widget> get getAdds => adds;

  String get getNomeQuarto {
    return _nomeQuarto;
  }

  set setNomeQuarto(String nomeQuarto) => _nomeQuarto = nomeQuarto;

  int get getQuantidadeQuarto {
    return _quantidadeQuarto;
  }

  set setQuantidadeQuarto(int quantidadeQuarto) =>
      _quantidadeQuarto = quantidadeQuarto;

  Widget CriadorWidgetQuarto() {
    Widget QuartoLuxo = Container(
      width: 300,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: QuantidadeQuarto(
        nome: this.getNomeQuarto,
        quantidade: this.getQuantidadeQuarto,
      ),
    );

    return QuartoLuxo;
  }

  Widget CriadorWidgetAlunosQuarto() {
    Widget AlunoQuarto = const Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.add_box_sharp,
        size: 50.0,
      ),
    );

    return AlunoQuarto;
  }
}

class QuartoSimples extends Quarto {
  QuartoSimples({
    required String nomeQuarto,
    required int quantidadeQuarto,
  }) : super(
          nomeQuarto: nomeQuarto,
          quantidadeQuarto: quantidadeQuarto,
        );

  CriarQuarto() {
    adds.add(CriadorWidgetQuarto());
  }
}
