// ignore_for_file: prefer_const_constructors, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/carrinho_controller.dart';
import '../../model/produto.dart';
import '../../service/produto_service.dart';

final ProdutoService srv = GetIt.instance<
    ProdutoService>(); //Para que possamos usar o getIt dentro da tela

class DetalhessalView extends StatefulWidget {
  const DetalhessalView({super.key});

  @override
  State<DetalhessalView> createState() => _DetalhessalViewState();
}

class _DetalhessalViewState extends State<DetalhessalView> {
  @override
  Widget build(BuildContext context) {
    final dynamic dadosSal = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>; //Dado Recebido de "cardapioSal_view"
    return Scaffold(
      //Backgraund para clarear a imagem/Textura utilizada
      backgroundColor: Colors.green.shade700,

      //Barra Superior
      appBar: AppBar(
        backgroundColor: Colors.red.shade900, //Cor barra superior

        //Seta para voltar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //Fim Seta

        //Texto
        title: Text(
          'Detalhes',
          style: TextStyle(color: Colors.white),
        ),
        //Fim Texto
      ),
      //Fim Barra Superior

      body: Container(

          //Imagem/Textura de fundo do app
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/image/fundoapp.jpg'),
              fit: BoxFit.cover, //SERVE PARA EXPANDIR
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.3),
                BlendMode.dstATop,
              ),
            ),
          ),
          // Fim Imagem/Textura de fundo do app

          padding: EdgeInsets.all(20), //Margem

          child: ListView(
            //Inicio ListView

            children: [
              //Exibir Foto
              Image.asset(
                dadosSal['imagem'],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .5,
              ),

              //Exibe Nome Produto no detalhe
              ListTile(
                title: Text(
                  dadosSal['nome'],
                  style: TextStyle(fontSize: 26),
                ),
              ),

              ListTile(
                subtitle: Text(
                  dadosSal['descricao'],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign:
                      TextAlign.justify, // Alinha o texto de forma justificada
                ),
              ),

              //Exibe Preço do produto no detalhe
              ListTile(
                title: Text(
                  'Preço:  R\$'
                  '${dadosSal['preco'].toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //Icone do carrinho
              //Foi colocado em uma row para que possamos editar o espaçamento horizontal
              Row(
                mainAxisAlignment: MainAxisAlignment.end, //Espaçamento
                children: [
                  SizedBox(width: 250),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(10, 50),
                      backgroundColor: Colors.red.shade900,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //Ação botão quando pressionado

                      Produto p = Produto(
                        FirebaseAuth.instance.currentUser!.uid,
                        dadosSal['preco'],
                        dadosSal['nome'],
                        dadosSal['descricao'],
                        dadosSal['imagem'],
                      );

                      CarrinhoController().adicionar(context, p);
                      srv.valorTotal += p.precoProd;

                    },
                    child: Text('+'),
                  )
                ], //Children
              ),
              //Fim Icone do carrinho
            ], //Children
          )),
    );
  } //Build
} //Class
