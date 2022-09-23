class CreateDbHarModel {
  String? message;
  Data? data;

  CreateDbHarModel({this.message, this.data});

  CreateDbHarModel.fromJson(Map<String, dynamic> json) {
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
  String? minFrekuensi;
  String? maxFrekuensi;
  String? bandwidth;
  String? band;
  String? jenisBand;
  String? wp;
  String? techWorld;
  String? techIndonesia;
  String? license;
  String? assignment;
  String? document;
  String? isuTeknis;
  String? isuLain;
  String? ref;
  String? ket;
  String? ide;
  String? idUser;

  Data(
      {this.minFrekuensi,
      this.maxFrekuensi,
      this.bandwidth,
      this.band,
      this.jenisBand,
      this.wp,
      this.techWorld,
      this.techIndonesia,
      this.license,
      this.assignment,
      this.document,
      this.isuTeknis,
      this.isuLain,
      this.ref,
      this.ket,
      this.ide,
      this.idUser});

  Data.fromJson(Map<String, dynamic> json) {
    minFrekuensi = json['min_frekuensi'];
    maxFrekuensi = json['max_frekuensi'];
    bandwidth = json['bandwidth'];
    band = json['band'];
    jenisBand = json['jenis_band'];
    wp = json['wp'];
    techWorld = json['tech_world'];
    techIndonesia = json['tech_indonesia'];
    license = json['license'];
    assignment = json['assignment'];
    document = json['document'];
    isuTeknis = json['isu_teknis'];
    isuLain = json['isu_lain'];
    ref = json['ref'];
    ket = json['ket'];
    ide = json['ide'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min_frekuensi'] = minFrekuensi;
    data['max_frekuensi'] = maxFrekuensi;
    data['bandwidth'] = bandwidth;
    data['band'] = band;
    data['jenis_band'] = jenisBand;
    data['wp'] = wp;
    data['tech_world'] = techWorld;
    data['tech_indonesia'] = techIndonesia;
    data['license'] = license;
    data['assignment'] = assignment;
    data['document'] = document;
    data['isu_teknis'] = isuTeknis;
    data['isu_lain'] = isuLain;
    data['ref'] = ref;
    data['ket'] = ket;
    data['ide'] = ide;
    data['id_user'] = idUser;
    return data;
  }
}
