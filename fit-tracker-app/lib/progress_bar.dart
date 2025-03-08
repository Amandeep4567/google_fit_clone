import 'package:flutter/material.dart';
import './services/api_services.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() {
    return _ProgressBarState();
  }
}

class _ProgressBarState extends State<ProgressBar> {
  final TextEditingController stepsController = TextEditingController();
  final TextEditingController heartController = TextEditingController();

  double stepsProgress = 0.0;
  double heartProgress = 0.0;
  int totalSteps = 0;
  int totalHeartPoints = 0;

  Future<void> updateProgress() async {
    int newSteps = int.tryParse(stepsController.text) ?? 0;
    int newHeartPoints = int.tryParse(heartController.text) ?? 0;

    var data = await ApiService.updateProgress(newSteps, newHeartPoints);
    print("API Response: $data");

    setState(() {
      totalSteps = data["steps"] ?? 0;
      totalHeartPoints = data["heartPoints"] ?? 0;
      stepsProgress = (totalSteps / 100).clamp(0.0, 1.0);
      heartProgress = (totalHeartPoints / 100).clamp(0.0, 1.0);
      print("Updated UI -> Steps: $totalSteps, HeartPoints: $totalHeartPoints");
    });
  }

  @override
  Widget build(context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          Stack(
            alignment: Alignment.center,
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: heartProgress),
                duration: const Duration(milliseconds: 500),
                builder: (context, double value, _) {
                  return SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.green,
                      ),
                    ),
                  );
                },
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: stepsProgress),
                duration: const Duration(milliseconds: 500),
                builder: (context, double value, _) {
                  return SizedBox(
                    width: 170,
                    height: 170,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.blue,
                      ),
                    ),
                  );
                },
              ),
              Column(
                children: [
                  Text(
                    "$totalHeartPoints",
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$totalSteps",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Expanded(
          //         child: Row(
          //           children: [
          //             const Icon(
          //               Icons.directions_walk,
          //               color: Colors.blue,
          //               size: 30,
          //             ),
          //             const SizedBox(width: 10),
          //             Expanded(
          //               child: TextField(
          //                 controller: stepsController,
          //                 keyboardType: TextInputType.number,
          //                 decoration: const InputDecoration(
          //                   labelText: "Steps",
          //                   border: OutlineInputBorder(),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(width: 20),
          //       Expanded(
          //         child: Row(
          //           children: [
          //             const Icon(Icons.favorite, color: Colors.red, size: 30),
          //             const SizedBox(width: 10),
          //             Expanded(
          //               child: TextField(
          //                 controller: heartController,
          //                 keyboardType: TextInputType.number,
          //                 decoration: const InputDecoration(
          //                   labelText: "Heart Points",
          //                   border: OutlineInputBorder(),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // const SizedBox(height: 20),
          ElevatedButton(
            onPressed: updateProgress,
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }
}
