class NewsModel {
  String? code;
  String? message;
  List<Data>? data;

  NewsModel({this.code, this.message, this.data});

  NewsModel.fromJson(Map<String, dynamic> json) {
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
  String? date;
  String? body;
  String? imageUrl;
  String? linkUrl;
  String? title;

  Data(
      {this.id, this.date, this.body, this.imageUrl, this.linkUrl, this.title});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    body = json['body'];
    imageUrl = json['imageUrl'];
    linkUrl = json['linkUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['date'] = date;
    data['body'] = body;
    data['imageUrl'] = imageUrl;
    data['linkUrl'] = linkUrl;
    data['title'] = title;
    return data;
  }
}