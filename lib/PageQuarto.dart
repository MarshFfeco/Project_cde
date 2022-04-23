import 'dart:html';

import 'package:fadbaquarto/Quarto.dart';
import 'package:flutter/material.dart';

class PageQuarto extends StatefulWidget {
  const PageQuarto({Key? key}) : super(key: key);

  @override
  State<PageQuarto> createState() => _PageQuartoState();
}

class _PageQuartoState extends State<PageQuarto> {
  QuartoSimples qs1 = QuartoSimples(nomeQuarto: "nome", quantidadeQuarto: 5);

  @override
  Widget build(BuildContext context) {
    String nome;
    int quantidade;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: width * 0.5,
                height: height * 0.1,
                child: ElevatedButton(
                    child: Text("ADD Quarto"),
                    onPressed: () {
                      qs1.CriarQuartoSimples();
                      setState(() {});
                    }),
              ),
              Container(
                width: width * 0.5,
                height: height * 0.1,
                child: ElevatedButton(
                    child: Text("ADD Quarto Luxo"),
                    onPressed: () {
                      qs1.CriarQuartoLuxo();
                      setState(() {});
                    }),
              ),
              Container(
                  width: double.infinity,
                  height: height * 0.7,
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  child: ListView.builder(
                    itemCount: qs1.adds.length,
                    itemBuilder: (context, index) => qs1.adds[index],
                  ))
            ],
          )),
    );
  }
}

class QuantidadeQuarto extends StatelessWidget {
  QuantidadeQuarto({Key? key, required this.nome, required this.quantidade})
      : super(key: key);

  String nome;
  int quantidade;
  QuartoSimples qs2 = QuartoSimples(nomeQuarto: "", quantidadeQuarto: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(nome),
          ),
          SizedBox(
            child: Wrap(
              children: [
                for (int i = 0; i < quantidade; i++)
                  qs2.CriadorWidgetAlunosQuarto()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
