import 'package:geolocator/geolocator.dart';

class Location {
  double _lattitude;
  double _longitude;



  Future<void> getCurrentLocation() async{
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _lattitude = position.latitude;
      _longitude = position.longitude;
    }
    catch (exception){ 
      print(exception);
    }
    return;
  }
  double getLattitude() {
    return _lattitude;
  }

  double getLongitude() {
    return _longitude;
  }

}