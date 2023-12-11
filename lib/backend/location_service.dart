

class LocationService {
  String _start = "1234 Customer Street, Pittsburgh PA, 15213";
  String _destination = "4321 Restaurant Ave, Pittsburgh PA, 15213";
  int _travelTimeMinutes = 10;

  void setStart(String? start) {
    _start = start!;
  }
  void setDestination(String? destination) {
    _destination = destination!;
  }
  int getTravelTime() {
    print(_start);
    print(_destination);
    return _travelTimeMinutes;
  }
}