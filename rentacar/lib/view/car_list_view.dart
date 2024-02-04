import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:rentacar/view/branch_view.dart';
import 'package:rentacar/view/contact_view.dart';
import 'package:rentacar/view/home_view.dart';
import 'package:rentacar/view/profile_view.dart';

class Car {
  final String imageUrl;
  final String name;
  final String description;

  Car({
    required this.imageUrl,
    required this.name,
    required this.description,
  });
}

class CarListView extends StatelessWidget {
  final List<Car> cars = [
    Car(
      imageUrl:
          'https://dat-tr-prda-ops-vava.azureedge.net/cars/143225/resizedimages/bf12a81c7ab649faa82dd7e239d11a9e_catalog_desktop.webp',
      name: 'Ford Focus',
      description: '1.5 Ti-VCT Trend X 123HP',
    ),
    Car(
      imageUrl:
          'https://dat-tr-prda-ops-vava.azureedge.net/cars/142948/resizedimages/f16c48cae37c4d6bbd7e3b90ff0c6b38_catalog_desktop.webp',
      name: 'Hyundai Tucson',
      description: '1.6 T-GDI 4x4 Elite Plus Dct 177HP',
    ),
    Car(
      imageUrl:
          'https://dat-tr-prda-ops-vava.azureedge.net/cars/143098/resizedimages/4c94e385285745d58b70e9fa9f697c8d_catalog_desktop.webp',
      name: 'Volkswagen Golf',
      description: '1.2 Tsi Bmt Comfortline Dsg 110HP',
    ),
    Car(
      imageUrl:
          'https://dat-tr-prda-ops-vava.azureedge.net/cars/141697/resizedimages/029de14dfbf14e4280c229af0007b715_catalog_desktop.webp',
      name: 'Volkswagen Polo',
      description: '1.0 Tsi Comfortline Dsg 95HP',
    ),
    Car(
      imageUrl:
          'https://dat-tr-prda-ops-vava.azureedge.net/cars/141977/resizedimages/ef4a069af0f84be38c2fdf4470581365_catalog_desktop.webp',
      name: 'Fiat Egea',
      description: '1.6 E-Torq Street 110HP',
    ),
    Car(
      imageUrl:
          'https://dat-tr-prda-ops-vava.azureedge.net/cars/141536/resizedimages/f825ca6bc54b4dc08ab6dc576b107589_catalog_desktop.webp',
      name: 'Renault Clio',
      description: '1.0 Sce Joy 65HP',
    ),
    // Diğer araçlar buraya eklenebilir
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Araç Listesi', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100, // İstediğiniz boyutu ayarlayabilirsiniz
              child: Row(
                children: [
                  Container(
                    width: 180,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(cars[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cars[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          cars[index].description,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: ConvexAppBar(
  items: [
    TabItem(icon: Icons.home, title: "Anasayfa"),
    TabItem(icon: Icons.car_rental, title: "Araba"),
    TabItem(icon: Icons.phone, title: "Bize Ulaşın"),
    TabItem(icon: Icons.location_city, title: "Şubeler"),
    TabItem(icon: Icons.people, title: "Profil"),
  ],
  onTap: (int i) {
    if (i == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } else if (i == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileView()),
      );
    } else if (i == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CarListView()),
      );
    } else if (i == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ContactInfoScreen()),
      );
    } else if (i == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BranchesScreen()),
      );
    }
  },
),

    );
  }
}
