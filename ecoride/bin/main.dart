import '../lib/user.dart';
import '../lib/vehicle.dart';

void main() {
  //Inicialització: Crea una llista anomenada flota amb almenys 3 Patinets i 2 Cotxes amb diferents nivells de bateria i coordenades inicials.
  List<Vehicle> flota = [];
  Patinet P1 = new Patinet.nou(
    id: "P1",
    bateriaPercentatge: 30,
    preuPerMinut: 15.0,
    velocitatMaxima: 25,
  );
  Patinet P2 = new Patinet.nou(
    id: "P2",
    bateriaPercentatge: 46,
    preuPerMinut: 15.0,
    velocitatMaxima: 25,
  );
  Patinet P3 = new Patinet.nou(
    id: "P3",
    bateriaPercentatge: 78,
    preuPerMinut: 15.0,
    velocitatMaxima: 25,
  );
  Cotxe C1 = new Cotxe.nou(
    id: "C1",
    bateriaPercentatge: 90,
    enUs: true,
    preuPerMinut: 85.0,
    places: 4,
    requereixLlicencia: true,
  );
  Cotxe C2 = new Cotxe.nou(
    id: "C2",
    bateriaPercentatge: 10,
    preuPerMinut: 50.0,
    places: 2,
    requereixLlicencia: false,
  );

  flota.add(P1);
  flota.add(P2);
  flota.add(P3);
  flota.add(C1);
  flota.add(C2);

  //Cerca i Filtres (Programació Funcional):
  //Filtra i mostra per pantalla quin és el vehicle amb la bateria més alta utilitzant mètodes de col·leccions (reduce o sort).

  flota.sort((a, b) => a.bateriaPercentatge.compareTo(b.bateriaPercentatge));
  print(flota.last.id);

  //Obtén una subllista amb tots els vehicles que tinguin una bateria superior al 20% i no estiguin en ús.
  List<Vehicle> subLlista = flota.sublist(0);
  subLlista.removeWhere(
    (vehicle) => vehicle.bateriaPercentatge < 20 && !vehicle.enUs,
  );

  //Simulació d'Ús i Destructuració de Records:
  //Simula que un usuari reserva un Patinet durant 15 minuts. Mostra el cost calculat.
  User U1 = new User.nou(
    id: "U1",
    nom: "Nahuel Medina",
    correu: "nahuel@correu.es",
    esVip: true,
  );
  print(P3.calcularCostReserva(15, U1.esVip));

  //Actualitza la posició GPS del patinet.
  P3.actualitzarUbicacio(63.23, 14.62);

  //Extreu les coordenades fent servir la destructuració de Records de Dart 3: var (lat, lng) = patinet.obtenirCoordenades(); i imprimeix-les per consola.
  var (lat, lng) = P3.obtenirCoordenades();
  print("Les coordenades del Patinet P3 són $lat i $lng");

  //Maneig d'Errors: Intenta recarregar el saldo d'un usuari amb un valor negatiu (-10.0€) i gestiona l'error amb un bloc try-catch per evitar que el programa s'aturi bruscament.
  try {
    U1.recarregarSaldo(-10);
  } on ArgumentError catch (e) {
    print(e.message);
  }
}
