import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:noon/src/view/film/models/film_stack.dart';

final filmsStackProvider = StateNotifierProvider<FlilmStack, List<int>>((ref) {
  return FlilmStack();
});
