import 'gpslocation.dart';

//Jerarquia de Vehicles (Vehicle, Patinet, Cotxe)
//Classe abstracta Vehicle amb el mixin GPSLocation:
abstract class Vehicle with Gpslocation{
  //Atributs: id (String), bateriaPercentatge (int de 0 a 100), enUs (bool, inicialment false), preuPerMinut (double).
  late String id;
  late int bateriaPercentatge;
  bool enUs = false;
  late double preuPerMinut;

//Mètodes:
  //estatBateria() -> Retorna una String segons el percentatge fent servir una Switch Expression de Dart 3:
    //>= 80: "Alta"
    //20..79: "Mitjana"
    //< 20: "Crítica (Requereix càrrega)"
  String estatBateria() => switch (this.bateriaPercentatge) {
      >=80 => "Alta.",
      <20 => "Crítica (Requereix càrrega)",
      _ => "Mitjana"
  };

  //Mètode abstracte double calcularCostReserva(int minuts).
  double calcularCostReserva(int minuts, bool esVip);
}

//Subclasse Patinet (hereta de Vehicle):
class Patinet extends Vehicle{
  //Atribut propi: velocitatMaxima (int, ex: 25 km/h).
  late int velocitatMaxima;

  //Constructor extés de Vehicle, amb l'atribut propi.
  Patinet.nou({required id, required bateriaPercentatge, enUs = false, required preuPerMinut, required velocitatMaxima}) {
    this.id = id;
    this.bateriaPercentatge = bateriaPercentatge;
    this.enUs = enUs;
    this.preuPerMinut = preuPerMinut;
    this.velocitatMaxima = velocitatMaxima;
  }

  //Sobreescriu calcularCostReserva(int minuts): minuts * preuPerMinut. Si esVIP l'usuari té un 10% de descompte (passa l'usuari com a argument o aplica lògica).
  @override
  double calcularCostReserva(int minuts, bool esVip) {
    return esVip? minuts*preuPerMinut*0.90: minuts*preuPerMinut;
  }

}

//Subclasse Cotxe <(hereta de Vehicle):
class Cotxe extends Vehicle{
  //Atributs propis: places (int), requereixLlicencia (bool).
  late int places;
  late bool requereixLlicencia;

  //Constructor extés de Vehicle, amb els atributs propis.
  Cotxe.nou({required id, required bateriaPercentatge, enUs = false, required preuPerMinut, required places, required requereixLlicencia}) {
    this.id = id;
    this.bateriaPercentatge = bateriaPercentatge;
    this.enUs = enUs;
    this.preuPerMinut = preuPerMinut;
    this.places = places;
    this.requereixLlicencia = requereixLlicencia;
  }

  //Sobreescriu calcularCostReserva(int minuts): (minuts * preuPerMinut) + suplementFiltreEcologic (2.0€).
  @override
  double calcularCostReserva(int minuts, bool esVip) {
    double suplementFiltreEcologic = 2.0;
    return (minuts * preuPerMinut) + suplementFiltreEcologic;
  }
}