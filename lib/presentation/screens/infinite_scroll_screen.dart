import 'package:animate_do/animate_do.dart';
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

  final scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void addImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(
      () {
        if (scrollController.position.pixels + 500 >=
            scrollController.position.maxScrollExtent) {
          loadNextPage();
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2)); // Simulate delay

    addImages();

    isLoading = false;

    if (!isMounted) return;
    setState(() {});

    //todo mover scroll
  }

  Future<void> onRefresh() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1)); // Simulate delay
    if (!isMounted) return;
    final lastId = imagesIds.last;
    isLoading = false;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addImages();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: isLoading
              ? FadeIn(child: const CircularProgressIndicator())
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined))),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                    width: double.infinity,
                    height: 300,
                    image: NetworkImage(
                        'https://picsum.photos/id/${imagesIds[index]}/500/300'));
              }),
        ),
      ),
    );
  }
}
