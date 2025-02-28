//Створити симулятор ресторану, який відображатиме його рейтинг,
// який буде прив'язаний до різних подій, що відбуваються щодня.
// Наприклад:
//
// Day One: Opening, rating 4.0
// Day Two: Unsuccessful Service, rating 3.6
// і так далі.
//
// Використовуй одну змінну для зберігання і відображення рейтингу.

import 'dart:math';

void main() {
  double rating = 4.0;
  List<String> days = ['Day One', 'Day Two', 'Day Three', 'Day Four', 'Day Five'];
  List<String> events = [
    'Opening',
    'Successful Service',
    'Unsuccessful Service',
    'Average Day',
    'Special Event',
  ];
  Random random = Random();

  for (String day in days) {
    String event = events[random.nextInt(events.length)];
    double ratingChange = calculateRatingChange(event, random);
    rating += ratingChange;
    rating = rating.clamp(0.0, 5.0);

    print('$day: $event, rating ${rating.toStringAsFixed(1)}');
  }
}

double calculateRatingChange(String event, Random random) {
  switch (event) {
    case 'Opening':
      return random.nextDouble() * 1.0;
    case 'Successful Service':
      return random.nextDouble() * 0.5;
    case 'Unsuccessful Service':
      return -random.nextDouble() * 1.0;
    case 'Average Day':
      return (random.nextDouble() - 0.5) * 0.2;
    case 'Special Event':
      return random.nextDouble() * 1.5;
    default:
      return 0.0;
  }
}