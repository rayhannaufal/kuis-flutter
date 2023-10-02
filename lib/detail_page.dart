import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kuis/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailPage extends StatefulWidget {
  final Diseases plant;
  const DetailPage({super.key, required this.plant});

  @override
  State<DetailPage> createState() => _DetailPageState(plant: plant);
}

class _DetailPageState extends State<DetailPage> {
  final Diseases plant;
  bool isFavorite = false;

  _DetailPageState({required this.plant});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Disease'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              String pesan = '';
              setState(() {
                isFavorite = !isFavorite;
                if (isFavorite) {
                  pesan = 'Berhasil menambahkan ke favorit';
                } else {
                  pesan = 'Berhasil menghapus ke favorit';
                }
              });
              SnackBar snackBar = SnackBar(content: Text(pesan));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }, style: IconButton.styleFrom(
              padding: EdgeInsets.all(10)
            ),
            icon: Icon((isFavorite) ? Icons.favorite : Icons.favorite_outline,
            color:(isFavorite) ? Colors.red : Colors.white)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.network(
              plant.imgUrls,
              height: MediaQuery.of(context).size.height/3,
            ),
            SizedBox(height: 10,),
            Text(
              plant.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Plant Name',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              plant.plantName,
              style: TextStyle(
                fontSize: 14
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Characteristic',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              ">${plant.nutshell.join('\n>')}",
              style: TextStyle(
                fontSize: 14
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Symptom',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              plant.symptom,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          _lauchUrl(plant.imgUrls);
        }, child: Icon(Icons.link),
      ),
    );
  }

  Future<void> _lauchUrl(String url) async { 
    final Uri _url_ = Uri.parse(url);
    if (!await launchUrl(_url_)) {
      throw Exception('Gagal membuka link : ${_url_}');
    }
  }
}