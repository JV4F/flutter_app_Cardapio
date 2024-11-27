import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app08/controller/login_controller.dart';

import '../model/produto.dart';
import '../view/components/mensagem.dart';


class CarrinhoController {

  final FirebaseFirestore db = FirebaseFirestore.instance;  

  adicionar(context, Produto p) {
     db.collection('Carrinho').add(p.toJson())
      .then((value) =>
        sucesso(context, 'Produto adicionado com sucesso!'))
      .catchError((e) => 
        erro(context, 'Não foi possivel realizar a operação!'));
  }

  excluir(context, id) {
    db.collection('Carrinho').doc(id)
      .delete()
      .then((value) =>
        sucesso(context, 'Produto removido com sucesso!'))
      .catchError((e) => 
        erro(context, 'Não foi possivel realizar a operação!'));
  }

  Stream<QuerySnapshot> listarCarrinho() {
    var resultado = db
        .collection('Carrinho')
        .where('uid', isEqualTo: LoginController().idUsuario());
        

    return resultado.snapshots();
  }
}