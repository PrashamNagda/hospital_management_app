import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Get the user's geolocation
                Position position = await _determinePosition();

                // Log the position for debugging (you can use it as needed)
                print(
                    'User location: ${position.latitude}, ${position.longitude}');

                // Navigate to ChooseCategoryScreen after logging in and getting location
                Navigator.pushReplacementNamed(context, '/chooseCategory');
              },
              child: Text('Login'),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to determine position
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // If location services are not enabled, prompt the user to turn it on
      return Future.error('Location services are disabled.');
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // If permission is denied, return an error
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // If permissions are permanently denied, return an error
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // If everything is fine, get the current position of the user
    return await Geolocator.getCurrentPosition();
  }
}
