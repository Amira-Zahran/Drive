class FinalsModel {
  String? code;
  String? message;
  List<Data>? data;

  FinalsModel({this.code, this.message, this.data});

  FinalsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) { data!.add(Data.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? examSubject;
  String? examDate;
  String? examStartTime;
  String? examEndTime;
  bool? finals;


  Data({this.id, this.examSubject, this.examDate, this.examStartTime, this.examEndTime, this.finals});

  Data.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  examSubject = json['examSubject'];
  examDate = json['examDate'];
  examStartTime = json['examStartTime'];
  examEndTime = json['examEndTime'];
  finals = json['final'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = id;
  data['examSubject'] = examSubject;
  data['examDate'] = examDate;
  data['examStartTime'] = examStartTime;
  data['examEndTime'] = examEndTime;
  data['final'] = finals;
  return data;
  }
}