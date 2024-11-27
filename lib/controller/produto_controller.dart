import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoController {

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> listarSal() {
    var resultado = db
        .collection('Itens_cardapio')
        .where('categoria', isEqualTo: 'Pizzas Salgadas' );

    return resultado.snapshots();
  }  

  Stream<QuerySnapshot> listarDoce() {
    var resultado = db
        .collection('Itens_cardapio')
        .where('categoria', isEqualTo: 'Pizzas Doces' );

    return resultado.snapshots();
  }  

  Stream<QuerySnapshot> listarBebidas() {
    var resultado = db
        .collection('Itens_cardapio')
        .where('categoria', isEqualTo: 'Bebidas' );

    return resultado.snapshots();
  }  

}