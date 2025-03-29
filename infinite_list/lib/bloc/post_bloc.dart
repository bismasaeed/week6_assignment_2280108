import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/post_model.dart';
import '../services/post_service.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostService postService;

  PostBloc({required this.postService}) : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  void _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await postService.fetchPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
