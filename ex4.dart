import 'dart:io';

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
  Laptop.navegacao({required this.id, this.nome})
      : ram = 4,
        clockCpu = 1.6;

  Laptop.escritorio({required this.id, this.nome})
      : ram = 8,
        clockCpu = 2.4;

  Laptop.programacao({required this.id, this.nome})
      : ram = 16,
        clockCpu = 3.5;

} 
void main() {
  var lap1 = Laptop( 1,  "Inspiron", 8, 2.4);
  var lap2 = Laptop( 2,  "Vivobook", 4, 1.8);
  var lap3 = Laptop( 3,  "ThinkPad", 16, 3.2);

  lap1.imprimir();
  lap2.imprimir();
  lap3.imprimir();

  print('');

  var pcWeb = Laptop.navegacao(id: 4, nome: "Chromebook");
  var pcOffice = Laptop.escritorio(id: 5, nome: "ProBook");
  var pcDev = Laptop.programacao(id: 6, nome: "Alienware");

  pcWeb.imprimir();
  pcOffice.imprimir();
  pcDev.imprimir();
}