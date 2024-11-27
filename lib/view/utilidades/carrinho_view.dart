// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../controller/carrinho_controller.dart';
import '../../service/produto_service.dart';

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
              stream: CarrinhoController().listarCarrinho(),
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
                          dynamic id = dados.docs[index].id;
                          dynamic item = dados.docs[index].data();
                          return Card(
                            child: ListTile(
                              leading: Image.asset(item['imagem']),
                              title: Text(item['nome']),
                              subtitle: Text('${item['preco'].toStringAsFixed(2)}'),

                              //Icone delete no produto
                              trailing: IconButton(
                                icon: Icon(Icons.delete_forever),
                                onPressed: (){
                                  srv.valorTotal -= item['preco'];
                                  CarrinhoController().excluir (context, id);
                                  if(srv.valorTotal < 0){
                                    srv.valorTotal = 0;
                                  }
                                },
                              ),
                              //Fim Icone delete no produto

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

  } //Builder

} //Class