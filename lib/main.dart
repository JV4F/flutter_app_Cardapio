// ignore_for_file: prefer_const_constructors, implicit_call_tearoffs

/*Sumário

Pasta "image": Fica armazenado as imagens dos produtos.
Pasta "model": Fica as classes 
Pasta "service": Fica os serviços que podem ser realizados por sua respectiva classe
Pasta "view": Fica as telas

**Dentro da pasta view temos a pasta cardapios, user e utilidades

**Dentro da pasta cardapios temos as pastas bebidas, doce e sal

Pasta "sal": fica o cardapio e os detalhes das pizzas salgadas
Pasta "doce": fica o cardapio e os detalhes das pizzas doces
Pasta "bebidas": fica o cardapio e os detalhes das bebidas


**Dentro da pasta user temos as telas relacionadas aos usuarios(homepage, login, esq_senha e cadastro)


**Dentro da pasta utilidades temos as telas relacionadas ao funcionamento do app(categoria, carrinho e confirma_pedido)

*/

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app08/model/produto.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:flutter_app08/service/usuario_servide.dart';
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

//Inicialização do getIT
final getIt = GetIt.instance; 

void main() {

  //Para que possamos atrelar o getIt ao UsuarioService
  getIt.registerSingleton<UsuarioService>(UsuarioService());

  //Para que possamos atrelar o getIt ao ProdutoService
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
      initialRoute: 'homepage', //Definição da tela inicial Padrão

      //Rotas para as telas
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
