// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter_app08/model/usuario.dart';
import 'package:flutter_app08/service/usuario_servide.dart';
import 'package:get_it/get_it.dart';
import 'package:email_validator/email_validator.dart';


final UsuarioService srv = GetIt.instance<UsuarioService>();


class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {

  //Atributos
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  var nome = TextEditingController();
  var email = TextEditingController();
  var senha = TextEditingController();
  var confirmaSenha = TextEditingController();


  @override
   Widget build(BuildContext context) {

    srv.usuario.length = 0; //Definindo o tamanho da lista usuario pra 0
    
    return Scaffold(

       //Backgraund para clarear a imagem/Textura utilizada
      backgroundColor: Colors.green.shade700,

      //Barra De Cima
      appBar: AppBar(

          backgroundColor: Colors.red.shade900, //Cor barra superior

          //Seta pra voltar
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed:(){
              Navigator.popAndPushNamed(context, 'homepage');
            }, 
          ),
          //Fim Seta

            title: Row( //Linha para poder espaçar o Texto do Icone
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //Espaçamento
              children: [

                //Texto
                Text(
                  'Cadastre-se',
                  style: TextStyle(color: Colors.white),
                ),
                //Fim Texto

                //Icone do AppBar
                Image.asset('lib/image/logoapp.png', height: 80),
                //Fim Icone do AppBar

              ],
            ),
          ),
          //Fim barra cima

      body: Container(
        
        //Imagem/Textura de fundo do app
        padding: EdgeInsets.all(10),
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
                
                //Inicio icone principal
                Image.asset('lib/image/logoapp.png', height: 300),
                //Fim icone principal

                Column(

                  children: [

                    //Campo Nome
                    TextFormField(
                    controller: nome,
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
                      icon: Icon(Icons.person),
                      labelText: 'Nome: ',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Informe o Nome',
                    ),

                      validator: (nome){
                        if(nome == null){
                          return 'Informe o Nome';
                        }
                        else if(nome.isEmpty){
                          return 'Informe o Nome';
                        }
                        return null; 
                      }

                    ),
                    //Fim campo Nome
                    
                    SizedBox(height: 20), //Espaçamento

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
                        if(!EmailValidator.validate(email)){
                          return 'Informe um Email válido';
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
                          return 'informe o Senha';
                        }
                        else if(senha.isEmpty){
                          return 'informe o Senha';
                        }
                        return null; 
                      }

                    ),
                    //Fim campo Senha

                    SizedBox(height: 20), //Espaçamento

                    //Campo confirma Senha
                    TextFormField(
                    controller: confirmaSenha,
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
                      labelText: 'Confirmar Senha: ',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Confirme a Senha',
                    ),

                      validator: (confirmaSenha){
                        if(confirmaSenha == null){
                          return 'Confirme o Senha';
                        }
                        else if(confirmaSenha.isEmpty){
                          return 'Confirme o Senha';
                        }
                        return null; 
                      }

                    ),
                    //Fim campo confirma Senha

                    SizedBox(height: 20), // Espaçamento

                    //Botão Cadastrar
                    ElevatedButton(
                       style:ElevatedButton.styleFrom(
                        minimumSize: Size(350, 60),
                        backgroundColor: Colors.white, 
                        foregroundColor: Colors.red,
                        textStyle: TextStyle(fontSize: 25),
                      ),
                      onPressed:(){

                        if(formkey.currentState!.validate()){
                          if(senha.text == confirmaSenha.text){
                            srv.adicionarUser(Usuario(nome.text, email.text, senha.text, confirmaSenha.text));
                            Navigator.popAndPushNamed(context, 'categoria');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                              content: Text('Cadastrado com sucesso!!', style: TextStyle(fontSize: 15)),
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
                          if(senha.text != confirmaSenha.text){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                              content: Text('Senhas não coincidem!!', style: TextStyle(fontSize: 15)),
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
                      },child: Text('Cadastrar')
                    ),
                    //Fim Botão Cadastrar

                  ],

                )

            ],

          )

        ),

      ),

    );

  } //Build

} //Class
