// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app08/view/cadastro_view.dart';
import 'package:flutter_app08/view/cardapio_view.dart';
import 'package:flutter_app08/view/carrinho_view.dart';
import 'package:flutter_app08/view/detalhes_view.dart';
import 'package:flutter_app08/view/homepage_view.dart';


void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
      )
    );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',


      routes: {
        'homepage' : (context) => HomePageView(),
        'cadastro' : (context) => CadastroView(),
        'cardapio' : (context) => CardapioView(),
        'detalhes' : (context) => DetalhesView(),
        'carrinho' : (context) => CarrinhoView(),
      },
    );
  }
}
