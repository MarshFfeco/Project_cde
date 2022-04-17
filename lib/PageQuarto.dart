import 'dart:html';

import 'package:fadbaquarto/Quarto.dart';
import 'package:flutter/material.dart';

class PageQuarto extends StatefulWidget {
  const PageQuarto({Key? key}) : super(key: key);

  @override
  State<PageQuarto> createState() => _PageQuartoState();
}

class _PageQuartoState extends State<PageQuarto> {
  QuartoSimples qs1 =
      QuartoSimples(nomeQuarto: "nomeQuarto", quantidadeQuarto: 0);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          width: double.infinity,
          height: height,
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
              Text("Quartos"),
              Container(
                  width: width * 0.5,
                  height: height * 0.5,
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
                  child: Column(
                    children: qs1.adds,
                  ))
            ],
          )),
    );
  }
}
