import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testflutter/roadnavi/roadnavi.dart';
import 'package:testflutter/roadnavi/roadnavi2.dart';
import 'package:testflutter/roadnavi/roadnavi3.dart';

class GoogleMapBody extends StatefulWidget {
  const GoogleMapBody({super.key});

  @override
  State<GoogleMapBody> createState() => _GoogleMapBodyState();
}

class _GoogleMapBodyState extends State<GoogleMapBody> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.151816, 126.861559),
    zoom: 15,
  );
  final List<Marker> markers = [];

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
          position: const LatLng(35.151816, 126.861559)),
      Marker(
          markerId: const MarkerId("2"),
          onTap: () => print("Marker!"),
          infoWindow: InfoWindow(
            title: '☆☆☆☆',
            onTap: () {
              var bottomSheet = scaffoldKey.currentState!
                  .showBottomSheet((context) => Container(
                        height: 250,
                        color: Colors.transparent,
                        child: getBottomSheet("☆☆☆☆"),
                      ));
            },
          ),
          position: const LatLng(35.151530, 126.856789)),
      Marker(
          markerId: const MarkerId("3"),
          onTap: () => print("Marker!"),
          infoWindow: InfoWindow(
            title: '☆☆☆☆',
            onTap: () {
              var bottomSheet2 = scaffoldKey.currentState!
                  .showBottomSheet((context) => Container(
                        height: 250,
                        color: Colors.transparent,
                        child: getBottomSheet2("☆☆☆☆"),
                      ));
            },
          ),
          position: const LatLng(35.155442, 126.859456)),
      Marker(
          markerId: const MarkerId("4"),
          onTap: () => print("Marker!"),
          infoWindow: InfoWindow(
            title: '☆☆☆☆',
            onTap: () {
              var bottomSheet3 = scaffoldKey.currentState!
                  .showBottomSheet((context) => Container(
                        height: 250,
                        color: Colors.transparent,
                        child: getBottomSheet3("☆☆☆☆"),
                      ));
            },
          ),
          position: const LatLng(35.149851, 126.864802))
    ];
    markers.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;
    return Scaffold(
      appBar: AppBar(
        title: const Text('☆☆☆☆대여 서비스'),
        backgroundColor: Color(0xFF0F9D58),
      ),
      key: scaffoldKey,
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          markers: Set.from(markers),
          initialCameraPosition: _kGooglePlex,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: (mapController) {
            mapController.showMarkerInfoWindow(const MarkerId("1"));
          },
        ),
      ),
    );
  }

  Widget getBottomSheet(String s) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 32),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0xFF0F9D58),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12)),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("☆☆☆☆",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("저희 ☆☆☆☆대여를 이용해주셔서 감사합니다.",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.adb,
                    color: Color(0xFF0F9D58),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("대여 잔여 : 10대", style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.adb,
                    color: Color(0xFF0F9D58),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("잔여가 남아있습니다", style: TextStyle(fontSize: 14)),
                ],
              )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 25, bottom: 150),
            child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  heroTag: "btnclose1",
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.exit_to_app),
                  onPressed: () => Navigator.pop(context),
                ))),
        Padding(
          padding: const EdgeInsets.all(25.5),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
                heroTag: "btnNavi1",
                backgroundColor: Color(0xFF0F9D58),
                child: const Icon(Icons.navigation),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GoogleMaproadNavi()),
                  );
                }),
          ),
        )
      ],
    );
  }

  Widget getBottomSheet2(String s) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 32),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0xFF0F9D58),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12)),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("☆☆☆☆",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("저희 ☆☆☆☆대여를 이용해주셔서 감사합니다.",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.adb,
                    color: Color(0xFF0F9D58),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("대여 잔여 : 0대", style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.adb,
                    color: Color(0xFF0F9D58),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("잔여가 없습니다. 다른 대여장을 이용해주세요",
                      style: TextStyle(fontSize: 14)),
                ],
              )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 25, bottom: 150),
            child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  heroTag: "btnclose2",
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.exit_to_app),
                  onPressed: () => Navigator.pop(context),
                ))),
        Padding(
          padding: const EdgeInsets.all(25.5),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
                heroTag: "btnNavi2",
                backgroundColor: Color(0xFF0F9D58),
                child: const Icon(Icons.navigation),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GoogleMaproadNavi2()),
                  );
                }),
          ),
        )
      ],
    );
  }

  Widget getBottomSheet3(String s) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 32),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0xFF0F9D58),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12)),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("☆☆☆☆",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("저희 ☆☆☆☆대여를 이용해주셔서 감사합니다.",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.adb,
                    color: Color(0xFF0F9D58),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("대여 잔여 : 10대", style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.adb,
                    color: Color(0xFF0F9D58),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("잔여가 남아있습니다", style: TextStyle(fontSize: 14)),
                ],
              )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 25, bottom: 150),
            child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  heroTag: "btnclose3",
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.exit_to_app),
                  onPressed: () => Navigator.pop(context),
                ))),
        Padding(
          padding: const EdgeInsets.all(25.5),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
                heroTag: "btnNavi3",
                backgroundColor: Color(0xFF0F9D58),
                child: const Icon(Icons.navigation),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GoogleMaproadNavi3()),
                  );
                }),
          ),
        )
      ],
    );
  }
}
