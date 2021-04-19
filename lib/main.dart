import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokedocapp/pokemon.dart';
import 'package:pokedocapp/pokemonDetails.dart';

void main() => runApp(MaterialApp(
    title: "Poke Doc",
    home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  var url = Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

  PokeDex pokeDex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decoded = jsonDecode(res.body);
    pokeDex = PokeDex.fromJson(decoded);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon Doc App"),
        backgroundColor: Colors.black,
      ),

      body: PokeDex == null
          ? Center(
    child: LinearProgressIndicator(),
    ): GridView.count(
          crossAxisCount: 2,
          children: pokeDex.pokemon.map((poke) => InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => pokemondetails(pokemon: poke,)));
              },
            child: Hero(
              tag: poke.img,
              child: Card(
              elevation: 20.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(
                height: 100.0,
                width: 100.0,
              ),
                  Text(poke.name),
                ]
              )
              ),
            ),
          ))
          .toList(),
      ),
    );
  }
}
