import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelflutterapp/bloc/search_character_bloc.dart';
import 'package:marvelflutterapp/model/characters_model.dart';
import 'package:marvelflutterapp/widgets/character_list_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<SearchCharacterBloc>(context);
    bloc.getAllCharacters();

    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: NotificationListener(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: StreamBuilder(
                      stream: bloc.outCharacters,
                      initialData: [],
                      builder: (context, snapshot) {
                        if (snapshot.hasData)
                          return GridView.count(
                              crossAxisCount: 2,
                              controller: _scrollController,
                              children: _createCharactersCard(snapshot.data));
                        else
                          return Container();
                      }),
                )
              ],
            ),
            onNotification: (notification) {
              if (isEndListScroll(notification)) {
                bloc.updateCharactersList();
              }
              return true;
            }));
  }

  List<Widget> _createCharactersCard(characters) {
    List<Widget> widget = [];
    for (Results character in characters) {
      widget.add(CharacterListTile(character));
    }
    return widget;
  }

  bool isEndListScroll(notification) =>
      notification is ScrollEndNotification &&
      _scrollController.position.atEdge &&
      _scrollController.position.pixels > 0;
}
