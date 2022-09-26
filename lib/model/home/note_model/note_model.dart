class Notes {
  String name = "";
  String description = "";
  int id = -1;
  Notes();

  Notes.fromDbMap(Map<String, dynamic> map) {
    name = map['title'];
    description = map['description'];
    id = map['id'];
  }

}
