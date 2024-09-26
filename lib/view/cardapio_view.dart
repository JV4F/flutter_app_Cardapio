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

                leading: Image.asset(cardapio[index].fotoProd),

                title: Text(
                  cardapio[index].nomeProd,
                  style: TextStyle(
                  fontSize: 20,
                  ),
                ),

                subtitle: Text(
                  '${cardapio[index].precoProd.toStringAsFixed(2)}',
                    style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                ),

                trailing: Icon(Icons.arrow_right),


              ),

              
            );
          },
        ),
      ),
    );

    
  }

}