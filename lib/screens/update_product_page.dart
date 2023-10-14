import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'product update';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? name, decs, image;

  double? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                  onTap: () async{
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void >updateProduct(ProductModel product)async {
    await UpdateProductService().apdateProduct(
        id: int.parse(product.id),
        title: name == null ? product.title : name!,
        image: image == null ? product.image : image!,
        desc: decs == null ? product.description: decs!,
        price: price == null ? product.price : price.toString(),
        category: product.caregory);
  }
}
