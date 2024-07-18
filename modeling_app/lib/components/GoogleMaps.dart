import 'dart:async';
import 'package:modeling_app/constant/constants.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:modeling_app/helper/getx_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

///-------------------------INSTRUCTION
///STEP 1
///   minSdkVersion 21
/// key 1
/// AIzaSyDiJo02OZXQiW6qh3Vp1vGEUsHGsFpjKdg
/// key 2
/// AIzaSyAcC8RkFxv3vKg0mEXtqSrZnL32imnLm30
///
///STEP 2 (ADD THESE LINES IN ANDROIDMANIFEST)
///
/// <meta-data
///       android:name="com.google.android.geo.API_KEY"
///       android:value="AIzaSyAcC8RkFxv3vKg0mEXtqSrZnL32imnLm30"/>
///
/// STEP 2 (ADD THESE LINES IN APP DELEGATE.SWIFT)
///
/// import GoogleMaps
///
///   GMSServices.provideAPIKey("AIzaSyAcC8RkFxv3vKg0mEXtqSrZnL32imnLm30")

class GoogleMapWidget extends StatefulWidget {
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target:LatLng(24.854526, 67.012041),
  //   //  LatLng(37.422131, -122.084801),
  //   zoom: 14.4746,
  // );

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  List<LatLng> polylineCoordinates = [];

  _getPolyline() async {
    try {
      PolylinePoints polyline = PolylinePoints();

      PolylineResult result = await polyline.getRouteBetweenCoordinates(
        googleApiKey: Constants.mapApiKey,
        request: PolylineRequest(
          origin: PointLatLng(24.854526, 67.012041),
          destination: PointLatLng(24.855783, 67.028129),
          mode: TravelMode.driving,
          wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
        ),
      );
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
        setState(() {});
      }
    } catch (e) {
      print("Error getting current location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(initState: (state) async {
      try {
      await _getPolyline();
      print(polylineCoordinates);
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        var location = LatLng(position.latitude, position.longitude);

        Get.find<GetxControllersProvider>().currentLoaction(location);
      } catch (e) {
        print("Error getting current location: $e");
      }
    }, builder: (themecontroller) {
      return Obx(() => GoogleMap(
            zoomGesturesEnabled: true,
            mapToolbarEnabled: false,
            mapType: MapType.normal,
            markers: {
              Get.find<GetxControllersProvider>().myMarker.value,
              Get.find<GetxControllersProvider>().desMarker.value
            },
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(Get.find<GetxControllersProvider>().latitude.value,
                  Get.find<GetxControllersProvider>().longitude.value),
              zoom: 14.4746,
            ),

            polylines: {
              Polyline(
                  polylineId: PolylineId('route'),
                  color: Colors.blue,
                  points: [
                    LatLng(Get.find<GetxControllersProvider>().Mylatitude.value,
                        Get.find<GetxControllersProvider>().Mylongitude.value),
                    LatLng(Get.find<GetxControllersProvider>().latitude.value,
                        Get.find<GetxControllersProvider>().longitude.value)
                  ],
                  width: 7)
            },
            // CameraPosition(
            //   target: LatLng(
            //       Get.find<GetxControllersProvider>().latitude.value,
            //       Get.find<GetxControllersProvider>().longitude.value),
            //   zoom: 14.4746,
            // ),

            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              Get.find<GetxControllersProvider>().newGoogleMapController =
                  controller;
            },
            onTap: (LatLng tappedLocation) {
              Get.find<GetxControllersProvider>().LocationLoading.value = true;
              Get.find<GetxControllersProvider>()
                  .updateSelectedAddress(tappedLocation);
              Get.find<GetxControllersProvider>().LocationLoading.value = false;
              // print(Get.find<GetxControllersProvider>().latitude.value);
              // print(Get.find<GetxControllersProvider>().longitude.value);
            },
          ));
    });
  }
}
