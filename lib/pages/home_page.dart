import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelflutterapp/bloc/search_character_bloc.dart';
import 'package:marvelflutterapp/model/characters_model.dart';
import 'package:marvelflutterapp/widgets/character_list_tile.dart';

import 'detail_character_page.dart';

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

    var size = MediaQuery.of(context).size;

    final double itemWidth = size.width / 2;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF000000),
            const Color(0xFF8b0000)
        ],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
        )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
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
                                childAspectRatio: (itemWidth / 300),
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
              }))
    );
  }

  List<Widget> _createCharactersCard(characters) {
    List<Widget> widget = [];
    for (Character character in characters) {
      widget.add(CharacterListTile(
        onPress: () => _navigationToDetail(character),
        title: character.name,
        thumb: '${character.thumbnail.path}.${character.thumbnail.extension}',
      ));
    }
    return widget;
  }

  bool isEndListScroll(notification) =>
      notification is ScrollEndNotification &&
      _scrollController.position.atEdge &&
      _scrollController.position.pixels > 0;

  void _navigationToDetail(Character character) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailCharacterPage(character)));
  }
}
