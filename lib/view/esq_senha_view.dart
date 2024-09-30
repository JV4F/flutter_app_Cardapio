// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EsqSenhaView extends StatefulWidget {
  const EsqSenhaView({super.key});

  @override
  State<EsqSenhaView> createState() => _EsqSenhaViewState();
}

class _EsqSenhaViewState extends State<EsqSenhaView> {

  //Atributos

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();

  var email = TextEditingController();
  var confirmaEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Barra superior
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,

        //Seta para voltar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed:(){
            Navigator.pop(context);
          }
        ),
        //Fim seta

          title: Text(
            'Recuperar Senha',
            style: TextStyle(color: Colors.white),
          ),
      ),
      //Fim barra superior

       body: Padding(

        padding: const EdgeInsets.fromLTRB(30, 40, 30, 40), // Margem

        child: Form(

          key: formkey,

          child:Column(

            children: [
                
              //Inicio icone principal
              Icon(Icons.account_circle_rounded, size:120),
              Row(),
              SizedBox(height: 20), // Espaçamento
              //Fim icone principal

              Column(

                children: [

                  //Campo Email
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail),
                      labelText: 'Email: ',
                      labelStyle: TextStyle(color: Colors.purple.shade100),
                      hintText: 'Informe o Email',
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0), 
                  ),
                    ),

                    validator: (email){
                      if(email == null){
                        return 'Informe o Email';
                      }
                      else if(email.isEmpty){
                        return 'Informe o Email';
                      }
                      return null; 
                    }

                  ),
                  //Fim campo Email
                  
                  SizedBox(height: 20),

                   //Campo ConfirmaEmail
                  TextFormField(
                    controller: confirmaEmail,
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail),
                      labelText: 'Confirme o Email: ',
                      labelStyle: TextStyle(color: Colors.purple.shade100),
                      hintText: 'Informe o Email',
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0), 
                  ),
                    ),

                    validator: (confirmaEmail){
                      if(confirmaEmail == null){
                        return 'Informe o Email';
                      }
                      else if(confirmaEmail.isEmpty){
                        return 'Informe o Email';
                      }
                      return null; 
                    }

                  ),
                  //Fim campo ConfirmaEmail

                    SizedBox(height: 30), // Espaçamento


                  //Botão para adicionar ao carrinho
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(500, 50),
                      backgroundColor: Colors.purple.shade900,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed:(){

                      if(formkey.currentState!.validate()){
                        Navigator.pop(context);
                      }

                    },child: Text('Enviar')
                  ),
                  //Fim botão
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}