class TimeEvent {
  final String title;
  final String description;
  final String initiation;
  final String continuation;

  TimeEvent({
    required this.title,
    required this.description,
    required this.initiation,
    required this.continuation,
  });

  factory TimeEvent.fromJson(Map<String, dynamic> json) {
    return TimeEvent(
      title: json['title'],
      description: json['description'],
      initiation: json['initiation'],
      continuation: json['continuation'],
    );
  }
}

class Discovery {
  final String title;
  final String description;

  Discovery({required this.title, required this.description});

  factory Discovery.fromJson(Map<String, dynamic> json) {
    return Discovery(
      title: json['title'],
      description: json['description'] ?? "Немає опису",
    );
  }
}
