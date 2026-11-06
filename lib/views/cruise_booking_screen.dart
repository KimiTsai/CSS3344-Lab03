
import 'package:flutter/material.dart';

import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sibu River Cruise & Heritage'),
        centerTitle: true,
        backgroundColor:
        Theme.of(context).colorScheme.primaryContainer,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _buildPortraitView();
          } else {
            return _buildLandscapeView();
          }
        },
      ),
    );
  }

  // Portrait: All sections arranged vertically
  Widget _buildPortraitView() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        ImageSection(
          imagePath: viewModel.destination.imagePath,
        ),

        _buildTitleSection(),

        const ButtonSection(),

        TextSection(
          description: viewModel.destination.description,
        ),

        PreferenceSection(
          viewModel: viewModel,
        ),
      ],
    );
  }

  // Landscape: Image left, details right
  Widget _buildLandscapeView() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ImageSection(
              imagePath: viewModel.destination.imagePath,
            ),
          ),
        ),

        Expanded(
          flex: 1,
          child: ListView(
            children: [
              _buildTitleSection(),

              const ButtonSection(),

              TextSection(
                description:
                viewModel.destination.description,
              ),

              PreferenceSection(
                viewModel: viewModel,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Reusable title with dynamic star rating
  Widget _buildTitleSection() {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, child) {
        return TitleSection(
          name: viewModel.destination.name,
          location: viewModel.destination.location,
          starCount: viewModel.starCount,
          isStarred: viewModel.isStarred,
          onStarTap: viewModel.toggleStar,
        );
      },
    );
  }
}
