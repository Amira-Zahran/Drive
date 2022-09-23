import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetConnection {
  Future<bool> get isConnected;
}

class InternetConnectionImpl implements InternetConnection {
  final InternetConnectionChecker connectionChecker;

  InternetConnectionImpl(this.connectionChecker);
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

}
