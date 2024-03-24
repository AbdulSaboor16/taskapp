import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/component/carousel/view/carousel_view.dart';
import 'package:taskapp/features/home/controller/home_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              onTap: () => Get.offNamed('/login'),
            ),
          ],
        ),
      ),
      body: Obx(
        () => Skeletonizer(
          enabled: controller.isLoading.value,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageCarousel(),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    final item = controller.items[index];
                    return ListTile(
                      title: Text(item.name),
                      trailing: IconButton(
                        icon: Obx(() => Icon(item.isFavorite.value
                            ? Icons.favorite
                            : Icons.favorite_border)),
                        onPressed: () => controller.toggleFavorite(item.id),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.fetchData(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
