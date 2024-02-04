import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CarDetailsScreen4 extends StatelessWidget {
  final String carImageUrl = "https://dat-tr-prda-ops-vava.azureedge.net/cars/141697/resizedimages/029de14dfbf14e4280c229af0007b715_catalog_desktop.webp";
  final String carName = "Volkswagen Polo";
  final double carRating = 4.5; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carName, style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              carImageUrl,
              fit: BoxFit.cover,
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carName,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  RatingBar.builder(
                    initialRating: carRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Icon(Icons.speed, color: Colors.black54),
                      SizedBox(width: 8.0),
                      Text("Max Hız: 200 km/h"),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.car_rental, color: Colors.black54),
                      SizedBox(width: 8.0),
                      Text("Yakıt Türü: Benzin"),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.price_change, color: Colors.black54),
                      SizedBox(width: 8.0),
                      Text("Günlük Ücreti: 2000₺", style: TextStyle(backgroundColor: Colors.blue),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: CarDetailsScreen4(),
    ));
