import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/bloc/menu_bloc.dart';
import 'package:flutter_ecommerce/src/bloc/menu_provider.dart';
import 'package:flutter_ecommerce/src/utils/drawer_behaviour/drawer_scaffold.dart';
import 'package:flutter_ecommerce/src/utils/drawer_behaviour/menu_screen.dart';

import 'account.dart';
import 'cart.dart';
import 'category.dart';
import 'home_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  HomeScreen homeScreen = new HomeScreen();
  AccountScreen accountScreen = AccountScreen();
  CartScreen cartScreen = CartScreen();
  CategoryPage categoryPage = CategoryPage();
  final bloc = MenuBloc();
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

  void updateMenu(String itemId) {
    bloc.updateCount(itemId);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.getMenu, // pass our Stream getter here
      initialData: MenuProvider().selectedMenuItemId,
      builder: (context, snapshot) => new DrawerScaffold(
            percentage: 0.8,
            cornerRadius: 20,
            appBar: AppBarProps(
                title: Text(
              appBarName(bloc.provider.selectedMenuItemId),
              style: TextStyle(
                fontFamily: "MyFont",
              ),
            )),
            menuView: new MenuView(
              selectorColor: Colors.black,
              menu: menu,
              headerView: SizedBox(
                height: 50,
              ),
              animation: true,
              mainAxisAlignment: MainAxisAlignment.start,
              color: Theme.of(context).primaryColor,
              selectedItemId: bloc.provider.selectedMenuItemId,
              onMenuItemSelected: updateMenu,
            ),
            contentView: Screen(
              contentBuilder: (context) {
                if (bloc.provider.selectedMenuItemId == "home") {
                  return homeScreen;
                } else if (bloc.provider.selectedMenuItemId == "category") {
                  return categoryPage;
                } else if (bloc.provider.selectedMenuItemId == "account") {
                  return accountScreen;
                } else if (bloc.provider.selectedMenuItemId == "cart") {
                  return cartScreen;
                } else
                  return homeScreen;
              },
              color: Colors.white,
            ),
          ),
    );
  }

  String appBarName(String selectedMenuItemId) {
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
