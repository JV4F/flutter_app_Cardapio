// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace


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
  var telefone= TextEditingController();
  var endereco = TextEditingController();
  var senha = TextEditingController();
  var confirmaSenha = TextEditingController();


  @override
   Widget build(BuildContext context) {

    //srv.usuario.length = 0; //Definindo o tamanho da lista usuario pra 0
    
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
        //Fim imagem/Textura de fundo do app

        child: Form(

          key: formkey,

          child:Column(

            children: [
              
                Column(

                  
                  children: [
                    SizedBox(height: 30),
                    //Campo Nome
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .08,
                      child: TextFormField(
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
                    ),
                    //Fim campo Nome
                    
                    SizedBox(height: 5), //Espaçamento

                    //Campo Email
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .08,
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

                    SizedBox(height: 5),

                    //Campo Telefone
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .08,
                      child: TextFormField(
                        controller: telefone,
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.red.shade900),
                          ),
                          iconColor: Colors.white,
                          icon: Icon(Icons.phone),
                          labelText: 'Tel: ',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Informe o Telefone',
                        ),
                        validator: (telefone) {
                          if (telefone == null || telefone.isEmpty) {
                            return 'Informe o Telefone';
                          } else if (!RegExp(r'^\d{7}-\d{4}$').hasMatch(telefone) && !RegExp(r'^\d{11}$').hasMatch(telefone)) {
                            return 'Telefone inválido. Use o formato (00)12345-6789. ';
                          }
                          return null; 
                        },
                      ),
                    ),
                    //Fim campo Telefone
                    SizedBox(height: 5),

                    //Campo Endereço
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .08,
                      child: TextFormField(
                        controller: endereco,
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.red.shade900),
                          ),
                          iconColor: Colors.white,
                          icon: Icon(Icons.location_on_outlined),
                          labelText: 'CEP: ',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Informe o CEP',
                        ),
                        validator: (endereco) {
                          if (endereco == null || endereco.isEmpty) {
                            return 'Informe o CEP';
                          } else if (!RegExp(r'^\d{5}-\d{3}$').hasMatch(endereco) && !RegExp(r'^\d{8}$').hasMatch(endereco)) {
                            return 'CEP inválido. Use o formato 12345-678 ou 12345678.';
                          }
                          return null; 
                        },
                      ),
                    ),
                    //Fim campo Endereço

                    SizedBox(height: 5), // Espaçamento

                    //Campo Senha
                     Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .08,
                       child: TextFormField(
                        controller: senha,
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.red.shade900),
                          ),
                          iconColor: Colors.white,
                          icon: Icon(Icons.key),
                          labelText: 'Senha: ',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Informe a Senha',
                        ),
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return 'Informe a sennha';
                          } else if (!RegExp(r'^\d{6}$').hasMatch(senha) && !RegExp(r'^\d{8}$').hasMatch(senha)) {
                            return 'Senha inválida. Minimo 6 digitos e maximo 8 digitos';
                          }
                          return null; 
                        },
                      ),
                     ),
                    //Fim campo Senha

                    SizedBox(height: 5), //Espaçamento

                    //Campo confirma Senha
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .08,
                      child: TextFormField(
                        controller: confirmaSenha,
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.red.shade900),
                          ),
                          iconColor: Colors.white,
                          icon: Icon(Icons.key),
                          labelText: 'Senha: ',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Informe a Senha',
                        ),
                        validator: (confirmasenha) {
                          if (confirmasenha == null || confirmasenha.isEmpty) {
                            return 'Informe a sennha';
                          } else if (!RegExp(r'^\d{6}$').hasMatch(confirmasenha) && !RegExp(r'^\d{8}$').hasMatch(confirmasenha )) {
                            return 'Senha inválida. Minimo 6 digitos e maximo 8 digitos';
                          }
                          return null; 
                        },
                      ),
                    ),
                    //Fim campo confirma Senha

                    SizedBox(height: 15), // Espaçamento

                    //Botão Cadastrar
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .08,
                      child: ElevatedButton(
                         style:ElevatedButton.styleFrom(
                          minimumSize: Size(350, 60),
                          backgroundColor: Colors.white, 
                          foregroundColor: Colors.red,
                          textStyle: TextStyle(fontSize: 25),
                        ),
                        onPressed:(){
                      
                          if(formkey.currentState!.validate()){
                            if(senha.text == confirmaSenha.text){
                              srv.usuario.add(Usuario(nome.text, email.text, telefone.text, endereco.text, senha.text, confirmaSenha.text));
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
