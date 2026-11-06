
import 'package:flutter/material.dart';

import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const RajangRiverCruiseApp());
}

class RajangRiverCruiseApp extends StatefulWidget {
  const RajangRiverCruiseApp({super.key});

  @override
  State<RajangRiverCruiseApp> createState() =>
      _RajangRiverCruiseAppState();
}

class _RajangRiverCruiseAppState
    extends State<RajangRiverCruiseApp> {

  late final CruiseBookingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CruiseBookingViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rajang River Cruise',

          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.indigo,
              brightness: _viewModel.isDarkMode
                  ? Brightness.dark
                  : Brightness.light,
            ),
          ),

          home: CruiseBookingScreen(
            viewModel: _viewModel,
          ),
        );
      },
    );
  }
}
