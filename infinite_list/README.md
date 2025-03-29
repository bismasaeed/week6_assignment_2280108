# infinite_list

Overview

This Flutter project demonstrates how to fetch API data using Flutter BLoC for state management.

It follows a clean architecture, separating the UI, business logic, and data layers for better scalability and maintainability.

The app retrieves a list of posts from the JSONPlaceholder API and displays them in a user-friendly interface.

Project Structure

models/ → Contains post_model.dart, which defines the Post object and handles JSON serialization.

services/ → Includes post_service.dart, responsible for making API requests and fetching data.

blocs/ → Contains post_bloc.dart, post_event.dart, and post_state.dart, which manage the app’s state.

screens/ → Holds post_list_screen.dart, which builds the UI and interacts with the BLoC.

How It Works

When the app starts, PostListScreen sends a FetchPosts event to PostBloc.

PostBloc calls PostRepository to fetch data from the API.

While waiting, the UI displays a loading indicator.

If the API call is successful, a PostLoaded state is emitted, and the posts are displayed.

If an error occurs, a PostError state is emitted, and the user can retry via a floating action button.

Dependencies

flutter_bloc (for state management)

equatable (for easy state comparison)

http (for API requests)