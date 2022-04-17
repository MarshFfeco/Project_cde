import 'package:flutter/material.dart';

import 'PageQuarto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pagina do quarto',
      home: PageQuarto(),
    );
  }
}
