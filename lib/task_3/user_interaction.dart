import 'dart:io';
import 'service.dart';

class TimeTravelGame {
  final TimeTravelSimulator simulator = TimeTravelSimulator();

  Future<void> start() async {
    print("\n🕰️  СИМУЛЯТОР ПОДОРОЖІ В ЧАСІ  🕰️");
    print("==================================");
    print("Ласкаво просимо, мандрівнику!");

    await simulator.initialize();

    simulator.displayStatus();

    bool continueGame = true;

    while (continueGame) {
      print("\nЩо бажаєте зробити?");
      print("1. Стрибок у часі");
      print("2. Повернутися додому");
      print("3. Показати поточний статус");
      print("4. Показати підсумок подорожі");
      print("5. Вийти");

      stdout.write("Ваш вибір (1-5): ");
      String? choice = stdin.readLineSync();

      switch (choice) {
        case "1":
          print("\n⏳ Активація машини часу...");
          await Future.delayed(Duration(milliseconds: 800));
          simulator.timeJump();
          simulator.displayStatus();
          break;

        case "2":
          print("\n🏠 Повернення додому...");
          await Future.delayed(Duration(milliseconds: 500));
          simulator.returnHome();
          simulator.displayStatus();
          break;

        case "3":
          simulator.displayStatus();
          break;

        case "4":
          simulator.showSummary();
          break;

        case "5":
          continueGame = false;
          print("Дякуємо за використання симулятора подорожі в часі!");
          break;

        default:
          print("Невідома команда. Спробуйте ще раз.");
      }
    }
  }
}
