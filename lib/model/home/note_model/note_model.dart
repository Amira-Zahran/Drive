class NoteDetails {
  String name = "";
  String description = "";
  int id = -1;
  NoteDetails();

  NoteDetails.fromDbMap(Map<String, dynamic> map) {
    name = map['title'];
    description = map['description'];
    id = map['id'];
  }

}
