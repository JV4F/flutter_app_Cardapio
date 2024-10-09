// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

final ProdutoService srv = GetIt.instance<ProdutoService>();


class CardapiosalView extends StatefulWidget {
  const CardapiosalView({super.key});

  @override
  State<CardapiosalView> createState() => _CardapiosalViewState();
}

class _CardapiosalViewState extends State<CardapiosalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,

        //Seta para voltar 
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed:(){
            Navigator.pop(context, 'categoria');
          }, 
        ),
        //Fim seta

        title:  Row(
          children: [
            Text(
              "Pizzas Salgadas",
              style: TextStyle(color: Colors.white),
            ),

            SizedBox(width: 95),

            IconButton(
                icon: const Icon(Icons.shopping_cart),
                iconSize: 30,
                color: Colors.white,
                onPressed:(){
                  Navigator.pushNamed(context, 'carrinho');
                }
              )
          ],
        ),

      ),


      body: Container(
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
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: srv.salgada.length,
          itemBuilder: (context, index){

            return Card(

              child: ListTile(

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

                hoverColor: Colors.purple.shade100,
                onTap: () {
                  
                  //Navegar para Detalhes
                  Navigator.pushNamed(
                    context, 'detalhessal',
                    arguments: srv.salgada[index],
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