import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/cubit/movie_cubit.dart';

import 'model/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> popular;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 129, 116, 160),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 23, 82),
        title: const Text(
          'Phoveus App',
          style: TextStyle(
            color: Color.fromARGB(255, 239, 182, 200),
          ),
        ),
        leading: Icon(
          Icons.menu,
          color: Color.fromARGB(255, 168, 136, 181),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.search_rounded,
            color: Color.fromARGB(255, 168, 136, 181),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.notifications,
            color: Color.fromARGB(255, 168, 136, 181),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            Text(
              'Popular',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromARGB(255, 239, 182, 200),
              ),
            ),
            BlocBuilder<MovieCubit, MovieState>(
              builder: (context, state) {
                if (state is MovieInitial) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is MovieLoaded) {
                  final movie = state.movie;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: movie.results?.length ?? 0,
                      itemBuilder: (context, index) {
                        final result = movie.results![index];
                        return ListTile(
                          title: Text(result.title ?? 'No Title'),
                        );
                      },
                    ),
                  );
                } else if (state is MovieError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return Center(child: Text('No data available.'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
