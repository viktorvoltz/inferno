import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@Freezed()
class MovieModel with _$MovieModel {
  const factory MovieModel({
    final bool? adult,
  final String? backdropPath,
  final List<int>? genreIds,
  final int? id,
  final String? originalLanguage,
  final String? originalTitle,
  final String? overview,
  final num? popularity,
  final String? posterPath,
  final String? releaseDate,
  final String? title,
  final bool? video,
  final num? voteAverage,
  final num? voteCount,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
}