// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rentacar/view/branch_view.dart';
import 'package:rentacar/view/cars/car_1.dart';
import 'package:rentacar/view/cars/car_2.dart';
import 'package:rentacar/view/cars/car_3.dart';
import 'package:rentacar/view/cars/car_4.dart';
import 'package:rentacar/view/cars/car_5.dart';
import 'package:rentacar/view/cars/car_6.dart';
import 'package:rentacar/view/contact_view.dart';
import 'package:rentacar/view/login_view.dart';
import 'profile_view.dart'; // Profil ekranını içeren dosyayı ekleyin
import 'car_list_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeView extends StatelessWidget {
  final List<String> populerAracResimleri = [
    'https://dat-tr-prda-ops-vava.azureedge.net/cars/143225/resizedimages/bf12a81c7ab649faa82dd7e239d11a9e_catalog_desktop.webp',
    'https://dat-tr-prda-ops-vava.azureedge.net/cars/142948/resizedimages/f16c48cae37c4d6bbd7e3b90ff0c6b38_catalog_desktop.webp',
    'https://dat-tr-prda-ops-vava.azureedge.net/cars/143098/resizedimages/4c94e385285745d58b70e9fa9f697c8d_catalog_desktop.webp',
    'https://dat-tr-prda-ops-vava.azureedge.net/cars/141697/resizedimages/029de14dfbf14e4280c229af0007b715_catalog_desktop.webp',
    'https://dat-tr-prda-ops-vava.azureedge.net/cars/141977/resizedimages/ef4a069af0f84be38c2fdf4470581365_catalog_desktop.webp',
    'https://dat-tr-prda-ops-vava.azureedge.net/cars/141536/resizedimages/f825ca6bc54b4dc08ab6dc576b107589_catalog_desktop.webp',
    // Diğer araç resimleri buraya eklenebilir
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GBM'S RentACar"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Araç Kiralama',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Sizin İçin En İyi Araçları Bulun ve Kiralayın',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CarListView()),
                      );
                    },
                    child: const Text('Araçları Görüntüle'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Popüler Araçlar',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: populerAracResimleri.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final String resimUrl = entry.value;

                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              // Burada kart tıklama işlemine göre yönlendirme yap
                              // Örneğin: index değerine göre farklı sayfalara yönlendirme
                              if (index == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CarDetailsScreen1()),
                                );
                              } else if (index == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CarDetailsScreen2()),
                                );
                              } else if (index == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CarDetailsScreen3()),
                                );
                              } else if (index == 3) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CarDetailsScreen4()),
                                );
                              } else if (index == 4) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CarDetailsScreen5()),
                                );
                              } else if (index == 5) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CarDetailsScreen6()),
                                );
                              }
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(resimUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 6,
                                  right: 6,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      color: Colors.black.withOpacity(0.4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            'Araç ${index + 1}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              width:
                                                  8), // İsim ile yıldızlar arasında boşluk bırakır
                                          // Yıldız ikonları ve derecelendirme gösterimi
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 20),
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 20),
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 20),
                                          Icon(Icons.star,
                                              color: Colors.grey,
                                              size:
                                                  20), // Yarım yıldız veya boş yıldız için gri renk
                                          Icon(Icons.star,
                                              color: Colors.grey, size: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Yakınınızdaki Araçlar',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const SizedBox(height: 8.0),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.4,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 500),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: populerAracResimleri.map((String resimUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(resimUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  // Burada yakınınızdaki araç kiralama noktalarının listesi olabilir
                  Container(
                    height: 200.0,
                    // Yakınınızdaki araç kiralama noktalarının listesi buraya gelecek
                  ),
                ],
              ),
            ),
          ],
        ),
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeView(),
  ));
}
