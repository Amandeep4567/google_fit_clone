import 'package:fit_app/bottom_navbar.dart';
import 'package:fit_app/sync_card.dart';
import 'package:flutter/material.dart';
import './progress_bar.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              ProgressBar(),
              const SizedBox(height: 10),
              SyncCard(),
              SizedBox(height: 20),
              SyncCard(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavbar(),
      ),
    );
  }
}
