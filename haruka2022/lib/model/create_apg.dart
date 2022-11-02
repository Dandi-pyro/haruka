class CreateApgModel {
  String? message;
  Data? data;

  CreateApgModel({this.message, this.data});

  CreateApgModel.fromJson(Map<String, dynamic> json) {
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
  String? alokasi;
  String? agendaItem;
  String? dokumen;
  String? namaDokumen;
  String? sourceDokumen;
  String? tanggalDokumen;
  String? user;

  Data(
      {this.alokasi,
      this.agendaItem,
      this.dokumen,
      this.namaDokumen,
      this.sourceDokumen,
      this.tanggalDokumen,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    alokasi = json['alokasi'];
    agendaItem = json['agenda_item'];
    dokumen = json['dokumen'];
    namaDokumen = json['nama_dokumen'];
    sourceDokumen = json['source_dokumen'];
    tanggalDokumen = json['tanggal_dokumen'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alokasi'] = alokasi;
    data['agenda_item'] = agendaItem;
    data['dokumen'] = dokumen;
    data['nama_dokumen'] = namaDokumen;
    data['source_dokumen'] = sourceDokumen;
    data['tanggal_dokumen'] = tanggalDokumen;
    data['user'] = user;
    return data;
  }
}
