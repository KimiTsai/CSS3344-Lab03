
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rajang_river_cruise/main.dart';

void main() {
  testWidgets('Rajang River Cruise app loads correctly',
          (WidgetTester tester) async {

        // Launch the Lab 03 application
        await tester.pumpWidget(const RajangRiverCruiseApp());

        // Check application title
        expect(
          find.text('Sibu River Cruise & Heritage'),
          findsOneWidget,
        );

        // Check cruise destination name
        expect(
          find.text('Rajang River Express Cruise'),
          findsOneWidget,
        );

        // Check cruise location
        expect(
          find.text('Sibu Waterfront, Sarawak'),
          findsOneWidget,
        );

        // Check initial star count
        expect(
          find.text('43'),
          findsOneWidget,
        );
      });

  testWidgets('Star rating changes when clicked',
          (WidgetTester tester) async {

        await tester.pumpWidget(const RajangRiverCruiseApp());

        // Initial star count
        expect(find.text('43'), findsOneWidget);

        // Tap the star button
        await tester.tap(find.byIcon(Icons.star_border));
        await tester.pump();

        // Star count should increase to 44
        expect(find.text('44'), findsOneWidget);
      });
}
