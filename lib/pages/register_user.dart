import 'package:flutter/material.dart';

class RegisterUserPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementar lógica de registro do usuário aqui
                String name = _nameController.text;
                // Exemplo de ação: printar o nome no console
                print('Nome do usuário: $name');
                // Navegar para outra tela ou mostrar uma mensagem de sucesso
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Usuário registrado com sucesso!')),
                );
              },
              child: Text('Finalizar'),
            ),
          ],
        ),
      ),
    );
  }
}
