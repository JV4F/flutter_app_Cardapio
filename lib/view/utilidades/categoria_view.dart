// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

final ProdutoService srv = GetIt.instance<ProdutoService>(); //Para que possamos usar o getIt dentro da tela

class CategoriaView extends StatefulWidget {
  const CategoriaView({super.key});

  @override
  State<CategoriaView> createState() => _CategoriaViewState();
}

class _CategoriaViewState extends State<CategoriaView> {
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
            Navigator.popAndPushNamed(context, 'login');
          }, 
        ),
        //Fim seta

        title: Row( //Row para poder ajustar o icone do carrinho no appbar
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              "Categorias",
              style: TextStyle(color: Colors.white),
              ),

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
      //Fim barra Superior

      body:Container(

        padding: EdgeInsets.all(20), //Margem

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
          //Fim Imagem/Textura de fundo do app

      
        child: Form(

          child: Column(

            children: [
              
              //Inicio icone principal
              Image.asset('lib/image/logoapp.png'),
              //Fim icone principal

              //Botão Pizza Salgada
              ElevatedButton(
                style:ElevatedButton.styleFrom( 
                  minimumSize: Size(350, 70),
                  backgroundColor: Colors.white, 
                  foregroundColor: Colors.red,
                  textStyle: TextStyle(fontSize: 25),
                ),

                onPressed: (){
                  
                  Navigator.pushNamed(context, 'cardapiosal');
                  
                }, child: Text("Pizzas Salgada"),
              ),
              //Fim Botão Salgada

              SizedBox(height: 50),

              //Botão Pizza Doce
              ElevatedButton(
                style:ElevatedButton.styleFrom( 
                  minimumSize: Size(350, 70),
                  backgroundColor: Colors.white, 
                  foregroundColor: Colors.red,
                  textStyle: TextStyle(fontSize: 25),
                ),

                onPressed: (){
                  
                  Navigator.pushNamed(context, 'cardapiodoce');
                  
                }, child: Text("Pizzas Doce"),
              ),
              //Botão Pizza Doce


              SizedBox(height: 50),

              //Botão Bebidas
              ElevatedButton(
                style:ElevatedButton.styleFrom( 
                  minimumSize: Size(350, 70),
                  backgroundColor: Colors.white, 
                  foregroundColor: Colors.red,
                  textStyle: TextStyle(fontSize: 25),
                ),

                onPressed: (){
                  
                  Navigator.pushNamed(context, 'bebidas');
                  
                }, child: Text("Bebidas"),
              ),
              //Botão Bebidas

            ], //Children

          ),

        ),

      ),

    );

  } //Build

} //Class
