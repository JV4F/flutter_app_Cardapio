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
  //
  // PIZZAS SALGADAS
  //
  srv.salgada.add(Produto(65, 'Brocolis com Bacon',
  'asfaff',
  'lib/image/salgada_brocolis_bacon.jpg'));

  srv.salgada.add(Produto(60, 'Calabresa',
  'asfaff',
  'lib/image/salgada_calabresa.jpg'));

  srv.salgada.add(Produto(70, 'Frango com catupiry',
  'sufuvb',
  'lib/image/salgada_frango_catupiry.jpg'));

  srv.salgada.add(Produto(65, 'Marguerita',
  'sufuvb',
  'lib/image/salgada_marguerita.jpg'));

  srv.salgada.add(Produto(60, 'Mussarela',
  'sufuvb',
  'lib/image/salgada_mussarela.jpg'));

  srv.salgada.add(Produto(60, 'Tomate Cereja',
  'sufuvb',
  'lib/image/salgada_tomate_cereja.jpg'));

  srv.salgada.add(Produto(65, 'Doritos',
  'sufuvb',
  'lib/image/salgada_doritos.jpg'));

  srv.salgada.add(Produto(95, 'Filé Mignon',
  'sufuvb',
  'lib/image/salgada_file_mignon.jpg'));

  srv.salgada.add(Produto(85, 'Camarão',
  'sufuvb',
  'lib/image/salgada_camarao.jpg'));

  srv.salgada.add(Produto(80, 'Carne Seca',
  'sufuvb',
  'lib/image/salgada_carne_seca.jpg'));

  srv.salgada.add(Produto(65, 'Milho',
  'sufuvb',
  'lib/image/salgada_milho.jpg'));

  srv.salgada.add(Produto(70, 'Portuguesa',
  'sufuvb',
  'lib/image/salgada_portuguesa.jpg'));


  // PIZZAS DOCES
  srv.doce.add(Produto(60, 'Banana com doce de leite',
  'asfaff',
  'lib/image/doce_banana_doce_leitte.jpg',));

  srv.doce.add(Produto(55, 'Chocolate', 
  'abdiubgud',
  'lib/image/doce_chocolate.jpg'));

    srv.doce.add(Produto(60, 'Chocolate com morango',
  'asfaff',
  'lib/image/doce_chocolate_morango.jpg',));

    srv.doce.add(Produto(60, 'Churros',
  'asfaff',
  'lib/image/doce_churros.jpg',));

    srv.doce.add(Produto(65, 'Floresta negra',
  'asfaff',
  'lib/image/doce_floresta_negra.jpg',));

    srv.doce.add(Produto(70, 'KitKat',
  'asfaff',
  'lib/image/doce_kitkat.jpg',));

    srv.doce.add(Produto(75, 'Ninho com uvas',
  'asfaff',
  'lib/image/doce_ninho_uva.jpg',));

    srv.doce.add(Produto(65, 'Prestígio',
  'asfaff',
  'lib/image/doce_prestigio.jpg',));

    srv.doce.add(Produto(60, 'Romeu e Julieta',
  'asfaff',
  'lib/image/doce_romeu_julieta.jpg',));

  //BEBIDAS
  srv.bebida.add(Produto(9.50, 'Coca-Cola',
  'asfaff',
  'lib/image/bebida_coca.jpg'));

  srv.bebida.add(Produto(7.50, 'Água',
  'asfaff',
  'lib/image/bebida_agua.jpg'));

  srv.bebida.add(Produto(18, 'Caipirinha',
  'asfaff',
  'lib/image/bebida_caipirinha.jpg'));

  srv.bebida.add(Produto(80, 'Espumante',
  'asfaff',
  'lib/image/bebida_espumante.jpg'));

  srv.bebida.add(Produto(9.50, 'Guaraná',
  'asfaff',
  'lib/image/bebida_guarana.jpg'));

  srv.bebida.add(Produto(13, 'Suco de laranja',
  'asfaff',
  'lib/image/bebida_suco_laranja.jpg'));

    srv.bebida.add(Produto(13, 'Suco de limão',
  'asfaff',
  'lib/image/bebida_suco_limao.jpg'));

    srv.bebida.add(Produto(15, 'Suco de morango',
  'asfaff',
  'lib/image/bebida_suco_morango.jpg'));

    srv.bebida.add(Produto(120, 'Vinho seco',
  'asfaff',
  'lib/image/bebida_vinho_seco.jpg'));

    srv.bebida.add(Produto(100, 'Vinho tinto',
  'asfaff',
  'lib/image/bebida_vinho_tinto.jpg'));

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
