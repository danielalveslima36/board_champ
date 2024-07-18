import 'package:flutter/material.dart';
import 'package:teste/models/player.dart';
import 'package:teste/pages/pairing_page.dart';

class GameStartPage extends StatelessWidget {
  final String championshipName;
  final List<Player> players;

  GameStartPage({required this.championshipName, required this.players});

  void _pairingPlayers(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PairingPage(players: players),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Início do Jogo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Campeonato: $championshipName',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Jogadores:', style: TextStyle(fontSize: 20)),
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${players[index].name} - Squad: ${players[index]
                            .squad}'),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pairingPlayers(context),
              child: Text('Sorteio'),
            ),
          ],
        ),
      ),
    );
  }}