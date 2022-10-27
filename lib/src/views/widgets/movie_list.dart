import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../costants.dart';
import '../../providers/providers.dart';
import '../movie_details_page.dart';
import '../../adaptive_screen.dart';

class MovieList extends ConsumerWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final moviesAsyncValue = ref.watch(moviesProvider);
    return moviesAsyncValue.maybeWhen(
      orElse: () => const Center(child: CircularProgressIndicator()),
      data: (movies) => Container(
        height: 0.85.defaultHeight(),
        child: GridView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            final movie = movies[index];
            print(movie.posterPath);
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(seconds: 1),
                    pageBuilder: (context, _, __) => ProviderScope(
                      overrides: [movieProvider.overrideWithValue(movie)],
                      child: const MovieDetailsPage(),
                    ),
                  ),
                );
              },
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "${EnvConstants.IMAGE_BASE_URL}${movie.posterPath}",
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text("${movie.title}")
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        ),
      ),
    );
  }
}
