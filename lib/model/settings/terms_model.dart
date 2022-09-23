class TermsModel {
  String? code;
  Data? data;

  TermsModel({this.code, this.data});

  TermsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? terms;

  Data({this.terms});

  Data.fromJson(Map<String, dynamic> json) {
    terms = json['Terms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Terms'] = terms;
    return data;
  }
}