import 'package:flutter/material.dart';

class DetailCardWidget extends StatelessWidget {
  const DetailCardWidget({
    super.key,
    required this.ilan,
    this.baslik,
    this.maas,
    this.degerJson,

  });

  final Map<String, dynamic> ilan;
  final String? degerJson;
  final String? baslik;
  final double? maas;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      color: Colors.blueGrey.shade500,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(baslik!,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),
            Text(ilan[degerJson],style: const TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
