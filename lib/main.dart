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
import 'package:flutter_app08/view/cardapios/bebidas_view.dart';
import 'package:flutter_app08/view/cardapios/detalhes_view.dart';
import 'package:flutter_app08/view/utilidades/confirma_pedido_view.dart';
import 'package:flutter_app08/view/user/cadastro_view.dart';
import 'package:flutter_app08/view/cardapios/cardapioDoce_view.dart';
import 'package:flutter_app08/view/cardapios/cardapioSal_view.dart';
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
  'Massa crocante, molho de tomate fresco, queijo derretido, pedaços de brócolis levemente salteados e fatias de bacon crocante. Uma combinação perfeita de sabores suaves e defumados!',
  'lib/image/salgada_brocolis_bacon.jpg'));

  srv.salgada.add(Produto(60, 'Calabresa',
  'Massa crocante, molho de tomate caseiro, queijo derretido e fatias generosas de calabresa levemente picante. Uma combinação clássica e saborosa que agrada todos os paladares!',
  'lib/image/salgada_calabresa.jpg'));

  srv.salgada.add(Produto(70, 'Frango com catupiry',
  'Massa crocante, molho de tomate suave, frango desfiado temperado e uma generosa camada de cremoso catupiry. Sabor irresistível e super cremoso!',
  'lib/image/salgada_frango_catupiry.jpg'));

  srv.salgada.add(Produto(65, 'Marguerita',
  'Massa crocante, molho de tomate artesanal, fatias de tomate fresco, queijo muçarela derretido e folhas de manjericão. Um clássico leve e refrescante!',
  'lib/image/salgada_marguerita.jpg'));

  srv.salgada.add(Produto(60, 'Muçarela',
  'Massa crocante, molho de tomate fresco e uma generosa camada de queijo muçarela derretido. Simples, deliciosa e cheia de sabor!',
  'lib/image/salgada_mussarela.jpg'));

  srv.salgada.add(Produto(60, 'Tomate Cereja',
  'Massa crocante, molho de tomate caseiro, queijo muçarela e suculentas fatias de tomate cereja, trazendo frescor e leveza a cada mordida.',
  'lib/image/salgada_tomate_cereja.jpg'));

  srv.salgada.add(Produto(65, 'Doritos',
  'Massa crocante, molho de tomate, queijo muçarela derretido e uma camada crocante de Doritos, trazendo um toque divertido e crocante para sua pizza!',
  'lib/image/salgada_doritos.jpg'));

  srv.salgada.add(Produto(95, 'Filé Mignon',
  'Massa crocante, molho de tomate artesanal, pedaços suculentos de filé mignon e uma generosa camada de queijo derretido. Sabor sofisticado e delicioso!',
  'lib/image/salgada_file_mignon.jpg'));

  srv.salgada.add(Produto(85, 'Camarão',
  'Massa crocante, molho de tomate suave, camarões temperados e queijo derretido, formando uma combinação de sabores marcantes e irresistíveis!',
  'lib/image/salgada_camarao.jpg'));

  srv.salgada.add(Produto(80, 'Carne Seca',
  'Massa crocante, molho de tomate caseiro, carne seca desfiada e queijo derretido. Uma combinação tradicional e saborosa com um toque regional!',
  'lib/image/salgada_carne_seca.jpg'));

  srv.salgada.add(Produto(65, 'Milho',
  'Massa crocante, molho de tomate, queijo derretido e grãos de milho doces e suculentos, criando uma pizza leve e com sabor especial.',
  'lib/image/salgada_milho.jpg'));

  srv.salgada.add(Produto(70, 'Portuguesa',
  'Massa crocante, molho de tomate, queijo muçarela, presunto, ovos cozidos, cebola e azeitonas. Uma mistura clássica e completa de sabores!',
  'lib/image/salgada_portuguesa.jpg'));


  // PIZZAS DOCES
  srv.doce.add(Produto(60, 'Banana com doce de leite',
  'Massa crocante, fatias de banana maduras e uma generosa camada de doce de leite cremoso. Uma sobremesa irresistível e doce na medida certa!',
  'lib/image/doce_banana_doce_leitte.jpg',));

  srv.doce.add(Produto(55, 'Chocolate', 
  'Massa crocante, coberta com uma camada espessa de chocolate ao leite derretido. Uma explosão de sabor para os amantes de chocolate!',
  'lib/image/doce_chocolate.jpg'));

  srv.doce.add(Produto(60, 'Chocolate com morango',
  'Massa crocante, chocolate ao leite derretido e pedaços frescos de morango. Uma combinação clássica e deliciosa de doce e azedinho!',
  'lib/image/doce_chocolate_morango.jpg',));

  srv.doce.add(Produto(60, 'Churros',
  'Massa crocante, coberta com doce de leite e finalizada com açúcar e canela. Um sabor autêntico de churros em cada fatia!',
  'lib/image/doce_churros.jpg',));

  srv.doce.add(Produto(65, 'Floresta negra',
  'Massa crocante, recheada com chocolate, chantilly e cerejas. Inspirada na clássica sobremesa, essa pizza é uma combinação perfeita de sabores ricos!',
  'lib/image/doce_floresta_negra.jpg',));

  srv.doce.add(Produto(70, 'KitKat',
  'Massa crocante, uma camada generosa de chocolate ao leite derretido e pedaços crocantes de KitKat por cima. A crocância e o sabor do chocolate em cada mordida!',
  'lib/image/doce_kitkat.jpg',));

  srv.doce.add(Produto(75, 'Ninho com uvas',
  'Massa crocante, cobertura de leite em pó e uvas frescas e suculentas. Uma combinação suave e irresistível de sabores doces e frutados!',
  'lib/image/doce_ninho_uva.jpg',));

  srv.doce.add(Produto(65, 'Prestígio',
  'Massa crocante, recheada com chocolate ao leite derretido e coco ralado. A famosa combinação de chocolate e coco em formato de pizza!',
  'lib/image/doce_prestigio.jpg',));

  srv.doce.add(Produto(60, 'Romeu e Julieta',
  'Massa crocante, com uma camada de queijo cremoso e generosas porções de goiabada derretida. O contraste perfeito entre o doce e o salgado!',
  'lib/image/doce_romeu_julieta.jpg',));

  //BEBIDAS
  srv.bebida.add(Produto(9.50, 'Coca-Cola',
  'Lata de Coca-Cola gelada, 350ml, perfeita para refrescar e acompanhar qualquer refeição!',
  'lib/image/bebida_coca.jpg'));

  srv.bebida.add(Produto(7.50, 'Água',
  'Água mineral pura e refrescante, em garrafa de vidro de 500ml. Ideal para hidratação com elegância.',
  'lib/image/bebida_agua.jpg'));

  srv.bebida.add(Produto(18, 'Caipirinha',
  'Caipirinha clássica, feita com limão fresco, açúcar e cachaça de qualidade. A bebida perfeita para quem ama sabores brasileiros!',
  'lib/image/bebida_caipirinha.jpg'));

  srv.bebida.add(Produto(160, 'Espumante',
  'Garrafa de 750ml de Chandon Brut Rosé, espumante sofisticado com sabor delicado e refrescante. Ideal para celebrações!',
  'lib/image/bebida_espumante.jpg'));

  srv.bebida.add(Produto(9.50, 'Guaraná',
  'Lata de Guaraná Antarctica, 350ml. Sabor brasileiro autêntico, refrescante e levemente doce.',
  'lib/image/bebida_guarana.jpg'));

  srv.bebida.add(Produto(13, 'Suco de laranja',
  'Suco de laranja natural e fresco, em garrafa de 500ml. Sabor cítrico e nutritivo para acompanhar sua refeição!',
  'lib/image/bebida_suco_laranja.jpg'));

  srv.bebida.add(Produto(13, 'Suco de limão',
  'Suco de limão puro e refrescante, em garrafa de 500ml. Perfeito para quem busca uma bebida cítrica e revigorante.',
  'lib/image/bebida_suco_limao.jpg'));

  srv.bebida.add(Produto(15, 'Suco de morango',
  'Suco de morango fresco, em garrafa de 500ml. Doce e natural, ideal para uma pausa saborosa!',
  'lib/image/bebida_suco_morango.jpg'));

  srv.bebida.add(Produto(120, 'Vinho branco seco',
  'Garrafa de 750ml de vinho branco seco Casillero del Diablo. Refinado e ideal para momentos especiais.',
  'lib/image/bebida_vinho_seco.jpg'));

  srv.bebida.add(Produto(100, 'Vinho tinto suave',
  'Garrafa de 750ml de vinho tinto suave Casillero del Diablo. Equilibrado e perfeito para quem aprecia um sabor mais adocicado.',
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
