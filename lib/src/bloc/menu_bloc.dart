import 'dart:async';

import 'package:flutter_ecommerce/src/bloc/menu_provider.dart';
// import 'package:rxdart/rxdart.dart'; if you want to make use of PublishSubject, ReplaySubject or BehaviourSubject.
// make sure you have rxdart: as a dependency in your pubspec.yaml file to use the above import


class MenuBloc {
  final counterController = StreamController();

  final MenuProvider provider = MenuProvider();

  Stream get getMenu => counterController.stream; // create a getter for our Stream


  void updateCount(String itemId) {
    provider.updateMenu(itemId);
    counterController.sink.add(provider.selectedMenuItemId); // add whatever data we want into the Sink
  }

  void dispose() {
    counterController.close(); // close our StreamController to avoid memory leak
  }
}

final bloc = MenuBloc(); // create an instance of the counter src.bloc

//======= end of CounterBloc file


