//Mixin de Posició GPS (GPSLocation)
mixin Gpslocation {
  //Atributs: double latitud, double longitud.
  late double latitud = 0.0;
  late double longitud = 0.0;
 
  //Mètode actualitzarUbicacio(double lat, double lng).
  void actualitzarUbicacio (double lat, double lng) {
    this.latitud = lat;
    this.longitud = lng;
  } 

  //Mètode obtenirCoordenades() preferiblement que retorni un Record de Dart: (double lat, double lng).
  (double, double) obtenirCoordenades() => (latitud, longitud);
}