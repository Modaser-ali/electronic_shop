import 'package:electronic_shop/app_theme.dart';
import 'package:electronic_shop/frontend/buy_page.dart';
import 'package:electronic_shop/methods/clothes.dart';
import 'package:electronic_shop/methods/provider_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderManagement>(
      builder: (context, providerValue, child) {
        return GridView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: providerValue.userFavoriteList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        BuyPage(clothe: clothes[index], index: index)));
              },
              child: Card(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      providerValue.userFavoriteList[index].name,
                      style: appTheme().textTheme.headline1,
                      maxLines: 1,
                    ),
                    Image.asset(
                      providerValue.userFavoriteList[index].imagePath,
                      height: 75,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '\$${providerValue.userFavoriteList[index].price}',
                          style: appTheme().textTheme.headline3,
                        ),
                        const IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
