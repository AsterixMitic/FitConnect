import 'user.dart';

abstract class Activity {
  int caloriesBurned(User u);
  int getQuantity();
}

class Cycling extends Activity {
  int quantity;
  String unit = "minut";
  int intensity;

  Cycling({required this.quantity, required this.intensity});

  @override
  int caloriesBurned(User u) {
    int MET;
    switch (intensity) {
      case 1:
        MET = 6;
        break;
      case 2:
        MET = 11;
        break;
      case 3:
        MET = 16;
        break;
      default:
        MET = 11;
        break;
    }
    return MET * u.weight * quantity ~/ 60;
  }

  @override
  int getQuantity() {
    return quantity;
  }
}

class Walking extends Activity {
  int quantity;
  String unit = "minut";
  Walking({required this.quantity});
  @override
  int caloriesBurned(User u) {
    return 4.5 * u.weight * quantity ~/ 60;
  }

  @override
  int getQuantity() {
    return quantity;
  }
}

class Swiming extends Activity {
  int quantity;
  String unit = "minut";
  int intensity;

  Swiming({required this.quantity, required this.intensity});

  @override
  int caloriesBurned(User u) {
    int MET;
    switch (intensity) {
      case 1:
        MET = 6;
        break;
      case 2:
        MET = 9;
        break;
      case 3:
        MET = 13;
        break;
      default:
        MET = 9;
        break;
    }
    return MET * u.weight * quantity ~/ 60 ~/ 24;
  }

  @override
  int getQuantity() {
    return quantity;
  }
}

class Running extends Activity {
  int quantity;
  String unit = "meter";
  int intensity;

  Running({required this.quantity, required this.intensity});

  @override
  int caloriesBurned(User u) {
    int MET;
    switch (intensity) {
      case 1:
        MET = 7;
        break;
      case 2:
        MET = 12;
        break;
      case 3:
        MET = 16;
        break;
      default:
        MET = 12;
        break;
    }
    return MET * u.weight * quantity ~/ 1000;
  }

  @override
  int getQuantity() {
    return quantity;
  }
}

//class PushUps()

class Progress {
  int level = 1;
  List<ComplitedChallange> challanges = [];

  Progress();
}

class ComplitedChallange {
  Activity activity;
  DateTime date = DateTime.now();
  String slika;

  ComplitedChallange({required this.activity, required this.slika});
}
