import 'package:get/get.dart';
import 'package:taskapp/component/carousel_full_screen/carousel_view.dart';

class ImageCarouselController extends GetxController {
  var currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void onImageTap(String imageUrl) {
    Get.to(() => FullScreenImageView(imageUrl: imageUrl));
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNhcnN8ZW58MHx8MHx8fDA%3D',
    'https://imgd.aeplcdn.com/370x208/n/cw/ec/130591/fronx-exterior-right-front-three-quarter-109.jpeg?isig=0&q=80',
    'https://images.carandbike.com/car-images/colors/maruti-suzuki/fronx/maruti-suzuki-fronx-splendid-silver-with-bluish-black.jpg?v=1682341203',
    'https://i.ytimg.com/vi/t_ma-TS6a08/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGFYgXShlMA8=&rs=AOn4CLBs1XyBxwVHqGQ4KphyGTgSqKN9Fw',
  ];
}
