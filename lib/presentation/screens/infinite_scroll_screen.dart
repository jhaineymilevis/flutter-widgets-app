import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScren extends StatefulWidget {
  static const name = 'infinite_scroll_screen';
  const InfiniteScrollScren({super.key});

  @override
  State<InfiniteScrollScren> createState() => _InfiniteScrollScrenState();
}

class _InfiniteScrollScrenState extends State<InfiniteScrollScren> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(itemBuilder: (context, index) {
          return FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              height: 300,
              image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300'));
        }),
      ),
    );
  }
}
