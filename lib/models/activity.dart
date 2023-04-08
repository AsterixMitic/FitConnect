import 'user.dart';

abstract class Activity {
  int caloriesBurned(Client u);
  int getQuantity();
}

class Cycling extends Activity {
  int quantity;
  static String unit = "minute";
  static int baseQuantity = 30;
  int intensity;

  Cycling({required this.quantity, required this.intensity});

  @override
  int caloriesBurned(Client u) {
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
  static String unit = "minute";
  static int baseQuantity = 30;
  Walking({required this.quantity});
  @override
  int caloriesBurned(Client u) {
    return 4.5 * u.weight * quantity ~/ 60;
  }

  @override
  int getQuantity() {
    return quantity;
  }
}

class Swiming extends Activity {
  int quantity;
  static String unit = "minute";
  static int baseQuantity = 30;
  int intensity;

  Swiming({required this.quantity, required this.intensity});

  @override
  int caloriesBurned(Client u) {
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
  static String unit = "meter";
  static int baseQuantity = 300;
  int intensity;

  Running({required this.quantity, required this.intensity});

  @override
  int caloriesBurned(Client u) {
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

  void addChalange(ComplitedChallange c) {
    level++;
    challanges.add(c);
  }
}

class Challange {
  static double increment = 0.05;

  static String generateChalange(Progress p, Activity a) {
    int baseQuantity = 1;
    String unit = "";
    if (a is Running) {
      baseQuantity = Running.baseQuantity;
      unit = Running.unit;
    }
    if (a is Walking) {
      baseQuantity = Walking.baseQuantity;
      unit = Walking.unit;
    }
    if (a is Cycling) {
      baseQuantity = Cycling.baseQuantity;
      unit = Cycling.unit;
    }
    if (a is Swiming) {
      baseQuantity = Swiming.baseQuantity;
      unit = Swiming.unit;
    }

    int n = 1;
    for (int i = p.challanges.length - 1; i >= 0; i++) {
      if (p.challanges[i].activity.runtimeType == a.runtimeType) n++;
    }
    int r = (baseQuantity + n * baseQuantity * (increment + 1)) ~/ 1;
    return "Try $r $unit";
  }
}

class ComplitedChallange {
  Activity activity;
  DateTime date;
  String slika;

  ComplitedChallange(
      {required this.activity, required this.slika, required this.date});
}
