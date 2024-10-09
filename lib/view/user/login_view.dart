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
      backgroundColor: Colors.green.shade700,
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed:(){
            Navigator.popAndPushNamed(context, 'homepage');
          }, 
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),

            Image.asset('lib/image/logoapp.png', height: 80),
          ],
        ),
        
      ),

      body: Container(
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

        child: Form(

          key: formkey,

          child:Column(

            children: [
                
              //Inicio icone principal
              Image.asset('lib/image/logoapp.png', height: 300),
              //Fim icone principal

              Column(

                children: [

                  //Campo Email
                  TextFormField(
                    controller: email,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red.shade900)
                      ),
                      iconColor: Colors.white,
                      icon: Icon(Icons.mail),
                      labelText: 'Email: ',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Informe o Email',
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
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red.shade900)
                      ),
                      
                      iconColor: Colors.white,
                      icon: Icon(Icons.key),
                      labelText: 'Senha: ',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Informe a Senha',
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
                          foregroundColor: Colors.red.shade100,
                          textStyle: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed:(){
                          Navigator.pushNamed(context, 'recupera');
                        },child: Text('Esqueceu a senha?'),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(350, 60),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      textStyle: TextStyle(fontSize: 25),
                    ),
                    onPressed:(){

                      if(formkey.currentState!.validate()){
                        Navigator.popAndPushNamed(context, 'categoria');
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