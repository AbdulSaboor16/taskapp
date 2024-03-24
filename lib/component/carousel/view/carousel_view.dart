import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:taskapp/component/carousel/controller/carousel_controller.dart';

class ImageCarousel extends StatelessWidget {
  final ImageCarouselController carouselController =
      Get.put(ImageCarouselController());

  ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            carouselController.setCurrentIndex(index);
          },
        ),
        items: carouselController.imgList
            .map((item) => GestureDetector(
                  onTap: () => carouselController.onImageTap(item),
                  child: CachedNetworkImage(
                    imageUrl: item,
                    fit: BoxFit.cover,
                    width: 1000,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ))
            .toList(),
      ),
      Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: carouselController.imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.setCurrentIndex(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(
                            carouselController.currentIndex.value == entry.key
                                ? 0.9
                                : 0.4),
                  ),
                ),
              );
            }).toList(),
          )),
    ]);
  }
}
