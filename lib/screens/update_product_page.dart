import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatelessWidget {
  const UpdateProductPage({super.key});
  static String id = 'product update';

  @override
  Widget build(BuildContext context) {
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
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustemFromTextField(
              hinText: 'Product Name',
            ),
            SizedBox(
              height: 10,
            ),
            CustemFromTextField(
              hinText: 'Description',
            ),
            SizedBox(
              height: 10,
            ),
            CustemFromTextField(
              hinText: 'Price',
            ),
            SizedBox(
              height: 10,
            ),
            CustemFromTextField(
              hinText: 'Image',
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              title: 'Update',
            ),
          ],
        ),
      ),
    );
  }
}
