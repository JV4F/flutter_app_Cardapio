// ignore_for_file: prefer_const_constructors, implicit_call_tearoffs

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app08/model/produto.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:flutter_app08/view/cadastro_view.dart';
import 'package:flutter_app08/view/cardapio_view.dart';
import 'package:flutter_app08/view/carrinho_view.dart';
import 'package:flutter_app08/view/detalhes_view.dart';
import 'package:flutter_app08/view/esq_senha_view.dart';
import 'package:flutter_app08/view/homepage_view.dart';
import 'package:flutter_app08/view/login_view.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance; 
void main() {


  getIt.registerSingleton<ProdutoService>(ProdutoService());

  var srv = getIt<ProdutoService>();
  srv.adicionarProduto(Produto(25, "Pizza Calabresa", 'Pizza feita com molho de tomate, mussarela, calabresa, catupiry e cebola' ,'lib/image/pizzacalabresa.jpg'));
  

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
        'login'    : (context) => LoginView(),
        'recupera' : (context) => EsqSenhaView(),
        'cadastro' : (context) => CadastroView(),
        'cardapio' : (context) => CardapioView(),
        'detalhes' : (context) => DetalhesView(),
        'carrinho' : (context) => CarrinhoView(),
      },
    );
  }
}
