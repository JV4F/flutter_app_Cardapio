// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/produto_controller.dart';
import '../../service/produto_service.dart';

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
        width: MediaQuery.of(context).size.width,
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: StreamBuilder<QuerySnapshot>(
              stream: ProdutoController().listarBebidas(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(
                      child: Text('Não foi possível conectar.'),
                    );
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    final dados = snapshot.requireData;
                    if (dados.size > 0) {
                      return ListView.builder(
                        itemCount: dados.size,
                        itemBuilder: (context, index) {
                          dynamic item = dados.docs[index].data();
                          return Card(
                            child: ListTile(
                              leading: Image.asset(item['imagem']),
                              title: Text(item['nome']),
                              subtitle: Text('${item['preco'].toStringAsFixed(2)}'),
                              //Icone seta no produto
                              trailing: Icon(
                                Icons.arrow_right,
                              ),
        
                              hoverColor: Colors.purple.shade100, //Cor quando é colocado o item é clickado
        
                              onTap: () {
                                //Navigator
                                Navigator.pushNamed(context, 'detalhesbebidas', arguments: item);
                              },
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text('Nenhum produto encontrado.'),
                      );
                    }
                }
              },
            ),
          ),
        ),
      ),

    );

  } //Build

} //Class