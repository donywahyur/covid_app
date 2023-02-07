import 'package:covid_app/model/data_covid.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Data with ChangeNotifier {
  List<DataCovid> _dataCovid = [];
  get dataCovid => _dataCovid;

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://data.covid19.go.id/public/api/prov.json'));
    final List listData = json.decode(response.body)['list_data'];
    final List<DataCovid> loadedData = [];
    for (var data in listData) {
      dataCovid.add(DataCovid(
        key: data['key'],
        docCount: data['doc_count'].toString(),
        jumlahKasus: data['jumlah_kasus'],
        jumlahSembuh: data['jumlah_sembuh'],
        jumlahMeninggal: data['jumlah_meninggal'],
        jumlahDirawat: data['jumlah_dirawat'],
        jenisKelamin: data['jenis_kelamin'] as List,
        kelompokUmur: data['kelompok_umur'] as List,
        lokasi: data['lokasi'],
        penambahan: data['penambahan'],
      ));
    }
  }
}
