// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
 
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();

    var email = TextEditingController(); 
    var senha = TextEditingController(); 
    bool stats = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //Barra De Cima
        appBar: AppBar(
            backgroundColor: Colors.purple.shade900,
            title: Row(
              children: [

                Text(
                  'Home Page',
                 style: TextStyle(color: Colors.white),
                ),

                SizedBox(width: 180), // Espaçamento entre o Text e o Icon

                //Icone do AppBar
                 Icon(
                  Icons.restaurant_outlined, 
                  color: Colors.white,
                  size: 30,
                ),
                //Fim Icon AppBar

              ],
            ),
          ),
          //Fim barra cima

        body: Padding(

          padding: const EdgeInsets.fromLTRB(30, 40, 30, 40), //Margem 

          child: Form(

            key: formkey,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center, //Alinhar os elementos para o centro

              children: [
                
                //Inicio Icone Principal
                Icon(Icons.account_circle_rounded, size: 200),
                SizedBox(height: 20), //Espaçamento
                Row(), // Não sei explicar, mas é isso que mantem os widgets centralizados horizontalmente
                SizedBox(height: 30), //Espaçamento

                Column(

                  children: [

                    //Botão Login
                    ElevatedButton(
                      style:ElevatedButton.styleFrom( 
                        minimumSize: Size(500, 60),
                        backgroundColor: Colors.purple.shade900, 
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 20),
                      ),

                      onPressed: (){
                        
                      }, child: Text("Login"),
                    ),
                    //Fim Botão Login


                    SizedBox(height: 20), // Espaçamento

                    //Botão Cadastre-se
                    ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        minimumSize: Size(500, 60), 
                        backgroundColor: Colors.purple.shade900, 
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 20),
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

  }

}
   