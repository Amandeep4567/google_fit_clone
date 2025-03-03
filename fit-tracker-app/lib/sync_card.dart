import 'package:flutter/material.dart';

class SyncCard extends StatelessWidget {
  const SyncCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 251, 252, 252),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.sync, color: Colors.blue),
              title: Text(
                'Sync Fit With Health Connect',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                'Share stats between Fit and your other apps, like you calories, heart rate and body mesurements.',
                style: TextStyle(color: Colors.black38),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Get Started",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
