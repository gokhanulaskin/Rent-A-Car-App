// ignore_for_file: prefer_const_constructors

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:rentacar/view/branch_view.dart';
import 'package:rentacar/view/car_list_view.dart';
import 'package:rentacar/view/home_view.dart';
import 'package:rentacar/view/profile_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactInfoScreen extends StatefulWidget {
  @override
  _ContactInfoScreenState createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(41.0082, 28.9784), // İstanbul'un koordinatları gibi bir başlangıç noktası
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İletişim Bilgileri', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("+90 123 456 78 90"),
                    subtitle: Text("Telefon Numarası"),
                    onTap: () => launchUrl(Uri.parse("tel:+901234567890")),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("info@ornek.com"),
                    subtitle: Text("E-Mail Adresi"),
                    onTap: () => launchUrl(Uri.parse("mailto:info@ornek.com")),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("Ornek Mahallesi, Ornek Sokak No:1, Istanbul"),
                    subtitle: Text("Adres"),
                  ),
                  ListTile(
                    leading: Icon(Icons.web),
                    title: Text("www.ornek.com"),
                    subtitle: Text("Web Sitesi"),
                    onTap: () => launchUrl(Uri.parse("https://www.ornek.com")),
                  ),
                  ListTile(
                    leading: Icon(Icons.social_distance),
                    title: Text("@ornekSosyalMedya"),
                    subtitle: Text("Sosyal Medya"),
                    onTap: () => launchUrl(Uri.parse("https://twitter.com/ornekSosyalMedya")),
                  ),

                ],
              ),
            ),
            Container(
              height: 300, // Haritanın yüksekliğini ayarlayın
              child: GoogleMap(
                initialCameraPosition: _initialPosition,
                mapType: MapType.normal,
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
