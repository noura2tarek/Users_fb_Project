class User {
  final String? name;
  final String? age;
  final String? hobby;

  User({this.name, this.age, this.hobby});

  // Convert a map to an user object
  factory User.fromFirestore(
    Map<String, dynamic> data,
  ) {
    return User(
      name: data['name'],
      age: data['age'],
      hobby: data['favourite hobby'],
    );
  }

  // Convert an user object to a map
  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (age != null) "age": age,
      if (hobby != null) "favourite hobby": hobby,
    };
  }
}
