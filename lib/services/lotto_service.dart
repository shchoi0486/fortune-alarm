import 'dart:convert';
import 'package:http/http.dart' as http;

class LottoService {
  static const String _baseUrl = 'https://www.dhlottery.co.kr/common.do?method=getLottoNumber';

  // Calculate the most recent round number based on the current date
  static int getLatestRound() {
    final DateTime baseDate = DateTime(2002, 12, 7); // Round 1 date
    final DateTime now = DateTime.now();
    
    // Calculate difference in days
    final int differenceDays = now.difference(baseDate).inDays;
    
    // Lotto is drawn every 7 days
    // Add 1 because it started at round 1
    return (differenceDays / 7).floor() + 1;
  }

  // Fetch data for a specific round
  static Future<Map<String, dynamic>?> fetchLottoData(int round) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl&drwNo=$round'));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['returnValue'] == 'success') {
          return data;
        }
      }
    } catch (e) {
      print('Error fetching lotto data for round $round: $e');
    }
    return null;
  }

  // Fetch recent N rounds and analyze frequency
  static Future<Map<int, int>> analyzeRecentRounds(int count) async {
    final int latestRound = getLatestRound();
    // Start from the latest completed round (yesterday or earlier to be safe, though API usually updates quickly)
    // To be safe, we can try fetching latestRound. If it fails (not drawn yet), we fall back.
    // For simplicity, we'll request latestRound down to latestRound - count.
    
    final List<Future<Map<String, dynamic>?>> futures = [];
    
    // Use a small offset if today is Saturday (draw day) and it's before draw time (20:35), 
    // but the API handles non-existing rounds gracefully usually (or we just get fail).
    // Let's just try the calculated latest round.
    
    for (int i = 0; i < count; i++) {
      futures.add(fetchLottoData(latestRound - i));
    }

    final List<Map<String, dynamic>?> results = await Future.wait(futures);
    
    final Map<int, int> frequencyMap = {};
    // Initialize map
    for (int i = 1; i <= 45; i++) {
      frequencyMap[i] = 0;
    }

    for (var data in results) {
      if (data != null) {
        for (int i = 1; i <= 6; i++) {
          final int number = data['drwtNo$i'];
          frequencyMap[number] = (frequencyMap[number] ?? 0) + 1;
        }
        // Bonus number analysis can be separate or included. 
        // Usually "hot numbers" refer to main numbers. We'll stick to main numbers for weight.
      }
    }

    return frequencyMap;
  }
}
