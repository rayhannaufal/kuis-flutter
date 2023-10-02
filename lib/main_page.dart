import 'package:flutter/material.dart';
import 'package:flutter_kuis/detail_page.dart';
import 'package:flutter_kuis/disease_data.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Diseases'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: MediaQuery.of(context).size.height/5
        ),
        itemCount: listDisease.length,
        itemBuilder: (context, index) {
          Diseases plant = listDisease[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => DetailPage(plant : plant),
                )
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/8,
                      child: Image.network(
                        plant.imgUrls,
                      ),
                    ),
                    Text(
                      plant.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}