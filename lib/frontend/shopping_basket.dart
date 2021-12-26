import 'package:electronic_shop/app_theme.dart';
import 'package:electronic_shop/methods/clothes.dart';
import 'package:electronic_shop/methods/provider_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingBasket extends StatelessWidget {
  const ShoppingBasket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderManagement>(
        builder: (context, providerValue, child) {
      return Scaffold(
        body: ListView.builder(
          itemCount: providerValue.shoppingBasket.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 100,
              width: double.maxFinite,
              child: Card(
                margin: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(providerValue.shoppingBasket[index].imagePath),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          providerValue.shoppingBasket[index].name,
                          style: AppTheme().textTheme.headline2,
                        ),
                        Text(
                          'Amount: ${providerValue.amountOfPurchases[index]}',
                          style: AppTheme().textTheme.headline5,
                        ),
                        Text(
                          "Price: \$${providerValue.shoppingBasket[index].price * providerValue.amountOfPurchases[index]}",
                          style: AppTheme()
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.green),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.redAccent,
                          size: 30,
                        ))
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: ElevatedButton.icon(
            style:
                ElevatedButton.styleFrom(elevation: 20, primary: Colors.green),
            onPressed: () {
              double totalPrice = 0;
              // providerValue.getTotalPrice(totalPrice);
              for (var i = 0; i < providerValue.shoppingBasket.length; i++) {
                totalPrice += providerValue.shoppingBasket[i].price *
                    providerValue.amountOfPurchases[i];
              }

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    alignment: Alignment.center,
                    actionsAlignment: MainAxisAlignment.center,
                    content: Text(
                      "Total Price: \$${totalPrice}",
                      style: AppTheme().textTheme.headline3,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Done",
                            style: AppTheme().textTheme.headline4,
                          ))
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.done),
            label: const Text('Buy now')),
      );
    });
  }
}
