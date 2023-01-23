
import 'package:flutter/material.dart';
import '../widgets/favourite_fetch/favourite_fetch_product.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: fetchproduct("users-favourite-items"),
      ),
    );
  }
}
