// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();

  var nome = TextEditingController();
  var email = TextEditingController();
  var senha = TextEditingController();
  var confirmaSenha = TextEditingController();

  @override
   Widget build(BuildContext context) {
    return Scaffold(

      //Barra De Cima
      appBar: AppBar(

            backgroundColor: Colors.purple.shade900,

            title: Text(
              'Cadastre-se',
              style: TextStyle(color: Colors.white),
            ),

          ),
          //Fim barra cima

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

                    //Campo Nome
                    TextFormField(
                      
                      controller: nome,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Nome: ',
                        labelStyle: TextStyle(color: Colors.purple.shade100),
                        hintText: 'Informe o Nome',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0), 
                    ),
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

                    SizedBox(height: 20), //Espaçamento

                    //Campo confirma Senha
                    TextFormField(
                      
                      controller: confirmaSenha,
                      decoration: InputDecoration(
                        icon: Icon(Icons.key),
                        labelText: ' Confirme a Senha: ',
                        labelStyle: TextStyle(color: Colors.purple.shade100),
                        hintText: 'Informe a Senha',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0), 
                    ),
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

                    SizedBox(height: 30), // Espaçamento

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(500, 50),
                        backgroundColor: Colors.purple.shade900,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      onPressed:(){

                        //Navigator.pop(context);

                      },child: Text('Cadastrar')
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
