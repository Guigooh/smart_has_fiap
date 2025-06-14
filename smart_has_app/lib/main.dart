import 'package:flutter/material.dart';

void main() {
  runApp(SmartHASApp());
}

class SmartHASApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart HAS',
      home: HomeScreen(),
      routes: {
        '/painel': (context) => PainelFinanceiroScreen(),
        '/mapa': (context) => MapaScreen(),
        '/votacao': (context) => VotacaoDAOScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notificação: Você recebeu um novo benefício!')),
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text('Smart HAS Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/painel'),
              child: Text('Painel Financeiro'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/mapa'),
              child: Text('Mapa'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/votacao'),
              child: Text('Votação DAO'),
            ),
          ],
        ),
      ),
    );
  }
}

class PainelFinanceiroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Painel Financeiro')),
      body: Center(child: Text('Saldo: 100 tokens')),
    );
  }
}

class MapaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mapa')),
      body: Center(child: Text('Aqui vai o mapa')),
    );
  }
}

class VotacaoDAOScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Votação DAO')),
      body: Center(child: Text('Propostas de votação aqui')),
    );
  }
}
