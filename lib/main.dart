// ignore_for_file: prefer_const_constructors, implicit_call_tearoffs

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app08/model/produto.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:flutter_app08/view/cardapios/bebidas/bebidas_view.dart';
import 'package:flutter_app08/view/cardapios/sal/detalhesSal_view.dart';
import 'package:flutter_app08/view/utilidades/confirma_pedido_view.dart';
import 'package:flutter_app08/view/user/cadastro_view.dart';
import 'package:flutter_app08/view/cardapios/doce/cardapioDoce_view.dart';
import 'package:flutter_app08/view/cardapios/sal/cardapioSal_view.dart';
import 'package:flutter_app08/view/utilidades/carrinho_view.dart';
import 'package:flutter_app08/view/utilidades/categoria_view.dart';
import 'package:flutter_app08/view/user/esq_senha_view.dart';
import 'package:flutter_app08/view/user/homepage_view.dart';
import 'package:flutter_app08/view/user/login_view.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance; 
void main() {


  getIt.registerSingleton<ProdutoService>(ProdutoService());

  var srv = getIt<ProdutoService>();
  srv.salgada.add(Produto(25, 'Calabresa', 'asfaff', 'lib/image/pizzacalabresa.jpg'));
  srv.salgada.add(Produto(30, 'frango', 'sufuvb', 'lib/image/pizzacalabresa.jpg'));
  srv.doce.add(Produto(25, 'Romeu e Julieta', 'asfaff', 'lib/image/pizzacalabresa.jpg',));
  srv.doce.add(Produto(15, 'Abacaxi com choc', 'abdiubgud', 'lib/image/pizzacalabresa.jpg'));
  srv.bebida.add(Produto(25, 'Coca-Cola', 'asfaff', 'lib/image/pizzacalabresa.jpg'));
  
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
        'homepage'          : (context) => HomePageView(),
        'login'             : (context) => LoginView(),
        'cadastro'          : (context) => CadastroView(),
        'recupera'          : (context) => EsqSenhaView(),
        'categoria'         : (context) => CategoriaView(),
        'cardapiosal'       : (context) => CardapiosalView(),
        'cardapiodoce'      : (context) => CardapiodoceView(),
        'bebidas'           : (context) => BebidasView(),
        'detalhessal'       : (context) => DetalhessalView(),
        'detalhesdoce'      : (context) => DetalhessalView(),
        'detalhesbebidas'   : (context) => DetalhessalView(),
        'carrinho'          : (context) => CarrinhoView(),
        'confirma'          : (context) => ConfirmaPedidoView(),
      },
    );
  }
}
