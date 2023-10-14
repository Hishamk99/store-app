import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductService().getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        1.5, // remove width and height of container
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CustomCard(product: products[index],);
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
