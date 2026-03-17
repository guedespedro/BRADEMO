class Laptop {
  var id;
  String? nome;
  var ram;
  var clockCpu;

  Laptop(var identif, String? nm, var rm, var cckCpu) {
    id = identif;
    nome = nm;
    ram= rm;
    clockCpu = cckCpu;
  }
  imprimir() {
    print(
      'id: ${this.id}, nome: ${this.nome}, ram: ${this.ram}, clock: ${this.clockCpu} ',
    );
  }
}

main() {
  var lp1 = Laptop("XBN123", "Lenovo G12", "16GB", "6GhZ");
  var lp2 = Laptop("XBN124", "Acer nitro 5", "16GB", "7GhZ");
  var lp3 = Laptop("XBN125", "Asus vivobook 15", "16GB", "8GhZ");
  lp1.imprimir();
  lp2.imprimir();
  lp3.imprimir();
}
