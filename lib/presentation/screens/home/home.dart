import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('This is a Menu')));
          },
          icon: const Icon(Icons.menu),
        ),
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text('ZDM', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: const Center(child: Text('Home')),
    );
  }
}
