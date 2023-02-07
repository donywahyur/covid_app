import 'package:covid_app/model/data_covid.dart';
import 'package:covid_app/provider/data.dart';
import 'package:covid_app/widget/provinsi_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvinsiScreen extends StatelessWidget {
  const ProvinsiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Data dataCovid = Provider.of<Data>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Covid App'),
        ),
        body: FutureBuilder(
          future: dataCovid.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 5 / 3),
                  itemBuilder: (context, index) {
                    return ProvinsiItem(dataCovid: dataCovid.dataCovid[index]);
                  },
                  itemCount: dataCovid.dataCovid.length,
                ),
              );
            }
          },
        ));
  }
}
