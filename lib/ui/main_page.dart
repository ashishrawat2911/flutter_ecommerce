import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/account.dart';
import 'package:flutter_ecommerce/ui/cart.dart';
import 'package:flutter_ecommerce/ui/category.dart';
import 'package:flutter_ecommerce/ui/home_screen.dart';
import 'package:flutter_ecommerce/utils/drawer_behaviour/drawer_scaffold.dart';
import 'package:flutter_ecommerce/utils/drawer_behaviour/menu_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  HomeScreen homeScreen = new HomeScreen();
  CategoryPage categoryPage = new CategoryPage();
  AccountScreen accountScreen = new AccountScreen();
  CartScreen _cartScreen = new CartScreen();
  final menu = new Menu(
    items: [
      new MenuItem(
        icon: Icons.home,
        id: 'home',
        title: 'Home',
      ),
      new MenuItem(
        icon: Icons.card_giftcard,
        id: 'category',
        title: 'Category',
      ),
      new MenuItem(
        icon: Icons.shopping_cart,
        id: 'cart',
        title: 'Cart',
      ),
      new MenuItem(
        icon: Icons.person,
        id: 'account',
        title: 'Account',
      ),
    ],
  );

  var selectedMenuItemId = 'home';

  Widget headerView(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[CircleAvatar()]),
        Divider(
          color: Colors.white.withAlpha(200),
          height: 16,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new DrawerScaffold(
      percentage: 0.8,
      cornerRadius: 20,
      appBar: AppBarProps(
          title: Text(
        appBarName(),
        style: TextStyle(
          fontFamily: "MyFont",
        ),
      )),
      menuView: new MenuView(
        selectorColor: Colors.black,
        menu: menu,
        headerView: SizedBox(height: 50,),
        animation: true,
        mainAxisAlignment: MainAxisAlignment.start,
        color: Theme.of(context).primaryColor,
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          selectedMenuItemId = itemId;
          setState(() {});
        },
      ),
      contentView: Screen(
        contentBuilder: (context) {
          if (selectedMenuItemId == "home") {
            return homeScreen;
          }
          if (selectedMenuItemId == "category") {
            return categoryPage;
          }
          if (selectedMenuItemId == "home") {
            return accountScreen;
          }
          if (selectedMenuItemId == "cart") {
            return _cartScreen;
          }
        },
        color: Colors.white,
      ),
    );
  }

  String appBarName() {
    if (selectedMenuItemId == "home") {
      return "Home";
    } else if (selectedMenuItemId == "category") {
      return "Category";
    } else if (selectedMenuItemId == "account") {
      return "Account";
    } else if (selectedMenuItemId == "cart") {
      return "Cart";
    } else {
      return "";
    }
  }
}
