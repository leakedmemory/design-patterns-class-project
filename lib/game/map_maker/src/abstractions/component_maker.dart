import 'maker.dart';

abstract class ComponentMaker<T, U> extends Maker {
  T setSpriteTileOnMap(U type, double x, double y, {int priority = 0});
}
