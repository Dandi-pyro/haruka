class DeleteDbHarModel {
  String? message;
  Null? data;

  DeleteDbHarModel({this.message, this.data});

  DeleteDbHarModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
