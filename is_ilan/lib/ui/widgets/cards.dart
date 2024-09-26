import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/fav_provider.dart';
import '../pages/detail_page.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  late List<dynamic> data = [];
  List<dynamic> filteredData = [];
  TextEditingController searchController = TextEditingController();
  String? selectedFilter;

  @override
  void initState() {
    super.initState();
    loadJsonData();
    searchController.addListener(() {
      filterData();
    });
  }

  Future<void> loadJsonData() async {
    String jsonString =
    await DefaultAssetBundle.of(context).loadString("assets/data.json");
    final jsonResponse = jsonDecode(jsonString);
    setState(() {
      data = jsonResponse["is_ilanlari"];
      filteredData = data;
    });
  }


  void filterData() {
    setState(() {
      filteredData = data.where((ilan) {
        bool matchesSearch = ilan["sirket_adi"].toLowerCase().contains(searchController.text.toLowerCase()) ||
            ilan["sirket_pozisyon"].toLowerCase().contains(searchController.text.toLowerCase());

        bool matchesFilter = selectedFilter == null || ilan["calisma_sekli"] == selectedFilter;

        return matchesSearch && matchesFilter;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("İş İlanları",style: TextStyle(fontFamily: "Coiny",color: Colors.white,fontSize: 25)),centerTitle: true,backgroundColor: Colors.indigo.shade200),
      backgroundColor: Colors.indigo.shade50,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: "İlanlarda ara",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButton<String>(
              hint: const Text("Çalışma Şekli"),
              value: selectedFilter,
              isExpanded: false,
              items: <String>[
                "Hibrit",
                "Uzaktan",
                "Tam Zamanlı"
              ].map<DropdownMenuItem<String>>((String? value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value ?? "Tüm İlanlar"),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedFilter = newValue;
                  filterData(); // Filtreyi güncelle
                });
              },
            ),
          ),
          Expanded(
            child: filteredData.isNotEmpty
                ? ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                var ilan = filteredData[index];
                var favoriteProvider = Provider.of<FavoriteProvider>(context);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(ilan: ilan),
                      ),
                    );
                  },
                  child: Card(
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
                                  style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  ilan["sirket_adi"] ?? "Şirket adı belirtilmemiş",
                                  style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  ilan["sirket_lokasyon"] ?? "Lokasyon belirtilmemiş",
                                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              favoriteProvider.isFavorited(ilan) ? Icons.favorite : Icons.favorite_border,
                              color: favoriteProvider.isFavorited(ilan) ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              favoriteProvider.toggleFavorite(ilan); // Favori durumunu değiştir
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
                : const Center(child: Text("Aramanızla eşleşen ilan yok")),
          ),
        ],
      ),
    );
  }
}
