// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_app08/model/produto.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

final ProdutoService srv = GetIt.instance<ProdutoService>();

class DetalhessalView extends StatefulWidget {
  const DetalhessalView({super.key});

  @override
  State<DetalhessalView> createState() => _DetalhessalViewState();
}

class _DetalhessalViewState extends State<DetalhessalView> {
  @override
  Widget build(BuildContext context) {

    final Produto dadosSal = ModalRoute.of(context)!.settings.arguments as Produto;

    return Scaffold(
      backgroundColor: Colors.green.shade700,

      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        
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

        child: ListView(

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
                //dados.descricaoProd,
                dadosSal.descricaoProd,
                style: TextStyle(fontSize: 20),
              ),
            ),

            SizedBox(height: 10), //Espaçamento

            //Exibe Preço do produto no detalhe
            ListTile(
              title: Text(
                'Preço:  R¢'
                //'${dados.precoProd.toStringAsFixed(2)}',
                '${dadosSal.precoProd.toStringAsFixed(2)}',
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
                      backgroundColor: Colors.red.shade900,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    
                  onPressed:(){
                    
                    //Navigator.pushNamed(context, 'carrinho');
                    srv.carrinho.add(Produto(dadosSal.precoProd, dadosSal.nomeProd, dadosSal.descricaoProd, dadosSal.fotoProd));
                    srv.valorTotal += dadosSal.precoProd;

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