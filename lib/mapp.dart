import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

//import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong/latlong.dart';

class myLocation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return mapped();
  }
}

class mapped extends State<myLocation> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double zoonVal = 0.5;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Carwah nearest you',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: <Widget>[
          _googleMap(),
          //__zoomminuFunction(),
          //_zoomPlusFunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _buildContainer(){
    return Align(

      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0))
          ],
        ),
      ),
    );

  }


  Widget _googleMap() {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(6.465422, 3.406448),
            zoom: 12,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            lagos1Marker,lagos2Marker,
          },
        ));
  }
}

Marker lagos1Marker = Marker(
  markerId: MarkerId('lagos1'),
  position: LatLng(6.465422, 3.406448),
  infoWindow: InfoWindow(title: 'OlogunOba Carwash'),
  icon:BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet
  )
);

Marker lagos2Marker = Marker(
    markerId: MarkerId('lagos1'),
    position: LatLng(6.465422, 3.406448),
    infoWindow: InfoWindow(title: 'awojobe Carwash'),
    icon:BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet
    )
);


