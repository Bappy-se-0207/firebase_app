import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> matchData;

  const MatchDetailsScreen({super.key, required this.matchData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${matchData['team1']} vs ${matchData['team2']}'),
          Text('Score: ${matchData['score1']} - ${matchData['score2']}'),
          Text('Total Time: ${matchData['totalTime']}'),
        ],
      ),
    );
  }
}
