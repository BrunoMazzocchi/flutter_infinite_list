//In our PostsPage widget, we use BlocProvider to create and provide an
// instance of PostBloc to the subtree. Also, we add a PostFetched event
// so that when the app loads, it requests the initial batch of Posts.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/posts/posts.dart';
import 'package:http/http.dart' as http;


class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts')),
        body: BlocProvider(
          create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
          child: const PostsList(),
        )
    );
  }
}
