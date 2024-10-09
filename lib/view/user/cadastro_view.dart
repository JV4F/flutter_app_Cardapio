// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Colors.green.shade700,

      //Barra De Cima
      appBar: AppBar(

          backgroundColor: Colors.red.shade900,

          //Seta pra voltar
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed:(){
              Navigator.popAndPushNamed(context, 'homepage');
            }, 
          ),
          //Fim Seta

            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cadastre-se',
                  style: TextStyle(color: Colors.white),
                ),

                Image.asset('lib/image/logoapp.png', height: 80),
                
              ],
            ),

          ),
          //Fim barra cima

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
                SizedBox(height: 20), // Espaçamento
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
                      icon: Icon(Icons.mail),
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
                      labelText: 'Senha: ',
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

                    SizedBox(height: 30), // Espaçamento

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
