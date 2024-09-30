// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app08/model/produto.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

//Utilizar o serviço CardapioService
final ProdutoService srv = GetIt.instance<ProdutoService>();

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {

  //Atributo
  List<Produto> cardapio = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,

        //Seta para voltar 
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed:(){
            Navigator.pop(context, 'login');
          }, 
        ),
        //Fim seta

        title: Row( //Row para poder ajustar o icone do carrinho no appbar
          children: [

            Text(
              "Cardapio",
              style: TextStyle(color: Colors.white),
              ),

              SizedBox(width: 165), //Espaçamento

              //Icone do carrinho no appbar
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                iconSize: 30,
                color: Colors.white,
                onPressed:(){
                  Navigator.pushNamed(context, 'carrinho');
                }
              )
              //fim Icone carrinho
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: srv.produtos.length,
          itemBuilder: (context, index){

            return Card(

              child: ListTile(

                //Exibe image do produto no cardapio
                leading: Image.asset(srv.produtos[index].fotoProd),

                //Exibe nome do produto no cardapio
                title: Text(
                  srv.produtos[index].nomeProd,
                  style: TextStyle(
                  fontSize: 20,
                  ),
                ),

                //Exibe preço do produto no cardapio
                subtitle: Text(
                  '${srv.produtos[index].precoProd.toStringAsFixed(2)}',
                    style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                ),

                //Icone seta no produto
                trailing: Icon(
                  Icons.arrow_right,
                ),

                hoverColor: Colors.purple.shade100,
                onTap: () {
                  
                  //Navegar para Detalhes
                  Navigator.pushNamed(
                    context, 'detalhes',
                    arguments: index,
                  );

                },//OnTap

              ),

            );
          },
        ),
      ),
    );

    
  }

}