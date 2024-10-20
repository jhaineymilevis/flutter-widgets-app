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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const _TutorialView(),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Salir')))
        ],
      ),
    );
  }
}

class _TutorialView extends StatelessWidget {
  const _TutorialView();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      children: slides.map((slide) => _Slide(slide)).toList(),
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
