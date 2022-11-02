class ApgModel {
  String? message;
  List<Data>? data;

  ApgModel({this.message, this.data});

  ApgModel.fromJson(Map<String, dynamic> json) {
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
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? idApgAi;
  String? alokasi;
  String? agendaItem;
  String? dokumen;
  String? namaDokumen;
  String? sourceDokumen;
  String? summaryDokumen;
  String? respon;
  String? tanggalDokumen;
  String? picStakeholder;
  String? picKominfo;
  String? file;
  String? user;
  String? waktuInput;

  Data(
      {this.idApgAi,
      this.alokasi,
      this.agendaItem,
      this.dokumen,
      this.namaDokumen,
      this.sourceDokumen,
      this.summaryDokumen,
      this.respon,
      this.tanggalDokumen,
      this.picStakeholder,
      this.picKominfo,
      this.file,
      this.user,
      this.waktuInput});

  Data.fromJson(Map<String, dynamic> json) {
    idApgAi = json['id_apg_ai'];
    alokasi = json['alokasi'];
    agendaItem = json['agenda_item'];
    dokumen = json['dokumen'];
    namaDokumen = json['nama_dokumen'];
    sourceDokumen = json['source_dokumen'];
    summaryDokumen = json['summary_dokumen'];
    respon = json['respon'];
    tanggalDokumen = json['tanggal_dokumen'];
    picStakeholder = json['pic_stakeholder'];
    picKominfo = json['pic_kominfo'];
    file = json['file'];
    user = json['user'];
    waktuInput = json['waktu_input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_apg_ai'] = idApgAi;
    data['alokasi'] = alokasi;
    data['agenda_item'] = agendaItem;
    data['dokumen'] = dokumen;
    data['nama_dokumen'] = namaDokumen;
    data['source_dokumen'] = sourceDokumen;
    data['summary_dokumen'] = summaryDokumen;
    data['respon'] = respon;
    data['tanggal_dokumen'] = tanggalDokumen;
    data['pic_stakeholder'] = picStakeholder;
    data['pic_kominfo'] = picKominfo;
    data['file'] = file;
    data['user'] = user;
    data['waktu_input'] = waktuInput;
    return data;
  }
}
