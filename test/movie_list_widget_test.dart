import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:inferno/src/views/widgets/movie_list.dart';

void main() {
  testWidgets("movie list widget test", (tester) async {

    await tester.pumpWidget(const MovieList());

    expect(find.byType(Card), findsWidgets);

  });
}
