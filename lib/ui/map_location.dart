import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapView extends StatefulWidget {
  const MyMapView({super.key});

  @override
  State<MyMapView> createState() => _MyAppState();
}

class _MyAppState extends State<MyMapView> {
  Future<void> _getCurrentLocation() async {
    ///      allMarkers.removeWhere(
    ///           (element) => element.markerId == const MarkerId("origin"));

    final Uint8List orgPin =
        await getBytesFromAsset("asset/map_style/motorbike.png", 40);

    Timer.periodic(const Duration(seconds: 4), (timer) async {
      allMarkers.removeWhere((val) {
        if (val.markerId == const MarkerId("origin")) {
          return true;
        } else {
          return false;
        }
      });
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        setState(() {
          mapController.animateCamera(
            CameraUpdate.newLatLngZoom(
              LatLng(position.latitude, position.longitude),
              15.0,
            ),
          );

          sourceMarker = Marker(
            markerId: MarkerId('origin'),
            infoWindow: InfoWindow(title: 'Origin'),
            icon: BitmapDescriptor.bytes(orgPin),
            position: LatLng(position.latitude, position.longitude),
          );

          allMarkers.add(sourceMarker!);

          print("my lat long ${position.latitude},${position.longitude}");
        });
      } catch (e) {
        print('Error getting current location: $e');
      }
    });
  }

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(28.523520, 77.284220);

  void _onMapCreated(GoogleMapController controller) async {
    final Uint8List orgPin =
        await getBytesFromAsset("asset/map_style/motorbike.png", 70);

    mapController = controller;

    String value =
        await DefaultAssetBundle.of(context).loadString(MapStyle.mapStyle);
    mapController.setMapStyle(value);

    // Future.delayed(const Duration(seconds: 5), () async {
    //   await mapController.animateCamera(
    //     CameraUpdate.newCameraPosition(
    //       const CameraPosition(target: LatLng(28.523519, 77.284219), zoom: 14),
    //     ),
    //   );
    //
    //   setState(() {});
    // });
    // Future.delayed(const Duration(seconds: 7), () async {
    //   await mapController.animateCamera(
    //     CameraUpdate.newCameraPosition(
    //       const CameraPosition(
    //           target: LatLng(28.523519, 77.284219), zoom: 14, tilt: 5.0),
    //     ),
    //   );
    //
    //   setState(() {});
    // });
  }

  List<LatLng> latLen = [
    const LatLng(19.0759837, 72.8776559),
    const LatLng(28.679079, 77.069710),
  ];

  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 4,
    );
    polylines[id] = polyline;
    Future.delayed(const Duration(milliseconds: 3500), () {
      setState(() {});
    });
    setState(() {});
  }

  void makeLines() async {
    await polylinePoints
        .getRouteBetweenCoordinates(
      googleApiKey: 'AIzaSyB9AB3O6SvSNqmokLlWUvieahUIy5JA_vw',
      request: PolylineRequest(
        origin: const PointLatLng(28.5312582, 77.2798424),
        destination: const PointLatLng(28.682356, 77.064675),
        mode: TravelMode.driving,
      ),
    )
        .then((value) {
      for (var point in value.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }).then((value) {
      addPolyLine();
    });
    addSource();
  }

  @override
  void initState() {
    super.initState();
    print("AIzaSyB9AB3O6SvSNqmokLlWUvieahUIy5JA_vw");
    _getCurrentLocation();
    makeLines();
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  addSource() async {
    final Uint8List orgPin =
        await getBytesFromAsset("asset/map_style/motorbike.png", 30);
    sourceMarker = Marker(
      markerId: MarkerId('origin'),
      infoWindow: InfoWindow(title: 'Origin'),
      icon: BitmapDescriptor.bytes(orgPin),
      position: LatLng(28.5312582, 77.2798424),
    );
    destinationMarker = Marker(
      markerId: const MarkerId('Destination'),
      infoWindow: const InfoWindow(title: 'Destination'),
      position: const LatLng(28.682356, 77.064675),
    );
    allMarkers.add(sourceMarker!);
    allMarkers.add(destinationMarker!);
    setState(() {});
  }

  String sourceTitle = "";
  String sourceSubTitle = "";

  String destinationTitle = "";
  String destinationSubTitle = "";

  bool isShowAllOptions = false;
  bool isShowVehicleType = false;
  bool isShowMaterialWeight = false;
  bool isShowVehicleLength = false;
  bool isShowProductType = false;
  bool isShowSubmitButton = false;

  int vehicleTypeGroupValue = 0;
  int vehicleLengthGroupValue = 0;
  int loadTypeGroupValue = 0;
  int timeSlotGroupValue = 0;

  Set<Marker> allMarkers = <Marker>{};
  Set<Polyline> allPolyines = <Polyline>{};
  Set<Marker> truckMarkers = <Marker>{};
  Marker? sourceMarker;
  Marker? destinationMarker;

  LatLng? originLatLng;
  LatLng? desLatLng;

  bool isCameraMoved = false;

  bool isLoading = false;
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(28.61426970867492, 77.20905147492886),
    zoom: 15.0,
  );
  Completer<GoogleMapController> mapCompleter =
      Completer<GoogleMapController>();

  Widget _buildGoogleMap(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.70,
      child: GoogleMap(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
        mapType: MapType.normal,
        initialCameraPosition: kGooglePlex,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        tiltGesturesEnabled: false,
        mapToolbarEnabled: false,
        compassEnabled: false,
        buildingsEnabled: true,
        markers: Set<Marker>.of(allMarkers),
        rotateGesturesEnabled: false,
        polylines: Set<Polyline>.of(allPolyines),
        onTap: (argument) {},
        onCameraIdle: () async {
          if (originLatLng != null &&
              sourceMarker == null &&
              destinationMarker == null) {}

          isCameraMoved = false;
          debugPrint("onCameraIdle");
        },
        onCameraMoveStarted: () {
          isCameraMoved = true;
          debugPrint("onCameraMoveStarted");
        },
        onCameraMove: (position) async {
          if (isCameraMoved &&
              sourceMarker == null &&
              destinationMarker == null) {
            originLatLng = position.target;
            debugPrint(
                "Latitude: ${position.target.latitude}; Longitude: ${position.target.longitude} ${position.zoom}");
          }
        },
        onMapCreated: (innerController) async {
          mapCompleter.complete(innerController);
          String value = await DefaultAssetBundle.of(context)
              .loadString(MapStyle.mapStyle);
          mapController.setMapStyle(value);

          await mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                  target: LatLng(28.61426970867492, 77.20905147492886),
                  zoom: 14.47),
            ),
          );

          setState(() {
            if (kDebugMode) {
              print("Hello");
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        body: SafeArea(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            polylines: Set<Polyline>.of(polylines.values),
            markers: Set<Marker>.of(allMarkers),
            onCameraMove: (position) {
              debugPrint(
                  "Latitude: ${position.target.latitude}; Longitude: ${position.target.longitude} ${position.zoom}");
            },
            // markers: {
            //
            //   const Marker(
            //     markerId: MarkerId('DELHI_01'),
            //     position: LatLng(28.637360, 77.017970),
            //   )
            // },
          ),
        ),
      ),
    );
  }
}

class MapStyle {
  static String mapStyle = 'asset/map_style/map_style.json';
}

// import 'dart:async';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'dart:convert' as convert;
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MyMapView extends StatefulWidget {
//   const MyMapView({super.key});
//
//   @override
//   State<MyMapView> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyMapView> {
//   late GoogleMapController mapController;
//
//   final LatLng _center = const LatLng(28.523520, 77.284220);
//
//   void _onMapCreated(GoogleMapController controller) async {
//     final Uint8List orgPin =
//         await getBytesFromAsset("asset/map_style/truck_marker_red1.png", 80);
//
//     mapController = controller;
//
//     String value =
//         await DefaultAssetBundle.of(context).loadString(MapStyle.mapStyle);
//     mapController.setMapStyle(value);
//
//     Future.delayed(const Duration(seconds: 5), () async {
//       await mapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           const CameraPosition(target: LatLng(28.523519, 77.284219), zoom: 14),
//         ),
//       );
//
//       setState(() {});
//     });
//     Future.delayed(const Duration(seconds: 7), () async {
//       await mapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           const CameraPosition(
//               target: LatLng(28.523519, 77.284219), zoom: 14, tilt: 5.0),
//         ),
//       );
//
//       setState(() {});
//     });
//   }
//
//   List<LatLng> latLen = [
//     const LatLng(19.0759837, 72.8776559),
//     const LatLng(28.679079, 77.069710),
//   ];
//
//   PolylinePoints polylinePoints = PolylinePoints();
//   Map<PolylineId, Polyline> polylines = {};
//   List<LatLng> polylineCoordinates = [];
//
//   addPolyLine() {
//     PolylineId id = const PolylineId("poly");
//     Polyline polyline = Polyline(
//       polylineId: id,
//       color: Colors.blueAccent,
//       points: polylineCoordinates,
//       width: 4,
//     );
//     polylines[id] = polyline;
//     Future.delayed(const Duration(milliseconds: 3500), () {
//       setState(() {});
//     });
//     setState(() {});
//   }
//
//   void makeLines() async {
//     await polylinePoints
//         .getRouteBetweenCoordinates(
//       googleApiKey: 'AIzaSyB9AB3O6SvSNqmokLlWUvieahUIy5JA_vw',
//       request: PolylineRequest(
//         origin: const PointLatLng(28.523520, 77.284220),
//         destination: const PointLatLng(28.637360, 77.017970),
//         mode: TravelMode.driving,
//       ),
//     )
//         .then((value) {
//       for (var point in value.points) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       }
//     }).then((value) {
//       addPolyLine();
//     });
//     addSource();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     makeLines();
//   }
//
//   static Future<Uint8List> getBytesFromAsset(String path, int width) async {
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
//         targetWidth: width);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
//         .buffer
//         .asUint8List();
//   }
//
//   addSource() async {
//     final Uint8List orgPin =
//         await getBytesFromAsset("asset/map_style/truck_marker_red1.png", 30);
//     sourceMarker = const Marker(
//       markerId: MarkerId('origin'),
//       infoWindow: InfoWindow(title: 'Origin'),
//       position: LatLng(28.637360, 77.017970),
//     );
//     destinationMarker = Marker(
//       markerId: const MarkerId('Destination'),
//       infoWindow: const InfoWindow(title: 'Destination'),
//       icon: BitmapDescriptor.bytes(orgPin),
//       position: const LatLng(28.523520, 77.284220),
//     );
//     allMarkers.add(sourceMarker!);
//     allMarkers.add(destinationMarker!);
//     setState(() {});
//   }
//
//   String sourceTitle = "";
//   String sourceSubTitle = "";
//
//   String destinationTitle = "";
//   String destinationSubTitle = "";
//
//   bool isShowAllOptions = false;
//   bool isShowVehicleType = false;
//   bool isShowMaterialWeight = false;
//   bool isShowVehicleLength = false;
//   bool isShowProductType = false;
//   bool isShowSubmitButton = false;
//
//   int vehicleTypeGroupValue = 0;
//   int vehicleLengthGroupValue = 0;
//   int loadTypeGroupValue = 0;
//   int timeSlotGroupValue = 0;
//
//   Set<Marker> allMarkers = <Marker>{};
//   Set<Polyline> allPolyines = <Polyline>{};
//   Set<Marker> truckMarkers = <Marker>{};
//   Marker? sourceMarker;
//   Marker? destinationMarker;
//
//   LatLng? originLatLng;
//   LatLng? desLatLng;
//
//   bool isCameraMoved = false;
//
//   bool isLoading = false;
//   CameraPosition kGooglePlex = const CameraPosition(
//     target: LatLng(28.61426970867492, 77.20905147492886),
//     zoom: 15.0,
//   );
//   Completer<GoogleMapController> mapCompleter =
//       Completer<GoogleMapController>();
//
//   Widget _buildGoogleMap(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.70,
//       child: GoogleMap(
//         padding:
//             EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
//         mapType: MapType.normal,
//         initialCameraPosition: kGooglePlex,
//         myLocationButtonEnabled: false,
//         zoomControlsEnabled: false,
//         myLocationEnabled: true,
//         tiltGesturesEnabled: false,
//         mapToolbarEnabled: false,
//         compassEnabled: false,
//         buildingsEnabled: true,
//         markers: Set<Marker>.of(allMarkers),
//         rotateGesturesEnabled: false,
//         polylines: Set<Polyline>.of(allPolyines),
//         onTap: (argument) {},
//         onCameraIdle: () async {
//           if (originLatLng != null &&
//               sourceMarker == null &&
//               destinationMarker == null) {}
//
//           isCameraMoved = false;
//           debugPrint("onCameraIdle");
//         },
//         onCameraMoveStarted: () {
//           isCameraMoved = true;
//           debugPrint("onCameraMoveStarted");
//         },
//         onCameraMove: (position) async {
//           if (isCameraMoved &&
//               sourceMarker == null &&
//               destinationMarker == null) {
//             originLatLng = position.target;
//             debugPrint(
//                 "Latitude: ${position.target.latitude}; Longitude: ${position.target.longitude}");
//           }
//         },
//         onMapCreated: (innerController) async {
//           mapCompleter.complete(innerController);
//           String value = await DefaultAssetBundle.of(context)
//               .loadString(MapStyle.mapStyle);
//           mapController.setMapStyle(value);
//
//           await mapController.animateCamera(
//             CameraUpdate.newCameraPosition(
//               const CameraPosition(
//                   target: LatLng(28.61426970867492, 77.20905147492886),
//                   zoom: 14.47),
//             ),
//           );
//
//           setState(() {
//             if (kDebugMode) {
//               print("Hello");
//             }
//           });
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.green[700],
//       ),
//       home: Scaffold(
//         body: SafeArea(
//           child: GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: _center,
//               zoom: 9.0,
//             ),
//             myLocationEnabled: true,
//             zoomControlsEnabled: false,
//             polylines: Set<Polyline>.of(polylines.values),
//             markers: Set<Marker>.of(allMarkers),
//             // markers: {
//             //
//             //   const Marker(
//             //     markerId: MarkerId('DELHI_01'),
//             //     position: LatLng(28.637360, 77.017970),
//             //   )
//             // },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MapStyle {
//   static String mapStyle = 'asset/map_style/map_style.json';
// }
