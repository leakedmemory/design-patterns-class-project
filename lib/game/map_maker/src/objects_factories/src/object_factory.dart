abstract class ObjectFactory<T, U> {
  T createSpriteComponent(
      {required U type,
      required double tilePositionX,
      required double tilePositionY,
      required int priority});
}
