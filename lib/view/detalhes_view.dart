// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_app08/model/produto.dart';

class DetalhesView extends StatefulWidget {
  const DetalhesView({super.key});

  @override
  State<DetalhesView> createState() => _DetalhesViewState();
}

class _DetalhesViewState extends State<DetalhesView> {
  @override
  Widget build(BuildContext context) {

    final Produto dados = ModalRoute.of(context)!.settings.arguments as Produto;
    
    return Scaffold(

      //Barra Superior
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
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
                dados.nomeProd,
                style: TextStyle(fontSize: 30),
              ),
            ),

            SizedBox(height: 10), // Espaçamento

            //Exibe Descrição do produto no detalhe
            ListTile(
              subtitle: Text(
                dados.descricaoProd,
                style: TextStyle(fontSize: 20),
              ),
            ),

            SizedBox(height: 10), //Espaçamento

            //Exibe Preço do produto no detalhe
            ListTile(
              title: Text(
                'Preço:  R¢'
                '${dados.precoProd.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
                
              ),
            ),

            SizedBox(height: 30), //Espaçamento


            //Icone do carrinho
            //Foi colocado em uma row para que possamos editar o espaçamento horizontal
            Row(
              children: [
                SizedBox(width: 280),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  iconSize: 40,
                  onPressed:(){
                    
                    //Icone sem função no momento, carrinho em desenvolvimento

                  }
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