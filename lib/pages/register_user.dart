import 'package:flutter/material.dart';
import 'package:teste/models/player.dart';
import 'package:teste/pages/championship_page.dart';


class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _squadController = TextEditingController();

  List<Player> _players = [];

  void _addUser() {
    String name = _nameController.text;
    String squad = _squadController.text;

    if (name.isNotEmpty && squad.isNotEmpty) {
      setState(() {
        _players.add(Player(name: name, squad: squad));
        _nameController.clear();
        _squadController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário adicionado à lista!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
    }
  }

  void _goToChampionships() {
    if (_players.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChampionshipPage(players: _players),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nenhum usuário para registrar')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _squadController,
              decoration: InputDecoration(labelText: 'Squad'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addUser,
              child: Text('Adicionar Usuário'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _goToChampionships,
              child: Text('Finalizar'),
            ),
          ],
        ),
      ),
    );
  }
}
