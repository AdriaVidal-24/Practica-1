//Model d'Usuari i Validació (User)
class User {
  //Atributs privats: _id (String), _nomComplet (String), _saldo (double).
  late String _id;
  late String _nomComplet;
  late double _saldo;

  //Atributs públics: correu (String), esVIP (bool, per defecte false).
  late String correu;
  bool esVip;

//Constructors:
  //Constructor nombrat User.nou({required String id, required String nom, required String correu}) (saldo inicial = 0.0).
  User.nou({required String id, required String nom, required String correu, this.esVip = false}) {
    this._id = id;
    this._nomComplet = nom;
    this._saldo = 0.0;
    this.correu = correu;
  }

  //Constructor complet amb tots els paràmetres.
  User(this._id, this._nomComplet, this._saldo, this.correu, [this.esVip = false]);

//Mètodes i Getters:
  //Getter per a saldo i id.
  String get id => _id;
  double get saldo => _saldo;

  //Mètode recarregarSaldo(double quantitat): No permet quantitats negatives o zero (llança una excepció personalitzada o un ArgumentError).
  void recarregarSaldo(double quantitat) {
    if (quantitat <= 0)
      throw ArgumentError("La quantitat no pot ser 0 o menor");
    this._saldo += quantitat;
  }
}
