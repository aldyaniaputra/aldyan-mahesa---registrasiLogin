import 'package:geolocator/geolocator.dart';
import 'package:none/model/user_location.dart';

class geolocatorService{
  final Geolocator _geolocator = Geolocator();

  Future<UserLocation?> GetCurrentLocation() async{
    try {
      var underline = ' ';
      final Position? position = await Geolocator.getCurrentPosition();
      UserLocation userLocation = UserLocation(
        latitude: position!.latitude,
        longitude: position.longitude,
        addresline: underline ,
      );
      return userLocation;
    } catch(e){
      return null;
    }
  }
}