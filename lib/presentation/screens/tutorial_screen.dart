import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
    this.title, 
    this.caption, 
    this.imageUrl
  );
}

final slides = <SlideInfo>{
  SlideInfo(
    'Buscar la comida', 
    'Aute culpa cillum dolor exercitation excepteur cupidatat minim laboris laboris consequat fugiat amet deserunt.', 
    'assets/images/1.png'
  ),
  SlideInfo(
    'Entrega rapida', 
    'Amet Lorem irure laborum adipisicing anim enim qui.', 
    'assets/images/2.png'
  ),
  SlideInfo(
    'Disfruta la comida', 
    'Velit proident incididunt in reprehenderit voluptate et reprehenderit nulla anim pariatur eu fugiat.', 
    'assets/images/3.png'
  ),
};

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {

  late final pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if(!endReached && page >= (slides.length -1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose(); /// limpia memoria
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller:pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideData) => _Slide(
              title: slideData.title, 
              caption: slideData.caption, 
              imageUrl: slideData.imageUrl
            )).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            )
          ),

          (endReached) 
          ? Positioned(
            right: 30,
            bottom: 30,
            child: FadeInRight(
              from: 15, /// Solo se mueva 15 unidades
              delay: const Duration(seconds: 1), /// Se demore 1 segundo en la entrada
              child: FilledButton(
                child: const Text('Iniciar'),
                onPressed: () => context.pop(),
              ),
            )
          )
          : const SizedBox()
          
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.titleLarge;
    final captionStyle = textTheme.bodySmall;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // => VertialOption
          crossAxisAlignment: CrossAxisAlignment.start, // => HorizontalOption
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}