// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {


  //Atributos
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  var email = TextEditingController(); 
  var senha = TextEditingController(); 
  bool stats = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Backgraund para clarear a imagem/Textura utilizada 
      backgroundColor: Colors.green.shade700,

        //Barra De Cima
        appBar: AppBar( 
            backgroundColor: Colors.red.shade900, //Cor barra superior

            title: Row( //Linha para poder espaçar o Texto do Icone
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //Espaçamento
              children: [

                //Texto
                Text(
                  'Italian Pizza',
                 style: TextStyle(color: Colors.white),
                ),
                //Fim Texto

                //Icone do AppBar
                 Image.asset('lib/image/logoapp.png', height: 80),
                //Fim Icon AppBar

              ],
            ),
          ),
          //Fim barra cima

        body: Container(

          //Imagem/Textura de fundo do app
          padding: EdgeInsets.all(20),
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
        //Fim imagem/Textura de fundo do app

          child: Form(

            key: formkey,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center, //Alinhar os elementos para o centro

              children: [

                //Inicio Icone Principal
                Column(
                  children: [
                    Image.asset('lib/image/logoapp.png',height: 500,),
                  ],
                ),
                //Fim Icone Principal


                Column(

                  children: [

                    //Botão Login
                    ElevatedButton(
                      style:ElevatedButton.styleFrom( 
                        minimumSize: Size(350, 60),
                        backgroundColor: Colors.white, 
                        foregroundColor: Colors.red,
                        textStyle: TextStyle(fontSize: 25),
                      ),

                      onPressed: (){
                        
                        Navigator.pushNamed(context, 'login');
                        
                      }, child: Text("Login"),
                    ),
                    //Fim Botão Login


                    SizedBox(height: 20), // Espaçamento

                    //Botão Cadastre-se
                    ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        minimumSize: Size(350, 60), 
                        backgroundColor: Colors.white, 
                        foregroundColor: Colors.red,
                        textStyle: TextStyle(fontSize: 25),
                      ),

                      onPressed: () {
                        
                        Navigator.pushNamed(context, 'cadastro');
                  
                      }, child: Text("Cadastrar-se"),
                    )
                    //Fim Botão Cadastre-se

                  ], //Children

                ),

              ] //Children

            )
            
          )
            
        ),

    );

  } //Build

} //Class
   