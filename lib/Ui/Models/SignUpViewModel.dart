import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:none/Consta/route_name.dart';
import 'package:none/Service/LocationService.dart';
import 'package:none/Service/Navigation.dart';
import 'package:none/Service/api_service.dart';
import 'package:none/Service/geolocatorService.dart';
import 'package:none/Ui/Models/base_Model.dart';
import 'package:none/locator.dart';
import 'package:none/model/user_location.dart';

class SignUpViewModel extends BaseModel{
  String? unitSelected;
  String? company;
  String imagePath = '';
  String imagePathKk = '';
  String imagePathProfile = '';

  double lat = 0.0;
  double long = 0.0;

  List<Marker> MyPoint = [];
  List<String> units = [];

  final ApiService _apiService = locator<ApiService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final LocationService _locationService = locator<LocationService>();
  final geolocatorService _geolocatorService = locator<geolocatorService>();

  final TextEditingController addressControler = TextEditingController();

  void onUnitChangeSelected(String value ){
    unitSelected = value;
    setBusy(false);
  }
  bool ChangeVisibility(){
    if ( units == null || units.isEmpty){
      return false;
    }
    else{
      return true;
    }
  }
  void getCompanyUnit(String code) async{
    setBusy(false);
    units.clear();
    unitSelected = null;
    final unit = await _apiService.getCompanyUnit(code);
    if (unit != null){
      unit.data.forEach((value) {units.add(value);});
    }
    setBusy(false);
  }
  void openLocationSetting() async {
    await _locationService.CheckService();
  }
  Future<void> cameraView(String type) async {
    setBusy(true);
    final path = await _navigationService.navigateto(CameraViewRoute);
    if (type == "KTP"){
      imagePath = path.toString().split('#')[0];
    } else if (type == "KK") {
      imagePathKk = path.toString().split('#')[0];
    } else if (type == "Profile") {
      imagePathProfile = path.toString().split('#')[0];
    }
    setBusy(false);
  }
  bool isPathNull(String type){
    if (type == "KTP"){
      if(imagePath == null || imagePath.isEmpty){
        return false;
      }
    } else if (type == "KK") {
      if (imagePathKk == null || imagePathKk.isEmpty){
        return false;
      }
    } else if (type == "Profile") {
      if (imagePathProfile == null || imagePathProfile.isEmpty){
        return false;
      }
    }
    return true;
  }
  void HandleTap(Position, LatLng latLng){
    setBusy(true);
    lat = latLng.latitude;
    long = latLng.longitude;
    MyPoint.clear();
    MyPoint.add(Marker(
      width: 80,
      height: 80,
      point: latLng,
      builder: (ctx) => Container(
        child: Icon(
          Icons.location_on,
        ),
      )
    ));
  }
  Future<void> getLocation() async{
    setBusy(true);
    try{
      MyPoint.clear();
      final UserLocation? userLocation = await _geolocatorService.GetCurrentLocation();
      lat = userLocation!.latitude ;
      long = userLocation.longitude;
      MyPoint.add(Marker(
          width: 80,
          height: 80,
          point: LatLng(lat,long),
          builder: (ctx) => Container(
            child: Icon(
              Icons.location_on,
            ),
          )
      ));
      setBusy(false);
    }catch(e){
      setBusy(false);
    }
  }
  void initState()async{
    setBusy(true);
    openLocationSetting();
    await getLocation();
    setBusy(false);
  }
}