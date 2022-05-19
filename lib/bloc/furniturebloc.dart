
import 'dart:async';
import 'package:bontony_furniture/bloc/bloc.dart';
import '../models/minimalfurniture.dart';

class FurnitureBloc extends Bloc{
  final StreamController<MinimalProduct> streamControllerofProductItems =StreamController<MinimalProduct>.broadcast();

  @override
  void dispose() {
    streamControllerofProductItems.close();
  }
}
FurnitureBloc furnitureBloc=FurnitureBloc();