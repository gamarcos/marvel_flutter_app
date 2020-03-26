import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:marvelflutterapp/model/characters_model.dart';
import 'package:marvelflutterapp/service/Api.dart';

class SearchCharacterBloc extends BlocBase {

  Api _api;
  int _page = 0;
  List<Results> results = [];

  final _charactersController = StreamController<List<Results>>();
  Stream get outCharacters => _charactersController.stream;


  SearchCharacterBloc(){_api = Api();}

  void updateCharactersList() {
    _page++;
    getAllCharacters();
  }

  void getAllCharacters() async {
    var characters = await _api.getAllCharacters(_page);
    results.addAll(characters.data.results);
    _charactersController.sink.add(results);
  }

  @override
  void dispose() {
    _charactersController.close();
  }
}
