// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

final ProdutoService srv = GetIt.instance<ProdutoService>(); //Para que possamos usar o getIt dentro da tela

class BebidasView extends StatefulWidget {
  const BebidasView({super.key});

  @override
  State<BebidasView> createState() => _BebidasViewState();
}

class _BebidasViewState extends State<BebidasView> {
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
              "Bebidas",
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
            itemCount: srv.bebida.length,
            itemBuilder: (context, index){

            return Card( //Para que os itens do cardapio fique em um "Cartão"

              child: ListTile( //Inicio ListTile

                //Exibe image do produto no cardapio
                leading: Image.asset(srv.bebida[index].fotoProd),

                //Exibe nome do produto no cardapio
                title: Text(
                  srv.bebida[index].nomeProd,
                  style: TextStyle(
                  fontSize: 20,
                  ),
                ),

                //Exibe preço do produto no cardapio
                subtitle: Text(
                  '${srv.bebida[index].precoProd.toStringAsFixed(2)}',
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
                    context, 'detalhesbebidas',
                    arguments: srv.bebida[index], //Passando o index do produto para a proxima tela "detalhesbebidas"
                  );
                },
                //Fim ação para o click no Produto

              ),
              //Fim ListTile

            );

          }, //Child

        ),

      ),

    );

  } //Build

} //Class