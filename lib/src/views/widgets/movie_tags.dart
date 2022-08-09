import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inferno/src/providers/providers.dart';

import '../../enums/movie_type.dart';

class MovieTags extends ConsumerWidget {
  const MovieTags({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final MovieType movieType = ref.watch(movieTypeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: MovieType.values
      .map((type) => InkWell(
        onTap: () => ref.read(movieTypeProvider.notifier)
        .state = type,
        child: Chip(
          label: Text(
            type.name,
          ),
          backgroundColor: type == movieType ? Colors.blue : null,
        ),
      ))
      .toList(),
    );
  }
}