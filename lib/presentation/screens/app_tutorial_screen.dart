import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption: 'lorem ips amet',
      imageUrl: 'assets/1.png'),
  SlideInfo(
      title: 'Entrega rapida',
      caption: 'lorem ips amet in the form of a picture',
      imageUrl: 'assets/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      caption: 'lorem ips amet',
      imageUrl: 'assets/3.png'),
];

class AppTutorialScren extends StatelessWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScren({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: _TutorialView(),
    );
  }
}

class _TutorialView extends StatefulWidget {
  const _TutorialView();

  @override
  State<_TutorialView> createState() => _TutorialViewState();
}

class _TutorialViewState extends State<_TutorialView> {
  final pageViewController = PageController();
  bool endReach = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageViewController,
          physics: const BouncingScrollPhysics(),
          children: slides.map((slide) => _Slide(slide)).toList(),
        ),
        Positioned(
            top: 50,
            right: 20,
            child: TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Salir'))),
        endReach
            ? Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('Comenzar')),
                ))
            : const SizedBox()
      ],
    );
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(
      () {
        final page = pageViewController.page ?? 0;

        if (!endReach && page >= (slides.length - 1)) {
          setState(() {
            endReach = true;
          });
        }
      },
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slide;
  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(slide.imageUrl),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            slide.title,
            style: titleStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            slide.caption,
            style: captionStyle,
          ),
        ],
      )),
    );
  }
}
