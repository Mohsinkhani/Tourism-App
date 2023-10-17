import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  List<Marker> _markerr = [];
  List<Marker> _list = [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(34.7917, 72.3794),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(title: 'My Current Location')),
    // Marker(
    //     markerId: MarkerId("2"),
    //     position: LatLng(35.0196, 72.4761),
    //     infoWindow: InfoWindow(title: 'Shin Swat')),
  ];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.7917, 72.3794),
    zoom: 14,
  );
  // final List<Map<String, dynamic>> hotellist = const [
  //   {
  //     "address": "Fizagat Mingora swat",
  //     "id": "01",
  //     "image": "assets/images/hotel.png",
  //     "lat": 34.7917,
  //     "lng": 72.3794,
  //     "name": "Burjal swat",
  //     "phone": "03482517054",
  //     "region": "Asia",
  //   }
  // ];
  // final Map<String, Marker> _marker = {};
  // Future<void> _onMapCreated(GoogleMapController controller) async {
  //   _marker.clear();
  //   setState(() {
  //     // for (var i = 0; i < hotellist.length; i++) {
  //     //   final marker = Marker(
  //     //       markerId: MarkerId(hotellist[i]['name']),
  //     //       position: LatLng(hotellist[i]['lat'], hotellist[i]['lng']),
  //     //       infoWindow: InfoWindow(
  //     //           title: hotellist[i]['name'],
  //     //           snippet: hotellist[i]['address'],
  //     //           onTap: () {
  //     //             print("${hotellist[i]['lat']}, ${hotellist[i]['lng']}");
  //     //             launchMap(hotellist[i]['lat'], hotellist[i]['lng']);
  //     //           }),
  //     //       onTap: () {
  //     //         print("Cliked on Marker");
  //     //       });
  //     //   print("${hotellist[i]['lat']}, ${hotellist[i]['lng']}");
  //     //   _marker[hotellist[i]['name']] = marker;
  //     // }
  //   });
  // }

  launchMap(lat, long) {
    MapsLauncher.launchCoordinates(lat, long);
  }

  final Completer<GoogleMapController> _controller = Completer();

  // @override
  // void dispose() {
  //   _googleMapController.dispose();
  //   super.dispose();
  // }

  // final _initialCameraPosition = CameraPosition(
  //   target: LatLng(34.7917, 72.3794),
  //   zoom: 10,
  // );

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  loadData() {
    getUserCurrentLocation().then((value) async {
      print("My Current Location");
      print(value.latitude.toString() + " " + value.longitude.toString());
      _markerr.add(Marker(
          markerId: MarkerId("2"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: "Current Location"),
          position: LatLng(value.latitude, value.longitude)));

      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 14);
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }

  //Polyline Settings With Google Maps
  late Position currentPosition;
  void getCurrentPosition() async {
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  List<LatLng> polylineCoordinates = [];

  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> latlang = [
    LatLng(34.7917, 72.3794),
    LatLng(34.8529, 72.4525),
    // LatLng(currentPosition.latitude, currentPosition.longitude)
  ];

//Ployline Setting end
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    //_markerr.addAll(_list);
    for (var i = 0; i < latlang.length; i++) {
      _markers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: latlang[i],
          infoWindow: InfoWindow(title: 'My Current Location')));
      setState(() {});
      _polyline.add(Polyline(
          polylineId: PolylineId('1'),
          color: Colors.red,
          points: latlang,
          width: 3));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        polylines: _polyline,
        // markers: Set<Marker>.of(_markerr),
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            //     _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            //   CameraPosition(
            //     target: LatLng(hotellist[0]['lat'], hotellist[0]['lng']),
            //     zoom: 10,
            //   ),
            // )),
            getUserCurrentLocation().then((value) async {
          print("My Current Location");
          print(value.latitude.toString() + " " + value.longitude.toString());
          _markerr.add(Marker(
              markerId: MarkerId("2"),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              position: LatLng(value.latitude, value.longitude)));
          CameraPosition cameraPosition = CameraPosition(
              target: LatLng(value.latitude, value.longitude), zoom: 14);
          final GoogleMapController controller = await _controller.future;
          controller
              .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
          setState(() {});
        }),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
