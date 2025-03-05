import 'package:flutter/material.dart';
import 'package:ostad_flutter/core/constants/constants.dart';
import 'package:ostad_flutter/core/utils/lang/en/label.dart';
import 'package:ostad_flutter/data/models/product_model.dart';
import 'package:ostad_flutter/presentation/widgets/outlined_round_border_icon_button.dart';

class ProductCard extends StatelessWidget{
  final Data product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
              spreadRadius: 2, // Spread radius
              blurRadius: 10, // Blur radius
              offset: Offset(4, 4), // Shadow position (X, Y)
            )
          ]
      ),
      child: Column(
        children: [
          ClipRect(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 140,
              color: Colors.white,
              child: Image.network(
                product.img.toString(),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator(
                    color: Colors.red,
                  ));
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(Constants.noImage, fit: BoxFit.cover,);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${Label.price}: ${product.unitPrice} | ${Label.qty}: ${product.qty}',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedRoundBorderIconButton(
                      onPressed: onEdit,
                      icon: Icons.edit,
                      paddingHorizontal: 30,
                      paddingVertical: 3,
                    ),
                    OutlinedRoundBorderIconButton(
                      onPressed: onDelete,
                      icon: Icons.delete,
                      paddingHorizontal: 30,
                      paddingVertical: 3,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}