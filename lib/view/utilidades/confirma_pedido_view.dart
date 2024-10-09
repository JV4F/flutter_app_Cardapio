// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_app08/service/produto_service.dart';
import 'package:get_it/get_it.dart';

final ProdutoService srv = GetIt.instance<ProdutoService>();


class ConfirmaPedidoView extends StatefulWidget {
  const ConfirmaPedidoView({super.key});

  @override
  State<ConfirmaPedidoView> createState() => _ConfirmaPedidoViewState();
}

class _ConfirmaPedidoViewState extends State<ConfirmaPedidoView> {

    bool isChecked = false;
    bool isChecked2 = false;
    bool isChecked3 = false;
    bool isChecked4 = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green.shade700,
     appBar: AppBar(
            backgroundColor: Colors.red.shade900,

            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed:(){
                Navigator.pop(context, 'carrinho');
              }, 
            ),

            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  'Confirmar Pedido',
                 style: TextStyle(color: Colors.white),
                ),


                Image.asset('lib/image/logoapp.png', height: 80),
                
              ],
            ),
          ),

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
            child: Form(
              child: Column(
                children: [

                  SizedBox(height: 50),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style:ElevatedButton.styleFrom( 
                          minimumSize: Size(350, 60),
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

                      
                    ],
                    
                  ),

                  SizedBox(height: 100),

                  CheckboxListTile(
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
                          });
                        },
                        activeColor: Colors.red,
                        checkColor: Colors.black,
                        
                      ),

                       SizedBox(height: 50),

                  CheckboxListTile(
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
                          });
                        },
                        activeColor: Colors.red,
                        checkColor: Colors.black,
                        
                      ),

                       SizedBox(height: 50),

                  CheckboxListTile(
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
                          });
                        },
                        activeColor: Colors.red,
                        checkColor: Colors.black,
                        
                      ),

                       SizedBox(height: 50),

                      CheckboxListTile(
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
                          });
                        },
                        activeColor: Colors.red,
                        checkColor: Colors.black,
                        
                      ),

                      SizedBox(height: 80),

                      ElevatedButton(
                        style:ElevatedButton.styleFrom( 
                          minimumSize: Size(350, 60),
                          backgroundColor: Colors.red, 
                          foregroundColor: Colors.red,
                          textStyle: TextStyle(fontSize: 25),
                        ),
                        onPressed: (){
                          Navigator.popAndPushNamed(context, 'categoria');
                          srv.valorTotal = 0;
                        }, 
                        child: Text(
                          'Confirmar Pedido',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),

                ],

              ),
            ),
          ),
    );
  }
}