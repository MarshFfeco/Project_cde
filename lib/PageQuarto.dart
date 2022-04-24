import 'dart:async';

import 'package:fadbaquarto/Quarto.dart';
import 'package:flutter/material.dart';

class PageQuarto extends StatefulWidget {
  const PageQuarto({Key? key}) : super(key: key);

  @override
  State<PageQuarto> createState() => _PageQuartoState();
}

class _PageQuartoState extends State<PageQuarto> {
  QuartoSimples qs1 =
      QuartoSimples(nomeQuarto: "_nomeQuarto", quantidadeQuarto: 4);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    TextEditingController _nomeQuarto = TextEditingController();
    TextEditingController _quantidadeQuarto = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              width: width * 0.5,
              height: height * 0.3,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      //FORM PARA O NOME DO QUARTO
                      child: TextFormField(
                        controller: _nomeQuarto,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            hintText: "Digite o nome de Quarto"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite Algo';
                          }
                          qs1.setNomeQuarto = value.toString();
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      //FORM PARA A QUANTIDADE DE ALUNO
                      child: TextFormField(
                        controller: _quantidadeQuarto,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: "Digite a quantidade de Quarto"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite Algo';
                          }
                          qs1.setQuantidadeQuarto = int.parse(value.toString());
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: ElevatedButton(
                          child: const Text("Adicionar Quarto"),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              qs1.CriarQuarto();
                              setState(() {});

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Quarto Adicionado!')),
                              );
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width * 0.7,
              height: height * 0.6,
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
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: ListView.builder(
                itemCount: qs1.adds.length,
                itemBuilder: (context, index) => qs1.adds[index],
              ),
            )
          ],
        ),
      ),
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
