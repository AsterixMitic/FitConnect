import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'user.dart';

class Activity {
  int intensity;
  int quantity;

  Activity({required this.intensity, required this.quantity});

  int caloriesBurned(Client u) {
    return 0;
  }

  Map<String, dynamic> toMap() {
    return {"quantity": quantity, "intensity": intensity};
  }

  static Activity fromMap(Map<String, dynamic> val) {
    switch (val['type']) {
      case 'cycle':
        return Cycling(intensity: val['intensity'], quantity: val['quantity']);
        break;
      case 'walk':
        return Walking(intensity: val['intensity'], quantity: val['quantity']);
        break;
      case 'swim':
        return Swiming(intensity: val['intensity'], quantity: val['quantity']);
        break;
      case 'run':
        return Running(intensity: val['intensity'], quantity: val['quantity']);
        break;
      default:
        return Activity(intensity: val['intensity'], quantity: val['quantity']);
        break;
    }
  }
}

class Cycling extends Activity {
  static String unit = "minute";
  static int baseQuantity = 30;

  Cycling({required super.intensity, required super.quantity});

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
  Map<String, dynamic> toMap() {
    return {"type": "cycle", "quantity": quantity, "intensity": intensity};
  }
}

class Walking extends Activity {
  static String unit = "minute";
  static int baseQuantity = 30;

  Walking({required super.intensity, required super.quantity});

  @override
  int caloriesBurned(Client u) {
    int MET;
    switch (intensity) {
      case 1:
        MET = 2;
        break;
      case 2:
        MET = 4;
        break;
      case 3:
        MET = 6;
        break;
      default:
        MET = 4;
        break;
    }
    return MET * u.weight * quantity ~/ 60;
  }

  @override
  Map<String, dynamic> toMap() {
    return {"type": "walk", "quantity": quantity, "intensity": intensity};
  }
}

class Swiming extends Activity {
  static String unit = "minute";
  static int baseQuantity = 30;

  Swiming({required super.intensity, required super.quantity});

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
  Map<String, dynamic> toMap() {
    return {"type": "swim", "quantity": quantity, "intensity": intensity};
  }
}

class Running extends Activity {
  static String unit = "meter";
  static int baseQuantity = 300;

  Running({required super.intensity, required super.quantity});

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
  Map<String, dynamic> toMap() {
    return {"type": "run", "quantity": quantity, "intensity": intensity};
  }
}

//class PushUps()

class Progress {
  int level = 1;
  List<ComplitedChallange> challanges = [];
  List<String> izabrani = [];

  Progress(List<ComplitedChallange> list, List<String> izabrani) {
    challanges = list;
    level = list.length + 1;
    this.izabrani = izabrani;
  }

  void addChallange(ComplitedChallange c) {
    level++;
    challanges.add(c);
  }
}

class Challange {
  int quantity;
  Challange({required this.quantity});

  static double increment = 0.05;

  static String generateChalange(Progress p, int k) {
    Activity a = Activity.fromMap({
      'type': p.izabrani[k % p.izabrani.length],
      'intensity': 0,
      'quantity': 0
    });

    int baseQuantity = 1;
    String unit = "";
    String task = "";
    if (a is Running) {
      baseQuantity = Running.baseQuantity;
      unit = Running.unit;
      task = "run";
    }
    if (a is Walking) {
      baseQuantity = Walking.baseQuantity;
      unit = Walking.unit;
      task = "walk";
    }
    if (a is Cycling) {
      baseQuantity = Cycling.baseQuantity;
      unit = Cycling.unit;
      task = "cycle";
    }
    if (a is Swiming) {
      baseQuantity = Swiming.baseQuantity;
      unit = Swiming.unit;
      task = "swim";
    }

    int n = k ~/
        p.izabrani
            .length; /*
    for (int i = p.challanges.length - 1; i >= 0; i++) {
      if (p.challanges[i].activity == a) n++;
    }*/
    int r = (baseQuantity + n * baseQuantity * (increment)) ~/ 1;
    return "Chalange is to $task for $r $unit";
  }
}

class ComplitedChallange {
  Activity activity;
  DateTime date;
  String slika;
  String challange;

  ComplitedChallange(
      {required this.activity,
      required this.slika,
      required this.date,
      required this.challange});

  Map<String, dynamic> toMap(String uid) {
    Map<String, dynamic> r = {
      "uid": uid,
      "slika": slika,
      "date": date,
      "challange": challange,
      "activity": activity.toMap()
    };
    return r;
  }
}
