import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aflami/constants/api.dart';
import 'package:aflami/services/dio_client.dart';
import 'package:aflami/src/view/home/models/trending/trending_model.dart';
import 'package:aflami/states/global/global_state.dart';

/// helper provider for handling state and better bu
// final trendingReboProvider = StateProvider<GlobalState>((ref) {
//   return const GlobalState.initial();
// });

final trendingProvider =
    StateNotifierProvider<TrendingNotifier, GlobalState<List<FilmModel>>>(
        (ref) {
  return TrendingNotifier();
});

class TrendingNotifier extends StateNotifier<GlobalState<List<FilmModel>>> {
  TrendingNotifier() : super(const GlobalState.initial()) {
    getFilms();
  }

  getFilms() async {
    // print('getting films');
    state = const GlobalState.loading();
    try {
      var res = await Net()
          .dio
          .get(
            Api.trendingMoviesday,
          )
          .then((value) {
        // print(value);
        state = GlobalState.loaded(
          (value.data['results'] as List<dynamic>)
              .map(
                (e) => FilmModel.fromJson(e),
              )
              .toList(),
        );
      });

      // print(res.);
    } catch (e) {
      // print('object');
      // print(e);
      state = GlobalState.error(e.toString(), null);
    }
  }
}
