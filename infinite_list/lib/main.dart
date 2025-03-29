import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/post_bloc.dart';
import 'services/post_service.dart';
import 'screens/post_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(postService: PostService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const PostListScreen(),
      ),
    );
  }
}
