import 'package:flutter/material.dart';
import 'package:is_ilan/provider/fav_provider.dart';
import 'package:provider/provider.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    var favoriteProvider = Provider.of<FavoriteProvider>(context);
    var favoriteJobs = favoriteProvider.favoriteJobs;

    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favori İlanlarım",
            style: TextStyle(fontFamily: "Coiny", fontSize: 25, color: Colors.white)),
        backgroundColor: Colors.indigo.shade200,
      ),
      body: favoriteJobs.isEmpty // Eğer favori ilanlar listesi boşsa
          ? Center(
        child: Text(
          "Henüz favori ilanınız yok",
          style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
        ),
      )
          : ListView.builder(
        itemCount: favoriteJobs.length,
        itemBuilder: (context, index) {
          var ilan = favoriteJobs[index];
          return Card(
            elevation: 8,
            color: Colors.grey.shade50,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.22,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ilan["sirket_pozisyon"],
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          ilan["sirket_adi"] ?? "Şirket adı belirtilmemiş",
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          ilan["sirket_lokasyon"] ?? "Lokasyon belirtilmemiş",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      favoriteProvider.toggleFavorite(ilan); // Favoriden çıkar
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}