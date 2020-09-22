
class Result {

  List<Country> results = List();

  Result.fromJsonList(List<dynamic> parsedJson) {

    if(parsedJson == null ) return;

    for(var item in parsedJson ) {
      final result = new Country.fromJsonMap(item);
      results.add(result);
    } 
  }

}

class Country {
  String name;
  String capital;
  String region;
  String subregion;
  int population;
  String nativeName;
  String numericCode;
  String flag;

  Country.fromJsonMap(Map<String, dynamic> parsed){
    name        = parsed['name'];
    capital     = parsed['capital'];
    region      = parsed['region'];
    subregion   = parsed['subregion'];
    population  = parsed['population'];
    nativeName  = parsed['nativeName'];
    numericCode = parsed['numericCode'];
    flag        = parsed['flag'];
  }

  getFlag() {
    if(flag == null ){
      return 'https://extyseg.com/wp-content/uploads/2019/04/EXTYSEG-imagen-no-disponible.jpg';
    } else {
      return flag;
    }
  }
}