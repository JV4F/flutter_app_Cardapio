// ignore_for_file: prefer_const_constructors

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
  /*void initState(){
   cardapio = Produto.gerardados();
    super.initState(); 
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text(
          "Cardapio",
          style: TextStyle(color: Colors.white),
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
                  
                  //Retorna o item da lista selecionado
                  //Produto dados = cardapio[index];

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