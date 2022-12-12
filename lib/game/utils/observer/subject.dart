import 'observer.dart';

abstract class Subject<T, U> {
  late U state;

  void addObserver(Observer<T> observer);
  void removeObserver(Observer<T> observer);
  void notifyObservers();
}
