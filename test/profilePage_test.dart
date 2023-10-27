// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:um_media/Views/Profile/ProfilePage.dart';
//
// void main() {
//   testWidgets('ProfilePage Widget Test', (WidgetTester tester) async {
//     // Build our widget and trigger a frame.
//     await tester.pumpWidget(
//       // ProfilePage(),
//     );
//
//     // Verify that the page contains necessary widgets.
//     expect(find.text('Profile'), findsOneWidget);
//     expect(find.byType(Image), findsOneWidget);
//     expect(find.text('Name'), findsOneWidget);
//     expect(find.text('Interests'), findsOneWidget);
//     expect(find.text('Age'), findsOneWidget);
//     expect(find.text('Address'), findsOneWidget);
//     expect(find.text('Weight (kg)'), findsOneWidget);
//     expect(find.text('Height (ft)'), findsOneWidget);
//     expect(find.text('Save Changes'), findsOneWidget);
//
//     // Add more specific tests based on your widget's functionality.
//
//     // Example: Tap on the save button and check if the dialog appears.
//     await tester.tap(find.text('Save Changes'));
//     await tester.pump();
//     expect(find.text('Empty Fields'), findsOneWidget);
//
//     // Example: Enter values into some text fields and check if the dialog changes.
//     await tester.enterText(find.byType(TextField).first, 'John Doe');
//     await tester.enterText(find.byType(TextField).at(1), '25');
//     // Add similar lines for other text fields.
//
//     await tester.tap(find.text('Save Changes'));
//     await tester.pump();
//     expect(find.text('To be Implemented'), findsOneWidget);
//   });
// }
