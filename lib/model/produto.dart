class Produto {

  //Atriburtos
  final double precoProd;
  final String nomeProd;
  final String fotoProd;
  final String descricaoProd;

  //Construtor
  Produto(this.precoProd, this.nomeProd, this.descricaoProd, this.fotoProd);

  //Geração de dados pra teste

  static List<Produto> gerardados(){
    List<Produto> cardapio = [];
    cardapio.add(Produto(25, "Pizza Calabresa", 'Pizza feita com molho de tomate, mussarela, calabresa, catupiry e cebola' ,'lib/image/pizzacalabresa.jpg'));
    cardapio.add(Produto(30, "Pizza Lombo", 'Pizza feica com mussarela, lombo canadense e catupiry' ,"lib/image/pizzacalabresa.jpg"));

    return cardapio;
  }
  




}