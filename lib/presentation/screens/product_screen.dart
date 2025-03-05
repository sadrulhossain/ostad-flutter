import 'package:flutter/material.dart';
import 'package:ostad_flutter/core/utils/helper.dart';
import 'package:ostad_flutter/core/utils/lang/en/label.dart';
import 'package:ostad_flutter/data/models/product_model.dart';
import 'package:ostad_flutter/data/repositories/product_repository.dart';
import 'package:ostad_flutter/presentation/widgets/app_bar_default.dart';
import 'package:ostad_flutter/presentation/widgets/elevated_button_default.dart';
import 'package:ostad_flutter/presentation/widgets/product_card.dart';
import 'package:ostad_flutter/presentation/widgets/round_floating_action_button.dart';
import 'package:ostad_flutter/presentation/widgets/text_field_default.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductState();
}

class _ProductState extends State<ProductScreen> {
  final ProductRepository productRepo = ProductRepository();

  Future<void> _fetchAll() async {
    await productRepo.fetchAll();
    setState(() {});
  }

  Future<void> _store(Map<String, dynamic> product) async {
    setState(() async{
      await productRepo.store(product);
      _fetchAll();
    });
  }

  Future<void> _update(String id, Map<String, dynamic> product) async {
    setState(() async {
      await productRepo.update(id, product);
      _fetchAll();
    });
  }

  Future<void> _delete(String id) async {
    await productRepo.delete(id);
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    _fetchAll();
  }

  void _productDialog(BuildContext context, {Data? product}) {
    TextEditingController nameController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    TextEditingController qtyController = TextEditingController();
    TextEditingController unitPriceController = TextEditingController();
    TextEditingController totalPriceController = TextEditingController();

    String heading = Label.createNewProduct;
    String btnText = Label.save;
    if (product != null) {
      nameController.text = product.name.toString();
      imageController.text = product.img.toString();
      qtyController.text = product.qty.toString();
      unitPriceController.text = product.unitPrice.toString();
      totalPriceController.text = product.totalPrice.toString();

      heading = Label.editProduct;
      btnText = Label.update;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(heading),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldDefault(label: Label.name, controller: nameController),
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
                    if (product != null) {
                      _update(product.id.toString(), {
                        'name': nameController.text,
                        'code': product.code!,
                        'img': imageController.text,
                        'qty': int.parse(qtyController.text),
                        'unitPrice': int.parse(unitPriceController.text),
                        'totalPrice': int.parse(totalPriceController.text),
                      });
                    } else {
                      _store({
                        'name': nameController.text,
                        'code': DateTime.now().microsecondsSinceEpoch,
                        'img': imageController.text,
                        'qty': int.parse(qtyController.text),
                        'unitPrice': int.parse(unitPriceController.text),
                        'totalPrice': int.parse(totalPriceController.text),
                      });
                    }
                    Navigator.pop(context);
                  },
                  label: btnText,
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

  dynamic _deleteProduct(context, String id) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: Text('Confirmation'),
              content: Text('Are you sure for Delete?'),
              actions: [
                ElevatedButtonDefault(
                  onPressed: () => Navigator.pop(context),
                  label: Label.close,
                  backgroundColor: Colors.white12,
                ),
                ElevatedButtonDefault(
                  onPressed: () {
                    _delete(id);
                    Navigator.pop(context);
                    Helper.showSnackBar('Product has been deleted from the list.', context);
                  },
                  label: Label.delete,
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(title: Label.productList),
      floatingActionButton: RoundFloatingActionButton(
        onPressed: () => _productDialog(context),
        icon: Icons.add,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: productRepo.products.length,
          itemBuilder: (context, index) {
            var product = productRepo.products[index];
            return ProductCard(
              product: product,
              onEdit: () => _productDialog(context, product: product),
              onDelete: () => _deleteProduct(context, product.id.toString()),
            );
          },
        ),
      ),
    );
  }

}