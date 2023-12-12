// ignore_for_file: must_be_immutable
import 'package:ecom_app/utils/header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class AppPageView extends StatefulWidget {
  final String title;
  late List<String>? images;
  AppPageView({
    super.key,
    required this.title,
    this.images,
  });

  @override
  State<AppPageView> createState() => _AppPageViewState();
}

class _AppPageViewState extends State<AppPageView> {
  late InfiniteScrollController controller;

  // Parameters for Inputs
  late String title = widget.title;
  late List<String> images = widget.images ??
      [
        'https://picsum.photos/200',
        'https://picsum.photos/201',
        'https://picsum.photos/202',
        'https://picsum.photos/203',
        'https://picsum.photos/204',
      ];

  @override
  void initState() {
    super.initState();
    controller = InfiniteScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HeaderWidget(),
      appBar: appBar(context, title: title),
      body: Column(children: [
        carousel(context),
        SizedBox(
          height: 150,
          child: Column(
            children: [
              const Text('Product List'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/products',
                  );
                },
                child: const Text('Goto Next'),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 150,
          child: Text('Product Slider'),
        ),
      ]),
    );
  }

  SizedBox carousel(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: InfiniteCarousel.builder(
              itemCount: images.length,
              itemExtent: 100.0,
              center: true,
              anchor: 0.0,
              velocityFactor: 0.5,
              onIndexChanged: (index) {
                // print(index);
              },
              scrollBehavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  // Allows to swipe in web browsers
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse
                },
              ),
              controller: controller,
              axisDirection: Axis.horizontal,
              loop: true,
              itemBuilder: (context, itemIndex, realIndex) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    images[itemIndex],
                  ),
                );
              },
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // const Text('Product Slider Action'),
            ElevatedButton(
              onPressed: () {
                controller.previousItem();
              },
              child: const Text('Previous'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.nextItem();
              },
              child: const Text('Next'),
            ),
          ]),
        ],
      ),
    );
  }
}
