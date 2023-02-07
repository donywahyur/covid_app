import 'package:covid_app/model/data_covid.dart';
import 'package:flutter/material.dart';

import '../screen/detail_provinsi.dart';

class ProvinsiItem extends StatelessWidget {
  const ProvinsiItem({super.key, required this.dataCovid});
  final DataCovid dataCovid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailProvinsi(dataCovid: dataCovid)));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dataCovid.key!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Jumlah Kasus: '),
            SizedBox(
              height: 5,
            ),
            Text(
              dataCovid.jumlahKasus.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
