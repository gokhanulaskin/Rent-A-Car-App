import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:rentacar/view/branch_view.dart';
import 'package:rentacar/view/car_list_view.dart';
import 'package:rentacar/view/contact_view.dart';
import 'package:rentacar/view/home_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      "images/default_profile.jpg",
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Icon(
                    Icons.edit,
                  ),
                  const Text(
                    "Edit Your Profile",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  //controller: textNameController,
                  onChanged: (String deger) {},
                  onSubmitted: (String deger) {},
                  decoration: const InputDecoration(
                      hintText: 'Name', border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  //controller: textNameController,
                  onChanged: (String deger) {},
                  onSubmitted: (String deger) {},
                  decoration: const InputDecoration(
                      hintText: 'Surname', border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  //controller: textEmailController,
                  onChanged: (String deger) {},
                  onSubmitted: (String deger) {},
                  decoration: const InputDecoration(
                      hintText: 'E-Mail', border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  //controller: textPasswordController,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  maxLines: 2,
                  minLines: 1,
                  maxLength: 8,
                  decoration: const InputDecoration(
                      hintText: 'Driver ID', border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
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
