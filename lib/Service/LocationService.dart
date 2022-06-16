import 'package:location/location.dart';

class LocationService{
  bool _serviceEnable = false;
  Location location = new Location();
  Future<void> CheckService() async {
    _serviceEnable = await location.serviceEnabled();
    if (!_serviceEnable){
      _serviceEnable = await location.requestService();
      if (_serviceEnable){
        return;
      }
    }
  }
}