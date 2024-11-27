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
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'firebase_options.dart';
import 'service/produto_service.dart';
import 'service/usuario_servide.dart';
import 'view/cardapios/bebidas_view.dart';
import 'view/cardapios/cardapioDoce_view.dart';
import 'view/cardapios/cardapioSal_view.dart';
import 'view/cardapios/detalhes_view.dart';
import 'view/user/cadastro_view.dart';
import 'view/user/esq_senha_view.dart';
import 'view/user/homepage_view.dart';
import 'view/user/login_view.dart';
import 'view/utilidades/carrinho_view.dart';
import 'view/utilidades/categoria_view.dart';
import 'view/utilidades/confirma_pedido_view.dart';

//Inicialização do getIT
final getIt = GetIt.instance; 

Future<void> main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  //Para que possamos atrelar o getIt ao UsuarioService
  getIt.registerSingleton<UsuarioService>(UsuarioService());

  //Para que possamos atrelar o getIt ao ProdutoService
  getIt.registerSingleton<ProdutoService>(ProdutoService());
  
 
  runApp(
    DevicePreview(
      enabled: false,
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
