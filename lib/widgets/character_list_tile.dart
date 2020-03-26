import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelflutterapp/model/characters_model.dart';
import 'package:marvelflutterapp/pages/detail_character_page.dart';

class CharacterListTile extends StatelessWidget {
  final Results character;

  CharacterListTile(this.character);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _builderCard(),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>DetailCharacterPage(character))
        );
      },
    );
  }

  Widget _builderCard() {
    return Center(
      child: SizedBox(
        width: 250,
        height: 325,
        child: Container(
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(30, 0, 0, 0),
                    offset: Offset(0.0, 10.0),
                    spreadRadius: 0,
                    blurRadius: 10)
              ]),
          child: Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  _builderBackgroundImage(),
                  Column(
                    children: <Widget>[
                      Container(margin: EdgeInsets.only(top: 10)),
                      Expanded(child: Container()),
                      _builderTitle()
                    ],
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }

  Widget _builderBackgroundImage() {
    return Hero(
      child: Image(
        image: NetworkImage('${character.thumbnail.path}.'
            '${character.thumbnail.extension}'),
        fit: BoxFit.cover,
      ),
      tag: character.name,
    );
  }

  Widget _builderTitle() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(bottom: 20, left: 20),
      child: Text(
        character.name,
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}
