
import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final String imagePath;

  const ImageSection({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: 220,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 220,
            color: Theme.of(context)
                .colorScheme
                .surfaceContainerHighest,
            alignment: Alignment.center,
            child: const Text(
              'Rajang River image not found',
            ),
          );
        },
      ),
    );
  }
}
