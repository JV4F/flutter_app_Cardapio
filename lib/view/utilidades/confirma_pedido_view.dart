// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../service/produto_service.dart';

final ProdutoService srv = GetIt.instance<ProdutoService>(); //Para que possamos usar o getIt dentro da tela


class ConfirmaPedidoView extends StatefulWidget {
  const ConfirmaPedidoView({super.key});

  @override
  State<ConfirmaPedidoView> createState() => _ConfirmaPedidoViewState();
}

class _ConfirmaPedidoViewState extends State<ConfirmaPedidoView> {

    //Atributos
    bool isChecked = false;
    bool isChecked2 = false;
    bool isChecked3 = false;
    bool isChecked4 = false;

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
            Navigator.pop(context, 'carrinho');
          }, 
        ),
        //Fim Seta para voltar

        title: Row( //Row para poder ajustar o icone do carrinho no appbar
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //Espaçamento
          children: [
            
            //Texto
            Text(
              'Confirmar Pedido',
              style: TextStyle(color: Colors.white),
            ),
            //Fim Texto

            //Icone Barra Superior
            Image.asset('lib/image/logoapp.png', height: 80),
            //Fim Icone Barra Superior
            
          ],
        ),
      ),

      body: Container(

        //Imagem/Textura de fundo do app
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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

        child: Column(
          children: [
            Expanded(
              child: Container(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      children: [
                  
                        SizedBox(height: 50),
                    
                        //Botão Valor Total
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .9,
                              height: MediaQuery.of(context).size.height * .08,
                              child: ElevatedButton(
                                style:ElevatedButton.styleFrom( 
                                  backgroundColor: Colors.red, 
                                  foregroundColor: Colors.red,
                                  textStyle: TextStyle(fontSize: 25),
                                ),
                                onPressed: (){}, 
                                child: Text(
                                  ('Valor Total: ' + '${srv.valorTotal.toStringAsFixed(2)}'),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Botão Valor Total
                    
                    
                        SizedBox(height: 20),
                    
                    
                        //Seleção de pagamento
                        //Crédito
                        Container(
                          width: constraints.maxWidth,
                          height: MediaQuery.of(context).size.height * .08,
                          child: CheckboxListTile(
                            title: Text(
                              'Crédito',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                            secondary: Icon(Icons.calendar_view_day_outlined, color: Colors.white, size: 30),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = !isChecked;
                                isChecked2 = false;
                                isChecked3 = false;
                                isChecked4 = false;
                              });
                                
                            },
                          
                            activeColor: Colors.red,
                            checkColor: Colors.black,
                          ),
                        ),
                        //Fim Crédito


                        //Débito
                        Container(
                          width: constraints.maxWidth,
                          height: MediaQuery.of(context).size.height * .08,
                          child: CheckboxListTile(
                            title: Text(
                              'Débito',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                            secondary: Icon(Icons.calendar_view_day_outlined, color: Colors.white, size: 30),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: isChecked2,
                            onChanged: (value) {
                              setState(() {
                                isChecked2 = !isChecked2;
                                isChecked = false;
                                isChecked3 = false;
                                isChecked4 = false;
                              });
                            },
                            activeColor: Colors.red,
                            checkColor: Colors.black,
                          ),
                        ),
                        //Fim Débito
                    
                        //Dinheiro
                        Container(
                          width: constraints.maxWidth,
                          height: MediaQuery.of(context).size.height * .08,
                          child: CheckboxListTile(
                            title: Text(
                              'Dinheiro',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                            secondary: Icon(Icons.attach_money, color: Colors.white, size: 30 ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: isChecked3,
                            onChanged: (value) {
                              setState(() {
                                isChecked3 = !isChecked3;
                                isChecked = false;
                                isChecked2 = false;
                                isChecked4 = false;
                              });
                            },
                            activeColor: Colors.red,
                            checkColor: Colors.black,
                          ),
                        ),
                        //Fim Dinheiro
                    
                    
                            //Pix
                        Container(
                          width: constraints.maxWidth,
                          height: MediaQuery.of(context).size.height * .08,
                          child: CheckboxListTile(
                            title: Text(
                              'Pix',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                            secondary: Icon(Icons.mobile_screen_share, color: Colors.white, size: 30),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: isChecked4,
                            onChanged: (value) {
                              setState(() {
                                isChecked4 = !isChecked4;
                                isChecked = false;
                                isChecked2 = false;
                                isChecked3 = false;
                                              
                              });
                            },
                            activeColor: Colors.red,
                            checkColor: Colors.black,
                            
                          ),
                        ),
                        //Fim Pix
                        //Fim Seleção de pagamento
                    
                    
                        SizedBox(height: 20),
                    
                        //Botão Confirmar pedido
                        ElevatedButton(
                          style:ElevatedButton.styleFrom( 
                            minimumSize: Size(350, 60),
                            backgroundColor: Colors.red, 
                            foregroundColor: Colors.red,
                            textStyle: TextStyle(fontSize: 25),
                          ),
                          onPressed: (){
                            if(isChecked == true || isChecked2 == true || isChecked3 == true || isChecked4 == true){
                              Navigator.popAndPushNamed(context, 'categoria');
                              srv.carrinho.length = 0;
                              srv.valorTotal = 0;
                    
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Pedido Concluido!!', style: TextStyle(fontSize: 15)),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.green.shade500,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                )
                              );
                            }
                            if(isChecked == false && isChecked2 == false && isChecked3 == false && isChecked4 == false){
                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Escolha um meio de pegamento!!', style: TextStyle(fontSize: 15)),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                )
                              );
                            }
                    
                          }, 
                          child: Text(
                            'Confirmar Pedido',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        //Fim Botão Confirmar pedido
                            
                      ], //Children
                
                    );
                  },
                 
                ),
              ),
            ),
          ],
        ),

      ),

    );

  } //Builder

} //Class