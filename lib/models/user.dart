class Client {
  String email;
  String? name, lastname;
  int points;
  int height, weight;
  String? picture;

  Client(
      {required this.email,
      this.name,
      this.lastname,
      this.height = 0,
      this.weight = 0,
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
