/*
modelo para la lista de encuestas, para pasarla a la base SQL
*/
class DraftSurveysListModel {
  final int id;
  final String title;
  final String date;
  final String categorie;

  DraftSurveysListModel({
    required this.id,
    required this.title,
    required this.date,
    required this.categorie,
  });

  factory DraftSurveysListModel.fromJson(Map<String, dynamic> json) {
    return DraftSurveysListModel(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      categorie: json['categorie'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'categorie': categorie,
      };
}
