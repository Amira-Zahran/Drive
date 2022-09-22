class SectionModel {
  String? code;
  String? message;
  List<Data>? data;

  SectionModel({this.code, this.message, this.data});

  SectionModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  String? sectionSubject;
  String? sectionDate;
  String? sectionStartTime;
  String? sectionEndTime;

  Data(
      {this.id,
        this.sectionSubject,
        this.sectionDate,
        this.sectionStartTime,
        this.sectionEndTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionSubject = json['sectionSubject'];
    sectionDate = json['sectionDate'];
    sectionStartTime = json['sectionStartTime'];
    sectionEndTime = json['sectionEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['sectionSubject'] = sectionSubject;
    data['sectionDate'] = sectionDate;
    data['sectionStartTime'] = sectionStartTime;
    data['sectionEndTime'] = sectionEndTime;
    return data;
  }
}