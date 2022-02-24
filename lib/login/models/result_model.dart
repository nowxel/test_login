class ResultModel {
  final String name;
  final String surname;

  ResultModel({required this.name, required this.surname});

  factory ResultModel.fromJSON(dynamic jsonMap) {
    return ResultModel(
      name: jsonMap["name"],
      surname: jsonMap["surname"],
    );
  }

  @override
  String toString() {
    return "$name, $surname";
  }
}
