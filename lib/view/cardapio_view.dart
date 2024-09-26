// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app08/model/produto.dart';

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {

  //Atributo
  List<Produto> cardapio = [];

   @override
  void initState(){
   cardapio = Produto.gerardados();
    super.initState(); 
  }

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
          itemCount: cardapio.length,
          itemBuilder: (context, index){

            return Card(

              child: ListTile(

                //Exibe image do produto no cardapio
                leading: Image.asset(cardapio[index].fotoProd),

                //Exibe nome do produto no cardapio
                title: Text(
                  cardapio[index].nomeProd,
                  style: TextStyle(
                  fontSize: 20,
                  ),
                ),

                //Exibe preço do produto no cardapio
                subtitle: Text(
                  '${cardapio[index].precoProd.toStringAsFixed(2)}',
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
                  Produto dados = cardapio[index];

                  //Navegar para Detalhes
                  Navigator.pushNamed(
                    context, 'detalhes',
                    arguments: dados,
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