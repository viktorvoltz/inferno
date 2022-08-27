import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../costants.dart';
import '../enums/movie_type.dart';
import '../model/movie.dart';
import '../model/movie_model.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: EnvConstants.BASE_URL,
  ));
});

final movieTypeProvider = StateProvider<MovieType>((ref) => MovieType.popular);

final moviesProvider = FutureProvider<List<MovieModel>>((ref) async {
  final movieType = ref.watch(movieTypeProvider.state).state;
  final dio = ref.watch(dioProvider);
  final response = await dio.get('movie/${movieType.value}',
      queryParameters: {'api_key': EnvConstants.API_KEY});
  return MovieResponse.fromJson(response.data).results!;
});

final movieProvider = Provider<MovieModel>((_) => throw UnimplementedError());
