import 'dart:convert';

import 'package:marvelflutterapp/model/characters_model.dart';

import 'package:http/http.dart' as http;

const URL = "https://gateway.marvel.com/v1/public";
const MARVEL_TS = "1583639417331";
const MARVEL_PUBLIC_KEY = "cf9174bc5ca57759cbb0b9adaa84e82d";
const MARVEL_HASH = "bff0a37f883b38011773da65f8dfcb6d";

class Api {
  Future<Characters> getAllCharacters(int page) async {
    http.Response response = await http.get(
        '$URL/characters?ts=$MARVEL_TS&apikey=$MARVEL_PUBLIC_KEY&hash=$MARVEL_HASH&offset=$page&limit=20');
    print(response.body);
    return decode(response);
  }

  Characters decode(http.Response response) {
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return Characters.fromJson(result);
    } else {
      throw Exception();
    }
  }
}
