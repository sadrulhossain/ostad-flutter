import 'package:flutter/material.dart';
import 'package:ostad_flutter/core/utils/lang/en/label.dart';
import 'package:ostad_flutter/data/models/product_model.dart';

class ProductCard extends StatelessWidget{
  final Data product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onDelete
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
              height: 140,
              color: Colors.grey.shade200,
              child: Image.network(product.img.toString(), fit: BoxFit.cover,),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: onEdit,
                        icon: Icon(Icons.edit, color: Colors.white,),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          
                        ),
                      ),
                      IconButton(
                        onPressed: onDelete,
                        icon: Icon(Icons.delete, color: Colors.white,),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}