// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app08/view/components/mensagem.dart';

class LoginController{
 final FirebaseAuth auth = FirebaseAuth.instance;

 void criarConta(context, nome, email, telefone, endereco, senha) {
   auth.createUserWithEmailAndPassword(
      email: email, password: senha
    ).then((resultado){

      //
      //ARMAZENAR o nome do usuario no Firestore
      //
      FirebaseFirestore.instance.collection("Usuarios").add(
        {
          'uid' : resultado.user!.uid,
          'nome' : nome,
          'email': email,
          'phone' : telefone,
          "Cep" : endereco
        }
      );

        sucesso(context, 'Usuario criado com sucesso!');
        Navigator.pushNamed(context, 'categoria');
    }).catchError((e){
      switch(e.code){
        case 'email-already-in-use':
        erro(context, 'O email ja foi cadastrado.');
        break;
        case 'invalid-email':
        erro(context, 'O formato do email é inválido.');
        break;
        default:
        erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  //
  // LOGIN
  // Efetuar o login de um usuário previamente cadastrado
  // no serviço Firebase Authentication
  //
  void login(context, nome, email, senha) {
    auth.signInWithEmailAndPassword(
      email: email, password: senha
    ).then((resultado){
      sucesso(context, 'Usuario autenticado com sucesso!');
      Navigator.pushNamed(context, 'categoria');
    }).catchError((e){
      switch(e.code){
        case 'invalid-email':
        erro(context, 'O formato do email é inválido');
        break;

        default:
        erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  //
  // ESQUECEU A SENHA
  // Envia uma mensagem de email para recuperação de senha para
  // um conta de email válida
  //
  void esqueceuSenha(context, String email) {
    if(email.isNotEmpty){
      auth.sendPasswordResetEmail(email: email);
      sucesso(context, 'Email enviado com sucesso.');
    }
    else{
      erro(context, 'Informe o email para recuperação');
    }
    Navigator.pop(context);
  }

  //
  // LOGOUT
  //
  logout() {
    auth.signOut();
  }

  //
  // ID do Usuário Logado
  //
  idUsuario() {
    return auth.currentUser!.uid;
  }

  //
  // NOME do Usuário Logado
  //
  Future<String> usuarioLogado() async {
    var nome = '';
    await FirebaseFirestore.instance
    .collection('Usuarios')
    .where('uid', isEqualTo: idUsuario())
    .get()
    .then((resultado){
      nome = resultado.docs[0].data()['nome'] ?? '';
    });
    return nome;
  }
}