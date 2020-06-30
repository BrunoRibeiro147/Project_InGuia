import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inguia/Widgets/searchBarMaps.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

class MapsPage extends StatefulWidget {
  MapsPage({Key key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  var status = false;

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  getUserLocation() async {
    if (await Permission.location.request().isGranted) {
      setState(() {
        status = true;
      });
    }
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _lastMapPosition = LatLng(position.latitude, position.longitude);
      _addInitialPositionMarker();
      _goToUserPosition();
    });
  }

  Completer<GoogleMapController> _controller = Completer();
  static LatLng _center = LatLng(-3.1302834, -60.0256029);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _addInitialPositionMarker() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          icon: BitmapDescriptor.defaultMarker));
    });
  }

  _goToUserPosition() async {
    final CameraPosition _userPosition = CameraPosition(
      bearing: 0,
      target: _lastMapPosition,
      tilt: 0,
      zoom: 16.0,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_userPosition));
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          status
              ? GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition:
                      CameraPosition(target: _center, zoom: 16.0),
                  mapType: _currentMapType,
                  markers: _markers,
                  onCameraMove: _onCameraMove,
                )
              : Container(),
          SearchBarMaps(),
        ],
      ),
    );
  }
}
