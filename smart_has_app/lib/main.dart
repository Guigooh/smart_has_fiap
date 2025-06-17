import 'package:flutter/material.dart';

void main() {
  runApp(SmartHASApp());
}

class SmartHASApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart HAS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 18),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/painel': (context) => PainelFinanceiroScreen(),
        '/mapa': (context) => MapaScreen(),
        '/votacao': (context) => VotacaoDAOScreen(),
      },
    );
  }
}

AppBar buildAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ),
    centerTitle: true,
    backgroundColor: Colors.indigo,

    elevation: 4,
  );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Notificação: Você recebeu um novo benefício!'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.indigo,
        ),
      );
    });

    return Scaffold(
      appBar: buildAppBar('Smart HAS Home'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildHomeButton(
                context,
                icon: Icons.account_balance_wallet,
                label: 'Painel Financeiro',
                route: '/painel',
              ),
              SizedBox(height: 20),
              buildHomeButton(
                context,
                icon: Icons.map,
                label: 'Mapa',
                route: '/mapa',
              ),
              SizedBox(height: 20),
              buildHomeButton(
                context,
                icon: Icons.how_to_vote,
                label: 'Votação DAO',
                route: '/votacao',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHomeButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String route,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 28),
        label: Text(label),
        onPressed: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}

class PainelFinanceiroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Painel Financeiro'),
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Saldo: 100 tokens',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MapaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Mapa'),
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.indigo[50],
            ),
            child: Icon(Icons.map, size: 100, color: Colors.indigo),
          ),
        ),
      ),
    );
  }
}

class VotacaoDAOScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Votação DAO'),
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Propostas de votação aqui',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
