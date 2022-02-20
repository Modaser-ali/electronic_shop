import 'package:electronic_shop/app_theme.dart';
import 'package:electronic_shop/frontend/buy_page.dart';
import 'package:electronic_shop/frontend/shopping_basket.dart';
import 'package:electronic_shop/methods/provider_management.dart';
import 'package:electronic_shop/methods/review.dart';
import 'package:flutter/material.dart';
import 'package:electronic_shop/methods/clothes.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({
    Key? key,
  }) : super(key: key);

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: _drawer(),
      body: Column(
        children: [
          _appBar(context),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height / 1.3
                : MediaQuery.of(context).size.height / 1.65,
            child: PageView.builder(
              reverse: true,
              itemCount: clothes.length,
              itemBuilder: (context, index) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _commodityCard(context, index),
                          const SizedBox(
                            height: 30,
                          ),
                          _theReviews()
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _card(
              child: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              size: 20,
            ),
          )),
          _card(
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search),
                  Text(
                    'Search',
                    style: appTheme().textTheme.headline1,
                  )
                ],
              ),
            ),
          ),
          Consumer<ProviderManagement>(
            builder: (context, providerValue, child) {
              return _card(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ShoppingBasket()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const IconButton(
                        onPressed: null,
                        disabledColor: Colors.black,
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text('${providerValue.shoppingBasket.length}',
                            style: appTheme().textTheme.headline1!),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _card({required Widget? child}) {
    return Card(
      child: child,
      elevation: 20,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    );
  }

  Widget _commodityCard(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BuyPage(
                  clothe: clothes[index],
                  index: index,
                )));
      },
      child: SizedBox(
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height / 2
            : MediaQuery.of(context).size.width / 2,
        width: double.maxFinite,
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.zero,
          child: Stack(
            children: [
              Positioned(
                top: 12,
                left: 15,
                child: Text(
                  clothes[index].name,
                  style: appTheme().textTheme.headline2,
                ),
              ),
              Hero(
                tag: "Image tag",
                child: Center(
                  child: Image.asset(
                    clothes[index].imagePath,
                    height: MediaQuery.of(context).size.height / 3.5,
                  ),
                ),
              ),
              Positioned(
                bottom: 60,
                left: 15,
                child: Text(
                  '\$${clothes[index].price}',
                  style: appTheme().textTheme.headline3,
                ),
              ),
              Positioned(
                bottom: 40,
                left: 15,
                child: Text(
                  'Shirt',
                  style: appTheme().textTheme.headline4,
                ),
              ),
              Consumer<ProviderManagement>(
                builder: (context, providerValue, chile) {
                  return Positioned(
                    bottom: 50,
                    right: 15,
                    child: IconButton(
                      onPressed: () {
                        providerValue.editFavorite(index);
                      },
                      icon: providerValue.isFavorite[index]
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border_outlined),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _theReviews() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  foregroundImage: AssetImage(reviews[index].imagePath),
                ),
                title: Text(
                  reviews[index].userName,
                  style: appTheme().textTheme.headline2,
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var i = 0; i < reviews[index].starsNumber; i++)
                      const Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                      )
                  ],
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              Text(
                reviews[index].comment,
                style: appTheme().textTheme.headline5,
              )
            ],
          );
        });
  }

  Drawer _drawer() {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(75),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.only(top: 25, left: 15.0),
        children: [
          const Center(
            child: CircleAvatar(
              foregroundImage: AssetImage('assets/profile.png'),
              radius: 80,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'Modather Ali',
              style: appTheme().textTheme.headline1,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          _listTile("All categories"),
          _listTile("Shoes"),
          _listTile("Shirts"),
          _listTile("Skirts"),
          _listTile("Hats"),
          _listTile("Pants"),
          _listTile("Random"),
        ],
      ),
    );
  }

  ListTile _listTile(String title) {
    return ListTile(
      onTap: () {},
      title: Text(
        title,
        style: appTheme()
            .textTheme
            .headline2!
            .copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
