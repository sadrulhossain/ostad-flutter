import 'package:flutter/material.dart';
import 'package:ostad_flutter/core/constants/Constants.dart';
import 'package:ostad_flutter/core/utils/lang/en/Label.dart';
import 'package:ostad_flutter/presentation/controllers/ProductController.dart';
import 'package:ostad_flutter/presentation/widgets/AppBarDefault.dart';
import 'package:ostad_flutter/presentation/widgets/ElevatedButtonDefault.dart';
import 'package:ostad_flutter/presentation/widgets/RoundFloatingActionButton.dart';
import 'package:ostad_flutter/presentation/widgets/TextFieldDefault.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductState();
}

class _ProductState extends State<ProductScreen> {
  final ProductController productController = ProductController();

  Future<void> fetchProducts() async {
    await productController.fetchProducts();
  }

  Future<void> createProduct(Map product) async {
    await productController.createProduct(product);
  }

  @override
  initState() {
    super.initState();
    fetchProducts();
  }
  void productDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController codeController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    TextEditingController qtyController = TextEditingController();
    TextEditingController unitPriceController = TextEditingController();
    TextEditingController totalPriceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Label.createNewProduct),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldDefault(label: Label.name, controller: nameController),
            TextFieldDefault(label: Label.code, controller: codeController),
            TextFieldDefault(label: Label.image, controller: imageController),
            TextFieldDefault(label: Label.qty, controller: qtyController),
            TextFieldDefault(label: Label.unitPrice, controller: unitPriceController),
            TextFieldDefault(label: Label.totalPrice, controller: totalPriceController),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButtonDefault(
                  onPressed: () => Navigator.pop(context),
                  label: Label.close,
                  backgroundColor: Colors.white12,
                ),
                SizedBox(width: 10),
                ElevatedButtonDefault(
                  onPressed: () {
                    createProduct({
                      'name'       : nameController.text,
                      'code'       : codeController.text,
                      'img'        : imageController.text,
                      'qty'        : qtyController.text,
                      'unitPrice'  : unitPriceController.text,
                      'totalPrice' : totalPriceController.text,
                    });
                    Navigator.pop(context);
                  },
                  label: Label.save,
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(title: Label.productList),
      floatingActionButton: RoundFloatingActionButton(
        onPressed: () => productDialog(context),
        icon: Icons.add,
      ),
      body: ListView.builder(
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          var product = productController.products[index];
          return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.network(product['Img']),
                ),
                title: Text(product['ProductName'], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${Label.price}: \$${product['UnitPrice']} | ${Label.qty}: ${product['Qty']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => productDialog(context),
                      icon: Icon(Icons.edit, color: Colors.deepPurple),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),

                  ],
                ),

              ),
            );
        },
      ),
    );
  }

}