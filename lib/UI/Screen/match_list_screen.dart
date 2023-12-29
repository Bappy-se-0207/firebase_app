import 'package:flutter/material.dart';

import '../../Models/firebase_service.dart';
import 'match_details_screen.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  _MatchListScreenState createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  late List<Map<String, dynamic>> _matches;

  @override
  void initState() {
    super.initState();
    _loadMatches();
  }

  Future<void> _loadMatches() async {
    List<Map<String, dynamic>> matches = await _firebaseService.getMatches();
    setState(() {
      _matches = matches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
      ),
      body: _matches == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _matches.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> matchData = _matches[index];
                return ListTile(
                  title: Text('${matchData['team1']} vs ${matchData['team2']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MatchDetailsScreen(matchData: matchData),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
