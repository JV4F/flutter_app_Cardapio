import 'package:flutter_app08/model/usuario.dart';

class UsuarioService {

  //Listas e Atributos que poderão ser usados pelos Usuarios

  List<Usuario> usuario = [];

   void adicionarUser(Usuario user) {
    usuario.add(user);
  }

  void removerUser(index) {
    usuario.removeAt(index);
  }

  Usuario? retornarUser(email) {
    for (var emailUser in usuario) {
      if (emailUser.email == email) {
        return emailUser; // Usuário encontrado
      }
    }
    return null;
  }

  bool existeUser(email) {
    return usuario.contains(email);
  }
}