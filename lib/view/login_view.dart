// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();

  var email = TextEditingController();
  var senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        
      ),

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

                      SizedBox(height: 20), // Espaçamento

                    //Campo Senha
                    TextFormField(
                      
                      controller: senha,
                      decoration: InputDecoration(
                        icon: Icon(Icons.key),
                        labelText: 'Senha: ',
                        labelStyle: TextStyle(color: Colors.purple.shade100),
                        hintText: 'Informe a Senha',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0), 
                    ),
                      ),

                      validator: (senha){
                        if(senha == null){
                          return 'Informe o Senha';
                        }
                        else if(senha.isEmpty){
                          return 'Informe o Senha';
                        }
                        return null; 
                      }

                    ),
                    //Fim campo Senha

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed:(){
                          },child: Text('Esqueceu a senha?'),
                        ),
                      ],
                    ),

                    SizedBox(height: 30),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(500, 50),
                        backgroundColor: Colors.purple.shade900,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      onPressed:(){

                        if(formkey.currentState!.validate()){
                          Navigator.pushNamed(context, 'cardapio');
                        }

                      },child: Text('Login')
                    ),

                  ],
                )
            ],
          )
        ),
      ),
      
    );
  }
}