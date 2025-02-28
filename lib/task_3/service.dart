import 'dart:math';
import 'package:dart_study/task_3/repository.dart';
import 'model.dart';

class TimeTravelSimulator {
  Map<int, TimeEvent> timeEvents = {};
  List<Discovery> discoveries = [];

  int currentYear = 2024;
  final int homeYear = 2024;
  List<int> visitedYears = [2024];
  List<Discovery> foundDiscoveries = [];
  final String EVENT_DATA_PATH = 'lib/task_3/event_data.json';
  final String DISCOVERY_DATA_PATH = 'lib/task_3/discovery_data.json';

  final Random random = Random();

  Future<void> initialize() async {
    try {
      timeEvents = await DataLoader.loadTimeEvents(EVENT_DATA_PATH);
      discoveries = await DataLoader.loadDiscoveries(DISCOVERY_DATA_PATH);
    } catch (e) {
      print("Помилка при ініціалізації: $e");
    }
  }

  void timeJump() {
    if (timeEvents.isEmpty) {
      print("Немає доступних часових точок для подорожі!");
      return;
    }

    List<int> availableYears = timeEvents.keys.toList();

    int newYear;
    do {
      newYear = availableYears[random.nextInt(availableYears.length)];
    } while (newYear == currentYear);

    currentYear = newYear;
    visitedYears.add(newYear);

    if (discoveries.isNotEmpty) {
      Discovery discovery = discoveries[random.nextInt(discoveries.length)];
      foundDiscoveries.add(discovery);
      print("📌 ВІДКРИТТЯ: ${discovery.title}");
      print("   ${discovery.description}");
    }
  }

  void returnHome() {
    currentYear = homeYear;
    print("Повернення в $homeYear рік...");
  }

  void displayStatus() {
    String yearStr =
        currentYear < 0 ? "${currentYear.abs()} до н.е." : "$currentYear н.е.";

    print("\n===== РІК: $yearStr =====");

    if (timeEvents.containsKey(currentYear)) {
      TimeEvent event = timeEvents[currentYear]!;
      print("📜 ${event.title}");
      print("📖 ${event.description}");

      if (currentYear % 100 == 0) {
        print("🚀 ПОЧАТОК: ${event.initiation}");
      } else {
        print("⏩ РОЗВИТОК: ${event.continuation}");
      }
    } else {
      print("Події сьогодення вам відомі");
    }

    print("===========================");
  }

  void showSummary() {
    print("\n====== ПІДСУМОК ПОДОРОЖІ ======");
    print("Відвідано ${visitedYears.length} різних часових періодів");
    print("Зроблено ${foundDiscoveries.length} відкриттів");

    if (foundDiscoveries.isNotEmpty) {
      print("\nСписок відкриттів:");
      for (int i = 0; i < foundDiscoveries.length; i++) {
        print("${i + 1}. ${foundDiscoveries[i].title}");
      }
    }

    print("===============================");
  }
}
