// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {

  var carrinho = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text(
          "Carrinho",
          style: TextStyle(color: Colors.white),
        )
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: carrinho.length,
          itemBuilder: (context, index){

            return Card(

              child: ListTile(

                leading: Image.asset(carrinho[index].fotoProd),

                title: Text(
                  carrinho[index].nomeProd,
                  style: TextStyle(
                  fontSize: 20,
                  ),
                ),

                subtitle: Text(
                  '${carrinho[index].precoProd.toStringAsFixed(2)}',
                    style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                ),

                trailing: Icon(
                  Icons.arrow_right,
                ),

              ),

            );

          }

        )

      ) 

    );
  }
}