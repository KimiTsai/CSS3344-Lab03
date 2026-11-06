
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String name;
  final String location;
  final int starCount;
  final bool isStarred;
  final VoidCallback onStarTap;

  const TitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.starCount,
    required this.isStarred,
    required this.onStarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onStarTap,
            icon: Icon(
              isStarred ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
          ),
          Text(
            '$starCount',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
