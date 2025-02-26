void main() {
  String firstName = "Sviatoslav";
  String lastName = "Tataryn";
  int age = 27;
  double temperature = 36.6;
  bool lovesCoding = true;

  var variable = lastName..contains('T')..contains('m');

  print(variable);
  print("name: $firstName");
  print("last name: $lastName");
  print("age: $age");
  print("temperature body: $temperature");
  print("or like i programing: $lovesCoding");
}