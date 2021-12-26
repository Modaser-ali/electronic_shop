import 'package:electronic_shop/app_theme.dart';
import 'package:electronic_shop/methods/clothes.dart';
import 'package:electronic_shop/methods/provider_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyPage extends StatelessWidget {
  final Clothes clothe;
  final int index;
  const BuyPage({Key? key, required this.clothe, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: CustomScrollView(
          slivers: [
            _appBar(context),
            SliverList(
              delegate: SliverChildListDelegate(
                [_about(context)],
              ),
            ),
          ],
        ),
        floatingActionButton: Consumer<ProviderManagement>(
          builder: (context, providerValue, child) {
            return ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  elevation: 20, primary: Colors.green),
              onPressed: () {
                providerValue.addToShoppingBasket(index);
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add'),
            );
          },
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: MediaQuery.of(context).size.height / 1.75,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(clothe.name, style: AppTheme().textTheme.headline2),
                Consumer<ProviderManagement>(
                  builder: (context, providerValue, chile) {
                    return IconButton(
                      onPressed: () {
                        providerValue.editFavorite(index);
                      },
                      icon: providerValue.isFavorite[index]
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border_outlined),
                    );
                  },
                ),
              ],
            ),
            Hero(
              tag: "Image tag",
              child: Image.asset(
                clothe.imagePath,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _about(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ProviderManagement>(
                builder: (context, providerValue, child) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              providerValue.increaseAmount(index);
                            },
                            child: Text(
                              '+',
                              style: AppTheme()
                                  .textTheme
                                  .headline3
                                  ?.copyWith(fontSize: 24),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            child: Text(
                                '${providerValue.amountOfPurchases[index]}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 24)),
                          ),
                          TextButton(
                            onPressed: () {
                              providerValue.dicreaseAmount(index);
                            },
                            child: Text(
                              '-',
                              style: AppTheme()
                                  .textTheme
                                  .headline3
                                  ?.copyWith(fontSize: 24, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 10, bottom: 30),
                        child: Text(
                            'Price = \$${clothe.price * providerValue.amountOfPurchases[index]}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 22)),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 15, left: 15, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('* 100% Cotton',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                Text('* Imported',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                Text('* Machine Wash',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                Text(
                    '* This classic, versatile shirt provides a clean, buttoned-up look perfect for any occasion',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                Text(
                    '* Everyday made better: we listen to customer feedback and fine-tune every detail to ensure quality, fit, and comfort',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
