import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  Future<List<Map<String, dynamic>>> getMatches() async {
    DataSnapshot snapshot =
        (await _database.child('matches').once()) as DataSnapshot;
    List<Map<String, dynamic>> matches = [];

    if (snapshot.value != null) {
      snapshot.value.forEach((key, value) {
        matches.add(value);
      });
    }

    return matches;
  }
}
