import 'package:covid_app/model/data_covid.dart';
import 'package:flutter/material.dart';

class DetailProvinsi extends StatelessWidget {
  const DetailProvinsi({super.key, required this.dataCovid});
  final DataCovid dataCovid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(dataCovid.key!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
              "Data Kasus Covid",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            RowGrid(
              namaKasus1: "Jumlah Kasus",
              namaKasus2: "Jumlah Sembuh",
              jumlahKasus1: dataCovid.jumlahKasus.toString(),
              jumlahKasus2: dataCovid.jumlahSembuh.toString(),
              color1: Colors.red,
              color2: Colors.green,
            ),
            RowGrid(
              namaKasus1: "Jumlah Meninggal",
              namaKasus2: "Jumlah Dirawat",
              jumlahKasus1: dataCovid.jumlahMeninggal.toString(),
              jumlahKasus2: dataCovid.jumlahDirawat.toString(),
              color1: Colors.orange,
              color2: Colors.blue,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Kelompok Umur ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: dataCovid.kelompokUmur!.map((data) {
                return Card(
                  child: ListTile(
                    title: Text(data['key']),
                    trailing: Text(
                      data['doc_count'].toString(),
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class RowGrid extends StatelessWidget {
  const RowGrid({
    Key? key,
    required this.namaKasus1,
    required this.namaKasus2,
    required this.jumlahKasus1,
    required this.jumlahKasus2,
    required this.color1,
    required this.color2,
  }) : super(key: key);
  final String namaKasus1;
  final String namaKasus2;
  final String jumlahKasus1;
  final String jumlahKasus2;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Card(
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    Text(
                      jumlahKasus1,
                      style: TextStyle(fontSize: 25, color: color1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(namaKasus1)
                  ],
                )),
          ),
        ),
        Expanded(
          child: Card(
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    Text(
                      jumlahKasus2,
                      style: TextStyle(fontSize: 25, color: color2),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(namaKasus2)
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
