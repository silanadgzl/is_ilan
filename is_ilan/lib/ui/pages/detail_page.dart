import 'package:flutter/material.dart';
import 'package:is_ilan/ui/widgets/detail_cards_widget.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> ilan; // İlan bilgilerini tutacak değişken

  const DetailPage({super.key, required this.ilan}); // Yapıcı

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade200,
        centerTitle: true,
        title: const Text("İş Detayları",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: "Coiny")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack( // Stack widget'ı kullanarak logo ve diğer içerikleri üst üste yerleştiriyoruz
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    color: Colors.blueGrey.shade500,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ilan["sirket_pozisyon"],
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
                          Text(ilan["sirket_adi"],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white)),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Çalışma şekli:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white)),
                              Text(ilan["calisma_sekli"],style: const TextStyle(color: Colors.white),),
                              const SizedBox(height: 10),
                              const Text("Lokasyon:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white)),
                              Text(ilan["sirket_lokasyon"],style: const TextStyle(color: Colors.white),),
                              const SizedBox(height: 10),
                              const Text("Pozisyon Seviyesi:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white)),
                              Text(ilan["sirket_pozisyon"],style: const TextStyle(color: Colors.white),),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade100,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),

                                ),
                                child: const Text("Başvur"),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),

                              ),
                                child: const Text("Kaydet"),
                              )],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 10,
                    child: Image.asset(
                      'assets/logo.png',
                      height: 80,
                      width: 80,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 5),
              DetailCardWidget(ilan: ilan, baslik: "İş Tanımı", degerJson: "is_tanimi"),
              const Divider(color: Colors.grey, thickness: 5),
              DetailCardWidget(ilan: ilan, baslik: "Gereksinimler", degerJson: "gereksinimler"),
              const Divider(color: Colors.grey, thickness: 5),
              DetailCardWidget(ilan: ilan, baslik: "Maaş Aralığı", degerJson: "maas_araligi"),
            ],
          ),
        ),
      ),
    );
  }
}
