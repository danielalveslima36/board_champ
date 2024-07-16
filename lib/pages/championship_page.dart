import 'package:flutter/material.dart';
import '../models/player.dart';
import 'package:teste/pages/game_start_page.dart';// Mantenha esta importação se estiver em um arquivo separado

class ChampionshipPage extends StatefulWidget {
  final List<Player> players;

  ChampionshipPage({required this.players});

  @override
  _ChampionshipPageState createState() => _ChampionshipPageState();
}

class _ChampionshipPageState extends State<ChampionshipPage> {
  final TextEditingController _championshipNameController = TextEditingController();

  void _startChampionship(BuildContext context) {
    String championshipName = _championshipNameController.text;
    if (championshipName.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameStartPage(
            championshipName: championshipName,
            players: widget.players,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, defina o nome do campeonato')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Definir Campeonato'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _championshipNameController,
              decoration: InputDecoration(labelText: 'Nome do Campeonato'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _startChampionship(context),
              child: Text('Iniciar'),
            ),
          ],
        ),
      ),
    );
  }
}
