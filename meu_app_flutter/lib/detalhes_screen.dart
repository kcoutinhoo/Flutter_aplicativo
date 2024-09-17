import 'package:flutter/material.dart';

class DetalhesScreen extends StatelessWidget {
  final String nome;
  final String email;
  final String genero;

  DetalhesScreen({required this.nome, required this.email, required this.genero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Nome: $nome', style: TextStyle(fontSize: 18)),
            Text('Email: $email', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Image.asset(
              genero == 'Masculino' ? 'assets/homem.png' : 'assets/mulher.png',
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
