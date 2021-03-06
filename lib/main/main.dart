import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:marvelflutterapp/bloc/search_character_bloc.dart';
import 'package:marvelflutterapp/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: SearchCharacterBloc(),
        child: BlocProvider(
          child: MaterialApp(
            title: 'Flutter',
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          ),
        )
    );
  }
}
