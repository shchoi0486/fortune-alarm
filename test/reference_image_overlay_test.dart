import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortune_alarm/features/mission_camera/mission_camera_screen.dart';

void main() {
  testWidgets('ReferenceImageOverlay is placed at top-right and shows label', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 400,
              height: 800,
              child: Stack(
                key: const Key('overlay_stack'),
                children: const [ReferenceImageOverlay(image: null)],
              ),
            ),
          ),
        ),
      ),
    );

    final imageBoxFinder = find.byKey(const Key('reference_image_box'));
    final labelChipFinder = find.byKey(const Key('reference_label_chip'));
    expect(imageBoxFinder, findsOneWidget);
    expect(labelChipFinder, findsOneWidget);
    expect(find.text('목표물'), findsOneWidget);

    final parentTopLeft = tester.getTopLeft(find.byKey(const Key('overlay_stack')));
    final parentTopRight = tester.getTopRight(find.byKey(const Key('overlay_stack')));
    final imageTopLeft = tester.getTopLeft(imageBoxFinder);
    final imageTopRight = tester.getTopRight(imageBoxFinder);

    expect(imageTopLeft.dy - parentTopLeft.dy, closeTo(90, 0.1));
    expect(parentTopRight.dx - imageTopRight.dx, closeTo(16, 0.1));
    expect(imageTopRight.dx - imageTopLeft.dx, closeTo(100, 0.1));
  });
}
