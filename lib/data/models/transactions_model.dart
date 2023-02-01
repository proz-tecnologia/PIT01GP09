class TransactionsModel {
  TransactionsModel({
    this.id,
    required this.description,
    required this.category,
    required this.type,
    required this.value,
    required this.date,
    required this.userId,
  });

  String? id;
  final String description;
  final String category;
  final String type;
  final double value;
  final DateTime date;
  final String userId;

  bool isAtMonthYear(int month, int year) {
    return (date.month == month) && (date.year == year);
  }

  TransactionsModel.empty(
      {this.id,
      this.description = '',
      this.category = '',
      this.type = '',
      this.value = 0.0,
      this.userId = '',
      date})
      : date = (date ?? DateTime.now());

  TransactionsModel copyWith({
    String? id,
    String? description,
    String? category,
    String? type,
    double? value,
    DateTime? date,
    String? userId,
  }) =>
      TransactionsModel(
        id: id ?? this.id,
        description: description ?? this.description,
        category: category ?? this.category,
        type: type ?? this.type,
        value: value ?? this.value,
        date: date ?? this.date,
        userId: userId ?? this.userId,
      );

  factory TransactionsModel.fromMap(String id, Map<String, dynamic> json) =>
      TransactionsModel(
        id: json["id"],
        description: json["description"],
        category: json["category"],
        type: json["type"],
        value: json["value"] ?? 0.0,
        date: DateTime.fromMillisecondsSinceEpoch(json["date"] as int),
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "category": category,
        "type": type,
        "value": value,
        "date": date.millisecondsSinceEpoch,
        "userId": userId,
      };

  @override
  String toString() {
    return 'TransactionsModel(id: $id, description: $description, category: $category, type: $type, value: $value, date: $date, userId: $userId)';
  }
}
