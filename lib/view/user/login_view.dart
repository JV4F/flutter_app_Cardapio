// ignore_for_file: prefer_const_constructors, collection_methods_unrelated_type, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app08/controller/login_controller.dart';
import 'package:flutter_app08/service/usuario_servide.dart';
import 'package:get_it/get_it.dart';

final UsuarioService srv = GetIt.instance<UsuarioService>(); //Para que possamos usar o getIt dentro da tela


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  //Atributos
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var nome = TextEditingController();
  var email = TextEditingController();
  var senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Backgraund para clarear a imagem/Textura utilizada 
      backgroundColor: Colors.green.shade700,

      //Barra Superior
      appBar: AppBar(
        backgroundColor: Colors.red.shade900, //Cor barra superior

        //Icone seta
        leading: IconButton( 
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed:(){
            Navigator.popAndPushNamed(context, 'homepage');
          }, 
        ),
        //Fim icone seta

        title: Row( //Linha para poder espaçar o Texto do Icone
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //Espaçamento
          children: [

            //Texto
            Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            //Fim Texto

            //Logo barra superior
            Image.asset('lib/image/logoapp.png', height: 80),
            //Fim logo barra superior
          ],
        ),
      ),
      //Fim Barra Superior


      body: Container(

        //Imagem/Textura de fundo do app
        padding: MediaQuery.paddingOf(context),
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

          child:Column(

            children: [
                
              Image.asset('lib/image/logoapp.png',
                height: MediaQuery.of(context).size.height * .3 ,
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

                    SizedBox(height: 10), // Espaçamento

                  //Campo Senha
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .09,
                    child: TextFormField(
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
                  ),
                  //Fim campo Senha

                  //Esqueceu Senha
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: TextButton(
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
                      ),
                    ],
                  ),
                  //Fim Esqueceu senha

                  SizedBox(height: 15),

                  //Botão Entrar
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
                    
                       LoginController().login(context, nome.text,email.text, senha.text);
                    
                      },child: Text('Entrar')
                    
                    ),
                  ),
                  //Fim botão entrar

                ], //Children

              )

            ], //Children

          )

        ),

      ),

    );

  } //Build

} //Class