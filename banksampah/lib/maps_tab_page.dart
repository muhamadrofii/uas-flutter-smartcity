import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'open_maps.dart';

class MapsTabPage extends StatefulWidget {
  @override
  _MapsTabPageState createState() => _MapsTabPageState();
}

class _MapsTabPageState extends State<MapsTabPage> {
  String _currentLocation = 'Unknown';
  String _currentAddress = 'Unknown';
  double? _latitude;
  double? _longitude;

  @override
  void initState() {
    super.initState();
    _loadLocationAndAddress();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _currentLocation = 'Location permissions are denied';
          _currentAddress = '';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _currentLocation = 'Location permissions are permanently denied';
        _currentAddress = '';
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentLocation =
          'Lat: ${position.latitude}, Long: ${position.longitude}';
      _latitude = position.latitude;
      _longitude = position.longitude;
      // _isVisible = true
    });
    _getAddressFromCoordinates(position.latitude, position.longitude);
    _saveLocationAndAddress(_currentLocation, _currentAddress);
  }

  Future<void> _getAddressFromCoordinates(
      double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      setState(() {
        _currentAddress =
            '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
      });
    } else {
      setState(() {
        _currentAddress = 'Address not found';
      });
    }
    _saveLocationAndAddress(_currentLocation, _currentAddress);
  }

  Future<void> _saveLocationAndAddress(String location, String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('location', location);
    await prefs.setString('address', address);
  }

  Future<void> _loadLocationAndAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLocation = prefs.getString('location') ?? 'Unknown';
      _currentAddress = prefs.getString('address') ?? 'Unknown';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Maps',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_latitude != null && _longitude != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OpenMaps(
                        latitude: _latitude!,
                        longitude: _longitude!,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Dapatkan Lokasi Terlebih Dahulu')),
                  );
                }
              },
              child: Text('BUKA MAPS'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Text('DAPATKAN LOKASI'),
            ),
            SizedBox(height: 20),
            Text(
              'Lokasi Sekarang: $_currentLocation',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Text(
                'Alamat: $_currentAddress',
                style: TextStyle(color: Colors.black, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
