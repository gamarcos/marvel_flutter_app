import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:marvelflutterapp/bloc/search_character_bloc.dart';
import 'package:marvelflutterapp/model/characters_model.dart';
import 'package:marvelflutterapp/widgets/character_list_tile.dart';

class DetailCharacterPage extends StatelessWidget {
  final Character _character;

  DetailCharacterPage(this._character);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchCharacterBloc>(context);
    bloc.getComics(_character.id.toString());
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0xFF000000), const Color(0xFF8b0000)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0),
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Hero(
                                tag: _character.name,
                                child: Image(
                                  image: NetworkImage(
                                      '${_character.thumbnail.path}.'
                                      '${_character.thumbnail.extension}'),
                                  fit: BoxFit.cover,
                                )),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 40.0),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              iconSize: 30.0,
                              color: Colors.black,
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                child: Text(
                              "Bioagraphy",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                              child: Text(_character.description,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 16.0),
                        child: Text("Comics",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                      ),
                      Container(
                        height: 300,
                        child: StreamBuilder(
                            stream: bloc.outComics,
                            initialData: [],
                            builder: (context, snapshot) {
                              if (snapshot.hasData)
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (_, int index) {
                                    return CharacterListTile(
                                      title: snapshot.data[index].title,
                                      thumb: '${snapshot.data[index].thumbnail.path}.${snapshot.data[index].thumbnail.extension}',
                                    );
                                  },
                                );
                              else
                                return Container();
                            }),
                      )
                    ],
                  )
                ],
              ),
            ))));
  }
}
