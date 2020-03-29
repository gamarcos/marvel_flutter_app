import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvelflutterapp/model/characters_model.dart';
import 'package:marvelflutterapp/model/comics_model.dart';
import 'package:marvelflutterapp/security/secret.dart';
import 'package:marvelflutterapp/security/secret_loader.dart';

class Api {
  Future<Secret> getKeys() async { return await SecretLoader(secretPath: "lib/security/security.json").load(); }

  Future<Characters> getAllCharacters(int page) async {
    var keys = await getKeys();
    http.Response response = await http.get(
        '${keys.url}/characters?ts=${keys.timeStamp}&apikey=${keys.publicKey}&hash=${keys.hash}&offset=$page&limit=20');
    return charactersDecode(response);
  }

  Future<ComicsResponse> getComics(String id) async {
    var keys = await getKeys();
    http.Response response = await http.get(
        '${keys.url}/characters/$id/comics?ts=${keys.timeStamp}&apikey=${keys.publicKey}&hash=${keys.hash}');
    return comicsDecode(response);
  }

  Characters charactersDecode(http.Response response) {
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return Characters.fromJson(result);
    } else {
      throw Exception();
    }
  }

  ComicsResponse comicsDecode(http.Response response) {
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return ComicsResponse.fromJson(result);
    } else {
      throw Exception();
    }
  }
}
