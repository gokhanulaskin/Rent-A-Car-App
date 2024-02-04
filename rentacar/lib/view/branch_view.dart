import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:rentacar/view/car_list_view.dart';
import 'package:rentacar/view/contact_view.dart';
import 'package:rentacar/view/home_view.dart';
import 'package:rentacar/view/profile_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BranchesScreen(),
    );
  }
}

class BranchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şubelerimiz', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          // Ana Ofis
          Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Image.network(
                  'https://www.avis.com.tr/Avis/media/Avis/hakkimizda/Avis-Preferred.JPG?ext=.jpg', // Ana ofis resminin URL'si
                  fit: BoxFit.cover,
                ),
                ListTile(
                  title: Text(
                    'Ana Ofis',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  subtitle: Text('Merkez Mahallesi, Ana Cadde No:1'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Ana ofisimiz, şehir merkezinde bulunmakta ve tüm yönetim birimlerimizi barındırmaktadır.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          // Diğer Şubeler
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.store),
              title: Text('Şube 1'),
              subtitle: Text('Yan Sokak No:5'),
              onTap: () {
                // Şube detaylarına yönlendirme
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.store),
              title: Text('Şube 2'),
              subtitle: Text('Diğer Sokak No:11'),
              onTap: () {
                // Şube detaylarına yönlendirme
              },
            ),
          ),
        ],
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
