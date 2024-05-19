import 'dart:async';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:um_media/Controller/RentalsController.dart';
import 'package:um_media/Controller/RoosterController.dart';
import 'package:um_media/Controller/StudioController.dart';
import 'package:um_media/Controller/TalentController.dart';


void main() {
  group('Controller Tests', () {


    test('Rentals will be Populated.', () async {
      final _rentalController = RentalController();
      await _rentalController.getRentals();
      expect(_rentalController.getRentalsList.isNotEmpty, true);

      for (var rental in _rentalController.getRentalsList) {
        expect(rental.id, isNotNull, reason: "\u001b[31m❌ Rental ID is null\u001b[0m");
        expect(rental.name, isNotNull, reason: "\u001b[31m❌ Rental Name is null\u001b[0m");
        expect(rental.image, isNotNull, reason: "\u001b[31m❌ Rental Image is null\u001b[0m");
        expect(rental.type, isNotNull, reason: "\u001b[31m❌ Rental Type is null\u001b[0m");
      }
      print("\u001b[32m ✅ Rentals are populated as expected!\u001b[0m");
    });

    test("Rooster Will be Populated", () async {
      final _roosterController = RoosterController();
      await _roosterController.fetchAll();
      expect(_roosterController.roosterList.isNotEmpty, true,
          reason: "\u001b[31m ❌ Rooster is not being fetched\u001b[0m");

      for (var rooster in _roosterController.roosterList) {
        expect(rooster.id, isNotNull, reason: "\u001b[31m❌ Rooster ID is null\u001b[0m");
        expect(rooster.interests, isNotNull, reason: "\u001b[31m❌ Rooster Interests is null\u001b[0m");
      }
      print("\u001b[32m ✅ Rooster is populated as expected!\u001b[0m");
    });

    test("Studio's will be Populated", () async {
      final _studioController = StudioController();
      await _studioController.fetchAll();
      expect(_studioController.studios.isNotEmpty, true,
          reason: "\u001b[31m ❌ Studios are not being fetched\u001b[0m");

      for (var studio in _studioController.studios) {
        expect(studio.id, isNotNull, reason: "\u001b[31m ❌ Studio ID is null\u001b[0m");
        expect(studio.name, isNotNull, reason: "\u001b[31m ❌ Studio Name is null\u001b[0m");
        expect(studio.image, isNotNull, reason: "\u001b[31m ❌ Studio Image is null\u001b[0m");
      }
      print("\u001b[32m ✅ Studios are populated as expected!\u001b[0m");
    });

    test("Talents Will be Populated", () async {
      final _talentController = TalentController();
      await _talentController.fetchAll();
      expect(_talentController.categories.isNotEmpty, true,
          reason: "\u001b[31m ❌ Talents are not being fetched\u001b[0m");

      for (var talent in _talentController.categories) {
        expect(talent.id, isNotNull, reason: "\u001b[31m ❌ Talent ID is null\u001b[0m");
        expect(talent.name, isNotNull, reason: "\u001b[31m ❌ Talent Name is null\u001b[0m");
        expect(talent.photo, isNotNull, reason: "\u001b[31m ❌ Talent Photo is null\u001b[0m");
      }
      print("\u001b[32m ✅ Talents are populated as expected!\u001b[0m");
    });
  });
}
