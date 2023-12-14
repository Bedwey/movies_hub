import 'package:get_it/get_it.dart';
import 'package:tmdb_api/tmdb_api.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => TMDB(ApiKeys('638a969908dfc76b3a68cba0836cf0c3', 'apiReadAccessTokenv4')));
}
