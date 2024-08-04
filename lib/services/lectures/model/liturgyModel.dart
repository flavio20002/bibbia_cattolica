import 'dart:convert';

import 'package:bibbia_cattolica/services/lectures/enum/liturgyCategory.dart';

class LiturgyModel {
  final LiturgyEnum category;
  final int number;
  final int dayOfWeek;
  final bool isFeast;
  LiturgyModel({this.category, this.number, this.dayOfWeek, this.isFeast});
  bool operator ==(o) =>
      o is LiturgyModel &&
      category == o.category &&
      number == o.number &&
      dayOfWeek == o.dayOfWeek &&
      isFeast == o.isFeast;
  int get hashCode =>
      category.hashCode +
      number.hashCode +
      dayOfWeek.hashCode +
      isFeast.hashCode;

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(this.toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category.toString(),
      'number': number,
      'dayOfWeek': dayOfWeek,
      'isFeast': isFeast
    };
  }
}
