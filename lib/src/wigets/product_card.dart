import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/wigets/title_text.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  ProductCard({Key key, this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Product model;
  @override
  void initState() {
    model = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/detail', arguments: model);
        context.read<AppData>().selectProduct(model);
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.watch<AppData>().isProductSelected(model)
              ? Colors.orange[100]
              : LightColor.background,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: !model.isSelected ? 20 : 0),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                    icon: Icon(
                      context.watch<AppData>().isProductLiked(model)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: context.watch<AppData>().isProductLiked(model)
                          ? LightColor.red
                          : LightColor.iconColor,
                    ),
                    onPressed: () {
                      print('liked');
                      context.read<AppData>().likeProduct(model);
                    })),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    height: context.watch<AppData>().isProductSelected(model)
                        ? 15
                        : 0),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: LightColor.orange.withAlpha(40),
                    ),
                    Image(
                      image: AssetImage(model.image),
                      height: 100,
                      width: 100,
                    )
                  ],
                ),
                // SizedBox(height: 5),
                TitleText(
                  text: model.name,
                  fontSize: context.watch<AppData>().isProductSelected(model)
                      ? 16
                      : 14,
                ),
                TitleText(
                  text: model.category,
                  fontSize: context.watch<AppData>().isProductSelected(model)
                      ? 14
                      : 12,
                  color: LightColor.orange,
                ),
                TitleText(
                  text: model.price.toString(),
                  fontSize: context.watch<AppData>().isProductSelected(model)
                      ? 18
                      : 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
