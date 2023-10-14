import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> apdateProduct(
      {required String title,
      required String image,
      required String desc,
      required String price,
      required int id,
      required String category}) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'titlt': title,
        'price': price,
        'description': desc,
        'image': image,
        'ctegory': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
