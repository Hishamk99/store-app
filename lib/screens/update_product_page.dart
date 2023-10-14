import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatelessWidget {
  UpdateProductPage({super.key});
  static String id = 'product update';
  String? name, decs, image;
  double? price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Product',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustemTextField(
                onChanged: (data) {
                  name = data;
                },
                hinText: 'Product Name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustemTextField(
                onChanged: (data) {
                  decs = data;
                },
                hinText: 'Description',
              ),
              const SizedBox(
                height: 10,
              ),
              CustemTextField(
                onChanged: (data) {
                  price = double.parse(data);
                },
                hinText: 'Price',
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              CustemTextField(
                onChanged: (data) {
                  image = data;
                },
                hinText: 'Image',
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                title: 'Update',
                onTap: () {
                  UpdateProductService().apdateProduct(
                      title: name!,
                      image: image!,
                      desc: decs!,
                      price: price.toString(),
                      category: product.caregory);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
