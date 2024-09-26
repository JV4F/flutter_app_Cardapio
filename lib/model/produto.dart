class Produto {

  //Atriburtos
  final String precoProd;
  final String nomeProd;
  final String fotoProd;

  //Construtor
  Produto(this.precoProd, this.nomeProd, this.fotoProd);

  //Geração de dados pra teste

  static List<Produto> gerardados(){
    List<Produto> cardapio = [];
    cardapio.add(Produto("R¢ 25", "Pizza Calabresa", "lib/image/pizzacalabresa.jpg"));
    cardapio.add(Produto("R¢ 30", "Pizza Lombo", "lib/image/pizzacalabresa.jpg"));

    return cardapio;
  }




}