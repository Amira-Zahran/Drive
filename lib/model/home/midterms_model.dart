class MidtermsModel {
  String? code;
  String? message;
  List<Data>? data;

  MidtermsModel({this.code, this.message, this.data});

  MidtermsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
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
  String? examDate;
  String? examStartTime;
  String? examEndTime;
  String? examSubject;
  String? examGrade;

  Data(
      {this.id,
        this.examDate,
        this.examStartTime,
        this.examEndTime,
        this.examSubject,
        this.examGrade});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examDate = json['examDate'];
    examStartTime = json['examStartTime'];
    examEndTime = json['examEndTime'];
    examSubject = json['examSubject'];
    examGrade = json['examGrade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['examDate'] = examDate;
    data['examStartTime'] = examStartTime;
    data['examEndTime'] = examEndTime;
    data['examSubject'] = examSubject;
    data['examGrade'] = examGrade;
    return data;
  }
}