import 'dart:convert';
import 'package:http/http.dart' as http;

class LuckyNumberService {
  // External API URL (dhLottery) for analysis data
  static const String _baseUrl = 'https://www.dhlottery.co.kr/common.do?method=getLottoNumber';

  // Calculate the most recent round number based on the current date
  static int getLatestRound() {
    final DateTime baseDate = DateTime(2002, 12, 7); // Round 1 date
    final DateTime now = DateTime.now();
    
    // Calculate difference in days
    final int differenceDays = now.difference(baseDate).inDays;
    
    // Numbers are updated every 7 days
    // Add 1 because it started at round 1
    return (differenceDays / 7).floor() + 1;
  }

  // Fetch data for a specific round
  static Future<Map<String, dynamic>?> fetchAnalysisData(int round) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl&drwNo=$round')
      ).timeout(const Duration(seconds: 2)); // Reduced timeout from 5s to 2s
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['returnValue'] == 'success') {
          return data;
        }
      }
    } catch (e) {
      // Silently fail for individual rounds to avoid cluttering logs
    }
    return null;
  }

  // Fetch recent N rounds and analyze frequency
  static Future<Map<int, int>> analyzeRecentRounds(int count) async {
    final int latestRound = getLatestRound();
    
    // Create frequency map
    final Map<int, int> frequencyMap = {};
    for (int i = 1; i <= 45; i++) {
      frequencyMap[i] = 0;
    }

    // Fetch in smaller batches to avoid being blocked or hitting OS limits
    const int batchSize = 5;
    for (int i = 0; i < count; i += batchSize) {
      final List<Future<Map<String, dynamic>?>> batchFutures = [];
      for (int j = i; j < i + batchSize && j < count; j++) {
        batchFutures.add(fetchAnalysisData(latestRound - j));
      }

      final List<Map<String, dynamic>?> results = await Future.wait(batchFutures);
      
      for (var data in results) {
        if (data != null) {
          for (int k = 1; k <= 6; k++) {
            final dynamic val = data['drwtNo$k'];
            // Handle both string and int from API
            final int? num = int.tryParse(val.toString());
            if (num != null && num >= 1 && num <= 45) {
              frequencyMap[num] = (frequencyMap[num] ?? 0) + 1;
            }
          }
        }
      }
    }

    return frequencyMap;
  }
}
