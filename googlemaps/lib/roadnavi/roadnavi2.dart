import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

String GoogleApiKey = "AIzaSyCeVsHiMSsXJDUcNsWbv0r8aXkYV7FOIiE";

class GoogleMaproadNavi2 extends StatefulWidget {
  const GoogleMaproadNavi2({super.key});

  @override
  State<GoogleMaproadNavi2> createState() => _GoogleMaproadNaviState2();
}

class _GoogleMaproadNaviState2 extends State<GoogleMaproadNavi2> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.151816, 126.861559),
    zoom: 15,
  );
  final List<Marker> markers = [];

  PolylinePoints polylinePoints = PolylinePoints();
  final Set<Polyline> _polyline = {};

  final startLatLong = const LatLng(35.151816, 126.861559);
  final destinationLatLong = const LatLng(35.155442, 126.859456);

  List<LatLng> listlatlng = [
    const LatLng(35.151816, 126.861559),
    const LatLng(35.151845, 126.861651),
    const LatLng(35.155544, 126.861508),
    const LatLng(35.155509, 126.859491),
    const LatLng(35.155442, 126.859456)
  ];

  @override
  void initState() {
    super.initState();
    final List<Marker> list = [
      Marker(
          markerId: const MarkerId("1"),
          onTap: () => print("Marker!"),
          infoWindow: const InfoWindow(
            title: '현재 내위치',
          ),
          position: startLatLong),
      Marker(
          markerId: const MarkerId("3"),
          onTap: () => print("Marker!"),
          position: destinationLatLong),
    ];
    markers.addAll(list);
    _polyline.add(Polyline(
      width: 5,
      polylineId: const PolylineId("2"),
      points: listlatlng,
      color: Colors.green,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var ButtonSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10),
        Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text("뒤로가기"),
                onPressed: () => Navigator.pop(context)),
          ],
        )
      ],
    );
    GoogleMapController mapController;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('☆☆☆☆대여 서비스'),
        backgroundColor: Color(0xFF0F9D58),
      ),
      body: Center(
        child: Column(children: [
          Container(
            width: 500,
            height: 600,
            child: GoogleMap(
              mapType: MapType.normal,
              markers: Set.from(markers),
              initialCameraPosition: _kGooglePlex,
              polylines: _polyline,
              onMapCreated: (mapController) {
                mapController.showMarkerInfoWindow(const MarkerId("1"));
              },
            ),
          ),
          ButtonSection,
        ]),
      ),
    );
  }
}
