import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';

import '../costants.dart';
import '../enums/movie_type.dart';
import '../model/movie.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: EnvConstants.BASE_URL,
  ));
});

final movieTypeProvider = StateProvider<MovieType>((ref) => MovieType.popular);

final moviesProvider = FutureProvider<List<Movie>>((ref) async {
  final movieType = ref.watch(movieTypeProvider.state);
  final dio = ref.watch(dioProvider);
  final response = await dio.get('movie/{movieType.value}',
      queryParameters: {'api_key': EnvConstants.API_KEY});
  return MovieResponse.fromJson(response.data).results!;
});
