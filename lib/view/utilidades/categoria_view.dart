// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

final ProdutoService srv = GetIt.instance<ProdutoService>();

class CategoriaView extends StatefulWidget {
  const CategoriaView({super.key});

  @override
  State<CategoriaView> createState() => _CategoriaViewState();
}

class _CategoriaViewState extends State<CategoriaView> {
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

      

      body:Container(
        padding: EdgeInsets.all(20),
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
      
        child: Form(
          child: Column(
            children: [

              Image.asset('lib/image/logoapp.png'),
              //SizedBox(height: 150),
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

                    SizedBox(height: 50),

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

                    SizedBox(height: 50),
                  
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
            ],
          ),
        ),
      ),
    );
  }
}