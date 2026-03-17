import 'dart:io';

class House {
  int id ;
  String name;
  double price;
  
  House(this.id, this.name, this.price);

  void imprimir() {
    print('ID: $id | Nome: $name | Preço: R\$ ${price.toStringAsFixed(2)}');
  }
}

void main() {
  List<House> houses = [];

  for (var i = 1; i <= 3; i++) {
    print('--- Cadastro da Casa $i ---');
    
    stdout.write('Digite o ID: ');
    int id = int.parse(stdin.readLineSync() ?? '0');

    stdout.write('Digite o nome: ');
    String name = stdin.readLineSync() ?? 'Sem Nome';

    stdout.write('Digite o preço: ');
    double price = double.parse(stdin.readLineSync() ?? '0.0');

    houses.add(House(id, name, price)) ;
    print('');
  }

  for (var i = 0; i < houses.length; i++) {
    houses[i]..name = '${houses[i].name} (Cadastrada)';
  }

  print('--- Lista de Residências Cadastradas ---');
  for (var house in houses) {
    house.imprimir();
  }
}