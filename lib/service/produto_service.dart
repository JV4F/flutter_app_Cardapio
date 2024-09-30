import 'package:flutter_app08/model/produto.dart';

class ProdutoService {
   List<Produto> produtos = [];

  void adicionarProduto(Produto produto) {
    produtos.add(produto);
  }

  void removerProduto(index) {
    produtos.removeAt(index);
  }

  Produto retornarProduto(id){
    return produtos[id];
  }

}