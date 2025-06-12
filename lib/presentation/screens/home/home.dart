import 'package:flutter/material.dart';
import 'package:zdm/presentation/widgets/common/download_progress_card_example.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZDM'),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('This is a Menu')));
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: const DownloadProgressCardExample(),
    );
  }
}
