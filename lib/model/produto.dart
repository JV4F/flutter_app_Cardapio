class Produto {

  //Atriburtos
  final double precoProd;
  final String uid;
  final String nomeProd;
  final String fotoProd;
  final String descricaoProd;

  //Construtor
  Produto(this.uid ,this.precoProd, this.nomeProd, this.descricaoProd, this.fotoProd);

   Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid' : uid,
      'nome' : nomeProd,
      'descricao' : descricaoProd,
      'preco' : precoProd,
      'imagem' : fotoProd
    };
   }

    factory Produto.fromJson(Map<String, dynamic> json) {
      return Produto(
        json['uid'],
        json['nome'],
        json['descricao'],
        json['preco'],
        json['imagem'],
      );
    }
}