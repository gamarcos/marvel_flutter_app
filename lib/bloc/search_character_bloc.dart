import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:marvelflutterapp/model/characters_model.dart';
import 'package:marvelflutterapp/model/comics_model.dart';
import 'package:marvelflutterapp/service/Api.dart';

class SearchCharacterBloc extends BlocBase {

  Api _api;
  int _page = 0;
  List<Character> characterResult = [];

  final _charactersController = StreamController<List<Character>>.broadcast();
  Stream get outCharacters => _charactersController.stream;

  final _comicsController = StreamController<List<Comic>>.broadcast();
  Stream get outComics => _comicsController.stream;

  SearchCharacterBloc(){_api = Api();}

  void updateCharactersList() {
    _page++;
    getAllCharacters();
  }

  void getAllCharacters() async {
    var characters = await _api.getAllCharacters(_page);
    characterResult.addAll(characters.data.results);
    _charactersController.sink.add(characterResult);
  }

  void getComics(String comicId) async {
    var comicResult = await _api.getComics(comicId);
    _comicsController.sink.add(comicResult.data.results);
  }

  @override
  void dispose() {
    _charactersController.close();
    _comicsController.close();
  }
}
