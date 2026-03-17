import 'dart:io';

main() {
  print("Insira o nome: ");
  String nome = stdin.readLineSync() ?? "";
  print("Insira o cargo: ");
  String? cargo = stdin.readLineSync();
  cadastrarFunc(nome, cargo);
}

cadastrarFunc(String? nm, String? cg) {
  if (cg != null && cg.isNotEmpty) {
    print('Ola, $nm! - Cargo: $cg');
  } else {
    print('Ola, $nm!');
  }
}
