class User {
  String email;
  String? name, lastname;
  int points;
  int height, weight;
  String? picture;

  User(
      {required this.email,
      this.name,
      this.lastname,
      this.height = 170,
      this.weight = 70,
      this.picture,
      this.points = 0});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "lastname": lastname,
      "email": email,
      "height": height,
      "weight": weight,
      "picture": picture,
      "points": points,
    };
  }
}
