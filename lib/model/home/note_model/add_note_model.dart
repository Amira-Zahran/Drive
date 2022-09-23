class NoteData {
  int? id;
  String? date;
  String? title;
  String? description;

  NoteData({this.id, this.description, this.title});

  NoteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    description = json['description'];
    title = json['title'];
  }
}
