import 'package:flutter/material.dart';
import 'home_appbar.dart';
import 'popular/popular_movies_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: homeAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PopularMoviesWidget(),
            ),
          ],
        ));
  }
}
