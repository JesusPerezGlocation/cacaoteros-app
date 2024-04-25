import 'package:flutter/material.dart';

/*
modelo para la lista de encuestas, para pasarla a la base SQL
*/
class DraftSurveysListModel {
  final String id;
  final String title;
  final String date;
  final Color colors;
  final String categorie;

  DraftSurveysListModel({
    required this.id,
    required this.title,
    required this.date,
    required this.colors,
    required this.categorie,
  });

  factory DraftSurveysListModel.fromJson(Map<String, dynamic> json) {
    return DraftSurveysListModel(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      colors: Color(json['colors']),
      categorie: json['categorie'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'colors': colors.value,
        'categorie': categorie,
      };
}
