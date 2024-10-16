// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_app08/model/produto.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

final ProdutoService srv = GetIt.instance<ProdutoService>(); //Para que possamos usar o getIt dentro da tela

class DetalhessalView extends StatefulWidget {
  const DetalhessalView({super.key});

  @override
  State<DetalhessalView> createState() => _DetalhessalViewState();
}

class _DetalhessalViewState extends State<DetalhessalView> {
  @override
  Widget build(BuildContext context) {

    final Produto dadosSal = ModalRoute.of(context)!.settings.arguments as Produto; //Dado Recebido de "cardapioSal_view"

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
            Image.asset(dadosSal.fotoProd),

            //Exibe Nome Produto no detalhe
            ListTile(
              title: Text(
                dadosSal.nomeProd,
                style: TextStyle(fontSize: 30),
              ),
            ),

            SizedBox(height: 10), // Espaçamento

            //Exibe Descrição do produto no detalhe
            ListTile(
              subtitle: Text(
                dadosSal.descricaoProd,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 10), //Espaçamento

            //Exibe Preço do produto no detalhe
            ListTile(
              title: Text(
                'Preço:  R\$'
                '${dadosSal.precoProd.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                
              ),
            ),

            SizedBox(height: 30), //Espaçamento


            //Icone do carrinho
            //Foi colocado em uma row para que possamos editar o espaçamento horizontal
            Row(
              mainAxisAlignment: MainAxisAlignment.end, //Espaçamento
              children: [
                SizedBox(width: 280),
                ElevatedButton(
                   style: ElevatedButton.styleFrom(
                      minimumSize: Size(10, 50),
                      backgroundColor: Colors.red.shade900,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    
                  onPressed:(){ //Ação botão quando pressionado
                    
                    //Adiciona item ao carrinho e Valor total recebe o valor do produto
                    srv.carrinho.add(Produto(dadosSal.precoProd, dadosSal.nomeProd, dadosSal.descricaoProd, dadosSal.fotoProd));
                    srv.valorTotal += dadosSal.precoProd;

                    ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Produto adicionado com sucesso!!', style: TextStyle(fontSize: 15)),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              )
                            );

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