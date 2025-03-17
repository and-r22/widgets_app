import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  SlideInfo(this.title, this.caption, this.imageUrl);

  final String title;
  final String caption;
  final String imageUrl;
}

final slides = <SlideInfo> [
  SlideInfo('Busca la comida', 'Cupidatat ut qui ullamco ipsum amet officia sunt nostrud laborum Lorem amet veniam consectetur.', 'assets/images/1.png'),
  SlideInfo('Entrega rpida', 'Amet fugiat mollit et ex sunt duis officia duis tempor.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Ipsum amet officia eu nulla aliquip qui velit proident aliqua quis exercitation tempor laboris id.', 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {

  static const name = 'app_tutorial_screen';
  
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageviewControler = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewControler.addListener(() {
      
      final page = pageviewControler.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }

    });

  }

  @override
  void dispose() {
    pageviewControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          PageView(
            controller: pageviewControler,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl,
              )
            ).toList()
          ),

          Positioned(
            right: 20,
            top: 30,
            child: TextButton(
              onPressed: () => context.pop(), 
              child: const Text('Salir'),
            )
          ),

          if (endReached) Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () => context.pop(), 
                child: const Text('Comenzar'),
              ),
            ),
          ) else const SizedBox(),

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
    required this.imageUrl,
  });

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
            Image(image: AssetImage(imageUrl),),
            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10,),
            Text(caption, style: captionStyle,),

          ],
        ),
      ),
    );
  }
}