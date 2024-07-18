import 'package:flutter/material.dart';
import 'dart:math';
import 'package:teste/models/player.dart';



class PairingPage extends StatefulWidget {
  final List<Player> players;

  PairingPage({required this.players});

  @override
  _PairingPageState createState() => _PairingPageState();
}

class _PairingPageState extends State<PairingPage> {
  List<List<Player>> _pairedPlayers = [];
  int _currentRound = 1;
  int _totalRounds = 0;
  final _formKey = GlobalKey<FormState>();
  bool _roundCompleted = false;

  @override
  void initState() {
    super.initState();
    _totalRounds = _determineNumberOfRounds(widget.players.length);
    _pairPlayers();
  }

  int _determineNumberOfRounds(int numberOfPlayers) {
    if (numberOfPlayers >= 4 && numberOfPlayers <= 8) return 3;
    if (numberOfPlayers >= 9 && numberOfPlayers <= 24) return 4;
    if (numberOfPlayers >= 25 && numberOfPlayers <= 44) return 5;
    if (numberOfPlayers >= 45 && numberOfPlayers <= 148) return 6;
    if (numberOfPlayers >= 149) return 7;
    return 3; // Default
  }

  void _pairPlayers() {
    List<Player> shuffledPlayers = List.from(widget.players)..shuffle(Random());
    _pairedPlayers.clear();

    for (int i = 0; i < shuffledPlayers.length; i += 2) {
      if (i + 1 < shuffledPlayers.length) {
        _pairedPlayers.add([shuffledPlayers[i], shuffledPlayers[i + 1]]);
      } else {
        _pairedPlayers.add([shuffledPlayers[i]]);
      }
    }

    if (shuffledPlayers.length % 2 != 0) {
      Player byePlayer = _findByePlayer();
      byePlayer.hasBye = true;
      byePlayer.victoryPoints += 18;
      byePlayer.eventPoints += 3;
    }
  }

  Player _findByePlayer() {
    List<Player> eligiblePlayers = widget.players.where((p) => !p.hasBye && !p.isDropped).toList();
    if (eligiblePlayers.isEmpty) {
      eligiblePlayers = widget.players.where((p) => !p.isDropped).toList();
    }
    return eligiblePlayers[Random().nextInt(eligiblePlayers.length)];
  }

  void _recordMatchResult(Player player1, int player1Score, Player player2, int player2Score) {
    player1.missionPoints += player1Score;
    player2.missionPoints += player2Score;
    player1.victoryPoints += player1Score > player2Score ? 3 : player1Score == player2Score ? 1 : 0;
    player2.victoryPoints += player2Score > player1Score ? 3 : player2Score == player1Score ? 1 : 0;
  }

  void _submitResults() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _roundCompleted = true;
        widget.players.sort((a, b) => b.victoryPoints.compareTo(a.victoryPoints));
      });
    }
  }

  void _nextRound() {
    if (_currentRound < _totalRounds) {
      setState(() {
        _currentRound++;
        _pairPlayers();
        _roundCompleted = false;
      });
    } else {
      _showChampion();
    }
  }

  void _showChampion() {
    Player champion = widget.players.first;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Campeonato Concluído!'),
        content: Text('O campeão é ${champion.name} com ${champion.victoryPoints} pontos de vitória!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pareamento - Round $_currentRound/$_totalRounds'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _roundCompleted ? _buildRanking() : _buildPairingForm(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _roundCompleted ? _nextRound : _submitResults,
              child: Text(_roundCompleted ? 'Próximo Round' : 'Registrar Resultados'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPairingForm() {
    return Expanded(
      child: Form(
        key: _formKey,
        child: ListView.builder(
          itemCount: _pairedPlayers.length,
          itemBuilder: (context, index) {
            List<Player> pair = _pairedPlayers[index];
            if (pair.length == 2) {
              return ListTile(
                title: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${pair[0].name}'),
                              Text('Squad: ${pair[0].squad}', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Pts'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Insira a pontuação';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              pair[0].missionPoints += int.parse(value!);
                            },
                          ),
                        ),
                        Text(' x '),
                        SizedBox(
                          width: 50,
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Pts'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Insira a pontuação';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              pair[1].missionPoints += int.parse(value!);
                            },
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('${pair[1].name}'),
                              Text('Squad: ${pair[1].squad}', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${pair[0].name} - Bye'),
                    Text('Squad: ${pair[0].squad}', style: TextStyle(fontSize: 12)),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildRanking() {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.players.length,
        itemBuilder: (context, index) {
          Player player = widget.players[index];
          return ListTile(
            title: Text('${player.name}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Squad: ${player.squad}', style: TextStyle(fontSize: 12)),
                Text('Pontos de Missão: ${player.missionPoints}'),
                Text('Pontos de Vitória: ${player.victoryPoints}'),
                Text('Pontos de Evento: ${player.eventPoints}'),
              ],
            ),
            trailing: Text('Ranking: ${index + 1}'),
          );
        },
      ),
    );
  }
}