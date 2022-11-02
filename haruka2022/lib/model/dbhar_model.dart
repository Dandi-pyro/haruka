class DbHarModel {
  String? message;
  List<Data>? data;

  DbHarModel({this.message, this.data});

  DbHarModel.fromJson(Map<String, dynamic> json) {
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
  String? no;
  String? frequency;
  String? minFrekuensi;
  String? maxFrekuensi;
  String? bandwidth;
  String? indeksOverlap;
  String? band;
  String? jenisBand;
  String? wp;
  String? techWorld;
  String? aloIndonesia;
  String? techIndonesia;
  String? license;
  Null? batasLisensi;
  String? tglLisensi;
  String? assignment;
  String? document;
  String? linkDokumen;
  String? tglInput;
  String? tglOutput;
  String? isuTeknis;
  String? isuLain;
  String? editor;
  String? author;
  String? ref;
  String? ket;
  String? ide;
  String? statusData;
  String? idUser;

  Data(
      {this.no,
      this.frequency,
      this.minFrekuensi,
      this.maxFrekuensi,
      this.bandwidth,
      this.indeksOverlap,
      this.band,
      this.jenisBand,
      this.wp,
      this.techWorld,
      this.aloIndonesia,
      this.techIndonesia,
      this.license,
      this.batasLisensi,
      this.tglLisensi,
      this.assignment,
      this.document,
      this.linkDokumen,
      this.tglInput,
      this.tglOutput,
      this.isuTeknis,
      this.isuLain,
      this.editor,
      this.author,
      this.ref,
      this.ket,
      this.ide,
      this.statusData,
      this.idUser});

  Data.fromJson(Map<String, dynamic> json) {
    no = json['no'].toString();
    frequency = json['frequency'];
    minFrekuensi = json['min_frekuensi'].toString();
    maxFrekuensi = json['max_frekuensi'].toString();
    bandwidth = json['bandwidth'].toString();
    indeksOverlap = json['indeks_overlap'].toString();
    band = json['band'];
    jenisBand = json['jenis_band'];
    wp = json['wp'];
    techWorld = json['tech_world'];
    aloIndonesia = json['alo_indonesia'];
    techIndonesia = json['tech_indonesia'];
    license = json['license'];
    batasLisensi = json['batas_lisensi'];
    tglLisensi = json['tgl_lisensi'];
    assignment = json['assignment'];
    document = json['document'];
    linkDokumen = json['link_dokumen'];
    tglInput = json['tgl_input'];
    tglOutput = json['tgl_output'];
    isuTeknis = json['isu_teknis'];
    isuLain = json['isu_lain'];
    editor = json['editor'];
    author = json['author'];
    ref = json['ref'];
    ket = json['ket'];
    ide = json['ide'];
    statusData = json['status_data'];
    idUser = json['id_user'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['frequency'] = frequency;
    data['min_frekuensi'] = minFrekuensi;
    data['max_frekuensi'] = maxFrekuensi;
    data['bandwidth'] = bandwidth;
    data['indeks_overlap'] = indeksOverlap;
    data['band'] = band;
    data['jenis_band'] = jenisBand;
    data['wp'] = wp;
    data['tech_world'] = techWorld;
    data['alo_indonesia'] = aloIndonesia;
    data['tech_indonesia'] = techIndonesia;
    data['license'] = license;
    data['batas_lisensi'] = batasLisensi;
    data['tgl_lisensi'] = tglLisensi;
    data['assignment'] = assignment;
    data['document'] = document;
    data['link_dokumen'] = linkDokumen;
    data['tgl_input'] = tglInput;
    data['tgl_output'] = tglOutput;
    data['isu_teknis'] = isuTeknis;
    data['isu_lain'] = isuLain;
    data['editor'] = editor;
    data['author'] = author;
    data['ref'] = ref;
    data['ket'] = ket;
    data['ide'] = ide;
    data['status_data'] = statusData;
    data['id_user'] = idUser;
    return data;
  }
}
