import 'package:flutter/material.dart';
import 'package:pokedocapp/pokemon.dart';

class pokemondetails extends StatelessWidget {

  final Pokemon pokemon;

  pokemondetails({this.pokemon});

  bodyWidget() => Stack(
    children: <Widget> [
      Container(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              Text(pokemon.name),
              Text("Height: ${pokemon.height}"),
              Text("Height: ${pokemon.weight}"),
              Text("Types"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: pokemon.type.map((t) => FilterChip(label: Text(t), onSelected: (b){})).toList(),
              ),
              Text("Weakness"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.weaknesses.map((w) => FilterChip(label: Text(w), onSelected: (b){})).toList(),
              ),
            ],
          )
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text(pokemon.name),
      ),

      body: bodyWidget(),

    );
  }
}