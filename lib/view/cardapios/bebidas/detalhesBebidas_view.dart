// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app08/model/produto.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

final ProdutoService srv = GetIt.instance<ProdutoService>(); //Para que possamos usar o getIt dentro da tela

class DetalhesbebidasView extends StatefulWidget {
  const DetalhesbebidasView({super.key});

  @override
  State<DetalhesbebidasView> createState() => _DetalhesbebidasViewState();
}

class _DetalhesbebidasViewState extends State<DetalhesbebidasView> {
  @override
  Widget build(BuildContext context) {

    final Produto dadosBebidas = ModalRoute.of(context)!.settings.arguments as Produto; //Dado Recebido de "bebidas_view"

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
        //Fim Seta

        //Texto
        title: Text(
          'Detalhes',
          style: TextStyle(color: Colors.white),
          ),
        //Fim Texto

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

        child: ListView( //Inicio ListView

          children: [

            //Exibir Foto
            Image.asset(dadosBebidas.fotoProd),

            //Exibe Nome Produto no detalhe
            ListTile(
              title: Text(
                dadosBebidas.nomeProd,
                style: TextStyle(fontSize: 30),
              ),
            ),
            //Fim exibe Nome Produto no detalhe


            SizedBox(height: 10), // Espaçamento

            //Exibe Descrição do produto no detalhe
            ListTile(
              subtitle: Text(
                //dados.descricaoProd,
                dadosBebidas.descricaoProd,
                style: TextStyle(fontSize: 20),
              ),
            ),
            //Fim exibe Descrição do produto no detalhe


            SizedBox(height: 10), //Espaçamento

            //Exibe Preço do produto no detalhe
            ListTile(
              title: Text(
                'Preço:  R¢'
                '${dadosBebidas.precoProd.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
                
              ),
            ),
            //Fim exibe Preço do produto no detalhe


            SizedBox(height: 30), //Espaçamento

            //Icone Carrinho
            Row( //Foi colocado em uma row para que possamos editar o espaçamento horizontal
              mainAxisAlignment: MainAxisAlignment.end, //Espaçamento
              children: [
                SizedBox(width: 280),
                ElevatedButton( //Botão
                   style: ElevatedButton.styleFrom(
                      minimumSize: Size(10, 50),
                      backgroundColor: Colors.purple.shade900,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    
                  onPressed:(){ //Ação botão quando pressionado
                    
                    //Adiciona item ao carrinho e Valor total recebe o valor do produto
                    srv.carrinho.add(Produto(dadosBebidas.precoProd, dadosBebidas.nomeProd, dadosBebidas.descricaoProd, dadosBebidas.fotoProd));
                    srv.valorTotal += dadosBebidas.precoProd;

                 }, child: Text('+'),

                )

              ], //Children

            ),
            //Fim Icone do carrinho

          ], //Children

        )
      
      ),

    );

  } //Build

} //Class