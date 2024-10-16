// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

final ProdutoService srv = GetIt.instance<ProdutoService>(); //Para que possamos usar o getIt dentro da tela

class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {

  //Atributos
  var formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();

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
            Navigator.pop(context);
          }, 
        ),
        //Fim seta

        title: Row( //Linha para poder espaçar o Texto do Icone
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //Espaçamento
          children: [

            //Texto
            Text(
              "Carrinho",
              style: TextStyle(color: Colors.white),
              ),
            //Fim Texto

              //Icone Check
              IconButton(
                icon: const Icon(Icons.check),
                iconSize: 35,
                color: Colors.white,
                onPressed:(){
                  Navigator.pushNamed(
                    context, 'confirma'
                  );
                }
              )
              //Fim Icone Check 
          ],
        ),
      ),
      //Barra Superior

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

        //Criação do Listview
        child: ListView.builder(
          itemCount: srv.carrinho.length,
          itemBuilder: (context, index){

            return Column(

              children: [

                Card(
                        
                  child: ListTile( //Inicio ListTile
                  
                    //Exibe image do produto no cardapio
                    leading: Image.asset(srv.carrinho[index].fotoProd),
                  
                    //Exibe nome do produto no cardapio
                    title: Text(
                      srv.carrinho[index].nomeProd,
                      style: TextStyle(
                      fontSize: 20,
                      ),
                    ),
                  
                    //Exibe preço do produto no cardapio
                    subtitle: Text(
                      '${srv.carrinho[index].precoProd.toStringAsFixed(2)}',
                        style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  
                    //Icone seta no produto
                    trailing: IconButton(
                      icon: Icon(Icons.delete_forever),
                      onPressed: (){

                        setState(() {
                           if(srv.carrinho.isEmpty){
                            srv.valorTotal = 0;
                        }

                        if(srv.carrinho.isNotEmpty){
                          srv.valorTotal = srv.valorTotal - srv.carrinho[index].precoProd;
                        }

                          srv.carrinho.removeAt(index);
                        });
                        
                      },
                    ),
                    //Fim Icone seta no produto

                
                  ),
                  
                ),

              ], //Children

            );
              
          },

        ),
          
      ),

    );

  } //Builder

} //Class