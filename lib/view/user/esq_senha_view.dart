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
       backgroundColor: Colors.green.shade700,
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed:(){
            Navigator.popAndPushNamed(context, 'login');
          }, 
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recuperar Senha',
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
              SizedBox(height: 20),              //Fim icone principal

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

                    SizedBox(height: 30), // Espaçamento

                  //Campo Senha
                  TextFormField(
                    controller: confirmaEmail,
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
                      labelText: 'Confirme o Email',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Informe o Email',
                    ),

                    validator: (senha){
                      if(senha == null){
                        return 'Confirme o Email';
                      }
                      else if(senha.isEmpty){
                        return 'Confirme o Email';
                      }
                      return null; 
                    }

                  ),
                  //Fim campo Senha

                  SizedBox(height: 80),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(350, 60),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      textStyle: TextStyle(fontSize: 25),
                    ),
                    onPressed:(){

                      if(formkey.currentState!.validate()){
                        Navigator.popAndPushNamed(context, 'login');
                      }

                    },child: Text('Enviar')
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