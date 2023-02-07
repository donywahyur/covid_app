import 'package:flutter/material.dart';

class DataCovid {
  String? key;
  String? docCount;
  int? jumlahKasus;
  int? jumlahSembuh;
  int? jumlahMeninggal;
  int? jumlahDirawat;
  List? jenisKelamin;
  List? kelompokUmur;
  Map<String, dynamic>? lokasi;
  Map<String, dynamic>? penambahan;

  DataCovid({
    this.key,
    this.docCount,
    this.jumlahKasus,
    this.jumlahSembuh,
    this.jumlahMeninggal,
    this.jumlahDirawat,
    this.jenisKelamin,
    this.kelompokUmur,
    this.lokasi,
    this.penambahan,
  });
}
