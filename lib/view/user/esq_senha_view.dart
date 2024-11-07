// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EsqSenhaView extends StatefulWidget {
  const EsqSenhaView({super.key});

  @override
  State<EsqSenhaView> createState() => _EsqSenhaViewState();
}

class _EsqSenhaViewState extends State<EsqSenhaView> {

  //Atributos
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var email = TextEditingController();
  var confirmaEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //Backgraund para clarear a imagem/Textura utilizada 
      backgroundColor: Colors.green.shade700,

      //Barra Superior
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
        //Fim Imagem/Textura de fundo do app


        child: Form(

          key: formkey,

          child:Column(

            children: [
                
              //Inicio icone principal
              Image.asset('lib/image/logoapp.png',
                height: MediaQuery.of(context).size.height * .3,
              ),
              //Fim icone principal

              Column(

                children: [

                  //Campo Email
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .09,
                    child: TextFormField(
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
                        if(!EmailValidator.validate(email)){
                            return 'Informe um Email válido';
                        }
                        return null; 
                      }
                    
                    ),
                  ),
                  //Fim campo Email

                    SizedBox(height: 20), // Espaçamento

                  //Campo Senha
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .09,
                    child: TextFormField(
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
                  ),
                  //Fim campo Senha

                  SizedBox(height: 20),

                  //Botão Enviar
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .08,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(350, 60),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.red,
                        textStyle: TextStyle(fontSize: 25),
                      ),
                      onPressed:(){
                    
                        if(formkey.currentState!.validate()){
                          if(confirmaEmail.text == email.text){
                            Navigator.popAndPushNamed(context, 'login');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Solicitação enviada!!', style: TextStyle(fontSize: 15)),
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
                          else if(confirmaEmail.text != email.text){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Emails não coincidem!!', style: TextStyle(fontSize: 15)),
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
                        } 
                    
                      },child: Text('Enviar')
                    ),
                  ),
                  //Fim Botão Enviar

                ], //Children

              )

            ], //Children

          )

        ),

      ),

    );

  } //Builder

} //Class