import 'dart:convert';
import 'package:http/http.dart';

import 'package:rest_countries/src/models/country.model.dart';

class CountriesApi {

  final Client _client= Client();

  Future<Result> getCountries() async{

    final Response response = await _client.get('https://restcountries.eu/rest/v2/all');

    return response.statusCode == 200
      ? Result.fromJsonList(json.decode(response.body))
      : throw Exception('Error al conectar con REST Countries');
  }

}