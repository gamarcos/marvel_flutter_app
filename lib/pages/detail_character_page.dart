import 'package:flutter/material.dart';
import 'package:marvelflutterapp/model/characters_model.dart';

class DetailCharacterPage extends StatelessWidget {
  Results _character;

  DetailCharacterPage(this._character);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Hero(
              child: Image.network('${_character.thumbnail.path}.'
                  '${_character.thumbnail.extension}'),
              tag: _character.name,
            ),
            Expanded(
                child: Center(child: Text(_character.name, style: TextStyle(fontSize: 40)),
            ))
          ],
        ),
      ),
    );
  }
}
