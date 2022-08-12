import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inferno/src/views/widgets/movie_list.dart';
import 'package:inferno/src/views/widgets/movie_tags.dart';

class HomePage extends ConsumerWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: MovieTags(),
          ),
          SizedBox(height: 3,),
          MovieList(),
        ],
      ),
    );
  }
}