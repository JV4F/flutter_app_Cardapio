// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

final ProdutoService srv = GetIt.instance<ProdutoService>(); //Para que possamos usar o getIt dentro da tela


class CardapiosalView extends StatefulWidget {
  const CardapiosalView({super.key});

  @override
  State<CardapiosalView> createState() => _CardapiosalViewState();
}

class _CardapiosalViewState extends State<CardapiosalView> {
  @override
  Widget build(BuildContext context) {
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
          onPressed:(){
            Navigator.pop(context, 'categoria');
          }, 
        ),
        //Fim seta

        title:  Row( //Linha para poder espaçar o Texto do Icone
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //Espaçamento
          children: [

            //Texto
            Text(
              "Pizzas Salgadas",
              style: TextStyle(color: Colors.white),
            ),
            //Fim Texto

             //Icone Carrinho
            IconButton(
                icon: const Icon(Icons.shopping_cart),
                iconSize: 30,
                color: Colors.white,
                onPressed:(){
                  Navigator.pushNamed(context, 'carrinho');
                }
              )
              //Fim Icone Carrinho
          ],
        ),
      ),
      //Fim Barra Superior


      body: Container(

        //Imagem/Textura de fundo do app
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

        //Criação do Listview
        child: ListView.builder(
          itemCount: srv.salgada.length,
          itemBuilder: (context, index){

            return Card( //Para que os itens do cardapio fique em um "Cartão"

              child: ListTile( //Inicio ListTile

                //Exibe image do produto no cardapio
                leading: Image.asset(srv.salgada[index].fotoProd),

                //Exibe nome do produto no cardapio
                title: Text(
                  srv.salgada[index].nomeProd,
                  style: TextStyle(
                  fontSize: 20,
                  ),
                ),

                //Exibe preço do produto no cardapio
                subtitle: Text(
                  '${srv.salgada[index].precoProd.toStringAsFixed(2)}',
                    style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                ),

                //Icone seta no produto
                trailing: Icon(
                  Icons.arrow_right,
                ),

                hoverColor: Colors.purple.shade100, //Cor quando é colocado o item é clickado

                //Ação para o click no Produto
                onTap: () {
                  
                  //Navegar para Detalhes
                  Navigator.pushNamed(
                    context, 'detalhessal',
                    arguments: srv.salgada[index], //Passando o index do produto para a proxima tela "detalhesSal"
                  );

                },//OnTap

              ),

            );

          }, //Child

        ),

      ),

    );

  } //Build

} //Class