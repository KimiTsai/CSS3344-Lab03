
import 'package:flutter/foundation.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {

  // Cruise destination information
  final CruiseDestination destination =
  const CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the beauty of the Rajang River '
        'and discover the cultural heritage of Sibu. '
        'Enjoy scenic river views and explore local '
        'traditions during your cruise.',
    imagePath: 'assets/images/rajang_river.jpg',
    initialStarCount: 43,
  );

  // Available cruise packages
  final List<String> cruisePackages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  // Application state
  DateTime? _selectedDate;
  String _selectedPackage = 'Private River Cruise';
  bool _isDarkMode = false;
  bool _isStarred = false;

  // Getters
  DateTime? get selectedDate => _selectedDate;

  String get selectedPackage => _selectedPackage;

  bool get isDarkMode => _isDarkMode;

  bool get isStarred => _isStarred;

  int get starCount =>
      destination.initialStarCount + (_isStarred ? 1 : 0);

  // Update selected cruise date
  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  // Update selected cruise package
  void setSelectedPackage(String package) {
    if (cruisePackages.contains(package)) {
      _selectedPackage = package;
      notifyListeners();
    }
  }

  // Toggle between light and dark themes
  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  // Increase or decrease the star count
  void toggleStar() {
    _isStarred = !_isStarred;
    notifyListeners();
  }
}
