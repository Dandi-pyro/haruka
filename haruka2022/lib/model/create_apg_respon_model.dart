class CreateApgResponModel {
  String? message;
  Data? data;

  CreateApgResponModel({this.message, this.data});

  CreateApgResponModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? idApg;
  String? alokasi;
  String? agendaItem;
  String? judulAi;
  String? dokumen;
  String? negara;
  String? respon;
  String? note;
  String? user;

  Data(
      {this.idApg,
      this.alokasi,
      this.agendaItem,
      this.judulAi,
      this.dokumen,
      this.negara,
      this.respon,
      this.note,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    idApg = json['id_apg'];
    alokasi = json['alokasi'];
    agendaItem = json['agenda_item'];
    judulAi = json['judul_ai'];
    dokumen = json['dokumen'];
    negara = json['negara'];
    respon = json['respon'];
    note = json['note'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_apg'] = idApg;
    data['alokasi'] = alokasi;
    data['agenda_item'] = agendaItem;
    data['judul_ai'] = judulAi;
    data['dokumen'] = dokumen;
    data['negara'] = negara;
    data['respon'] = respon;
    data['note'] = note;
    data['user'] = user;
    return data;
  }
}
