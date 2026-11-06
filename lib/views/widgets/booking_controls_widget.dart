
import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class PreferenceSection extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const PreferenceSection({
    super.key,
    required this.viewModel,
  });

  // Select cruise booking date
  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate ?? today,
      firstDate: today,
      lastDate: DateTime(today.year + 3, 12, 31),
    );

    if (picked != null) {
      viewModel.setSelectedDate(picked);
    }
  }

  // Format the selected date
  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'Not selected';
    }

    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');

    return '$day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, child) {
        return Card(
          margin: const EdgeInsets.all(16),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trip Preferences',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Divider(height: 24),

                // Visit Date Picker
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.calendar_month,
                  ),
                  title: const Text('Cruise Date'),
                  subtitle: Text(
                    _formatDate(viewModel.selectedDate),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  onTap: () => _selectDate(context),
                ),

                const SizedBox(height: 16),

                // Cruise Package Dropdown
                const Text(
                  'Cruise Package',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                DropdownButton<String>(
                  value: viewModel.selectedPackage,
                  isExpanded: true,
                  items: viewModel.cruisePackages.map(
                        (String package) {
                      return DropdownMenuItem<String>(
                        value: package,
                        child: Text(package),
                      );
                    },
                  ).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      viewModel.setSelectedPackage(newValue);
                    }
                  },
                ),

                const SizedBox(height: 16),

                // Dark Mode Switch
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Dark Mode'),
                  subtitle: const Text(
                    'Switch between light and dark theme',
                  ),
                  secondary: const Icon(
                    Icons.dark_mode,
                  ),
                  value: viewModel.isDarkMode,
                  onChanged: viewModel.setDarkMode,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
