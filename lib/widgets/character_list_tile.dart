import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterListTile extends StatelessWidget {
  final String thumb;
  final String title;
  final Function onPress;

  CharacterListTile({this.thumb, this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _builderCard(),
      onTap: onPress,
    );
  }

  Widget _builderCard() {
    return Container(
      child: SizedBox(
        width: 200,
        height: 250,
        child: Wrap(
          children: <Widget>[
            Container(
              height: 250,
              margin: EdgeInsets.all(8),
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
                    children: <Widget>[_builderBackgroundImage(),],
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
            ),
            _builderTitle()
          ],
        )
      ),
    );
  }

  Widget _builderBackgroundImage() {
    return Hero(
        tag: title,
        child: Container(
            child: Image(
              image: NetworkImage(thumb),
              fit: BoxFit.cover,
            )));
  }

  Widget _builderTitle() {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 8, left: 8),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
