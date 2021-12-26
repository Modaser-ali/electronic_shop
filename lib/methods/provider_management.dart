import 'package:electronic_shop/methods/clothes.dart';
import 'package:flutter/material.dart';

class ProviderManagement extends ChangeNotifier {
  List<bool> isFavorite = [for (var i = 0; i < clothes.length; i++) false];
  List<Clothes> userFavoriteList = [];
  List<Clothes> shoppingBasket = [];
  List<int> amountOfPurchases = [for (var i = 0; i < clothes.length; i++) 1];
  int currentPageIndex = 0;

  changePage(int firstIndex) {
    currentPageIndex = firstIndex;
    notifyListeners();
  }

  editFavorite(int index) {
    isFavorite[index] = !isFavorite[index];
    if (isFavorite[index]) {
      userFavoriteList.add(clothes[index]);
    } else {
      userFavoriteList.remove(clothes[index]);
    }
    notifyListeners();
  }

  increaseAmount(int index) {
    amountOfPurchases[index]++;
    notifyListeners();
  }

  dicreaseAmount(int index) {
    if (amountOfPurchases[index] > 0) amountOfPurchases[index]--;
    notifyListeners();
  }

  addToShoppingBasket(int index) {
    shoppingBasket.add(clothes[index]);
    notifyListeners();
  }

  // getTotalPrice(double total) {
  //   shoppingBasket.forEach((clothe) {
  //     amountOfPurchases.forEach((element) {
  //       total += clothe.price * element;
  //     });
  //   });
  //   notifyListeners();
  // }
}
