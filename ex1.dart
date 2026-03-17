void main() {
  var nomeEquip = "Impressora 3D";
  String local = "Lab de protótipos";
  dynamic numPatri = 12345;

  numPatri = "12345-A";
  print("objec testet");
  print("nome do equipamento é string? ");
  print(nomeEquip is String);
  print("numero do patrimonio é string? ");
  print(numPatri is String);
  print("local é string? ");
  print(local is String);

  /*
  Tendo em vista que o tipo de numero do patrimônio é dinâmico, ele não tem a mesma rigidez
  para receber valores quanto local. Isso porque a variável número do patrimônio é do tipo
  dynamic, podendo receber qualquer tipo de dado que exista na linguagem. Contudo, 
  o tipo de dado de entrada da variável 'local' está fixo em String, que é o modo com que a 
  variável foi declarada.
  */
}
