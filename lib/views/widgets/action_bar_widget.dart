
import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(
            context,
            Icons.call,
            'CALL',
            iconColor,
                () => _showMessage(
              context,
              'Call button selected',
            ),
          ),
          _buildActionButton(
            context,
            Icons.near_me,
            'ROUTE',
            iconColor,
                () => _showMessage(
              context,
              'Route button selected',
            ),
          ),
          _buildActionButton(
            context,
            Icons.share,
            'SHARE',
            iconColor,
                () => _showMessage(
              context,
              'Share button selected',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context,
      IconData icon,
      String label,
      Color color,
      VoidCallback onPressed,
      ) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
