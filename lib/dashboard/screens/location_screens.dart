import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/title.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ElevatedButton(onPressed: (){
            const Icon(Icons.maps_home_work);
          }
              ,child: CustomText(
                  text: "map location", size: 18)),
          Container(
              height: MediaQuery.of(context).size.height,
              width:double.infinity ,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                      10,
                      10,
                    ),
                    zoom:10),
              )),
        ],
      ),
    );
  }
}
