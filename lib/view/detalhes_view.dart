// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, empty_statements
import 'package:flutter/material.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

//Atualizando o serviço CardapioService
final ProdutoService srv = GetIt.instance<ProdutoService>();


class DetalhesView extends StatefulWidget {
  const DetalhesView({super.key});

  @override
  State<DetalhesView> createState() => _DetalhesViewState();
}

class _DetalhesViewState extends State<DetalhesView> {
  

  @override
  Widget build(BuildContext context) {

    final idProduto = ModalRoute.of(context)!.settings.arguments;
    var produto = srv.retornarProduto(idProduto);
    
    return Scaffold(

      //Barra Superior
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        
        //Seta para voltar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed:(){
            Navigator.pop(context);
          }, 
        ),
        //Fim Seta

        title: Text(
          'Detalhes',
          style: TextStyle(color: Colors.white),
          ),
      ),
      //Fim Barra Superior

      body: Padding(
        
        padding: EdgeInsets.all(20),

        child: ListView(

          children: [

            //Exibir Foto
            Image.asset('lib/image/pizzacalabresa.jpg'),

            //Exibe Nome Produto no detalhe
            ListTile(
              title: Text(
                produto.nomeProd,
                style: TextStyle(fontSize: 30),
              ),
            ),

            SizedBox(height: 10), // Espaçamento

            //Exibe Descrição do produto no detalhe
            ListTile(
              subtitle: Text(
                //dados.descricaoProd,
                produto.descricaoProd,
                style: TextStyle(fontSize: 20),
              ),
            ),

            SizedBox(height: 10), //Espaçamento

            //Exibe Preço do produto no detalhe
            ListTile(
              title: Text(
                'Preço:  R¢'
                //'${dados.precoProd.toStringAsFixed(2)}',
                '${produto.precoProd.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
                
              ),
            ),

            SizedBox(height: 30), //Espaçamento


            //Icone do carrinho
            //Foi colocado em uma row para que possamos editar o espaçamento horizontal
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 280),
                ElevatedButton(
                   style: ElevatedButton.styleFrom(
                      minimumSize: Size(10, 50),
                      backgroundColor: Colors.purple.shade900,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    
                  onPressed:(){
                    
                    Navigator.pushNamed(context, 'carrinho');

                 }, child: Text('+'),
                )
              ],
            ),
            //Fim Icone do carrinho

          ],
        )
      
      ),

    );
  }
}