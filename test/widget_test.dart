import 'package:flutter_test/flutter_test.dart';
import 'package:agent_valo_app/main.dart';

void main() {
  testWidgets('Home page menampilkan judul', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Agent Valorant'), findsOneWidget);
  });
}
  