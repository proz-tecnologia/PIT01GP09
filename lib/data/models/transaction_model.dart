import 'dart:convert';

class TransactionModel {
  TransactionModel({
    this.id,
    required this.description,
    required this.category,
    required this.type,
    required this.value,
    required this.date,
  });

  String? id;
  final String description;
  final String category;
  final String type;
  final double value;
  final DateTime date;

  TransactionModel copyWith({
    String? id,
    String? description,
    String? category,
    String? type,
    double? value,
    DateTime? date,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        description: description ?? this.description,
        category: category ?? this.category,
        type: type ?? this.type,
        value: value ?? this.value,
        date: date ?? this.date,
      );

  factory TransactionModel.fromJson(String str) =>
      TransactionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromMap(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["_id"],
        description: json["description"],
        category: json["category"],
        type: json["type"],
        value: json["value"],
        date: json["date"] ?? DateTime.now(),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "description": description,
        "category": category,
        "type": type,
        "value": value,
        "date": date,
      };

  @override
  String toString() {
    return 'TransactionModel(id: $id, description: $description, category: $category, type: $type, value: $value, date: $date)';
  }
}
