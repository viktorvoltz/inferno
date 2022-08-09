import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inferno/src/providers/providers.dart';

import '../../enums/movie_type.dart';

class Title extends ConsumerWidget{
  const Title({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final MovieType movieType = ref.watch(movieTypeProvider);
    return Text(
      "${movieType.name} movies"
    );
  }
}