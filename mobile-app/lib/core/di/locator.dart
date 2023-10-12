import 'package:get_it/get_it.dart';
import '../../data/data.dart';
import '../../data/repos/repos.dart';
import '../../presentation/bloc/blocs.dart';
import '../cores.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  //REPOS
  locator.registerLazySingleton(() => AuthRepository());
  //BLOCS
  locator.registerFactory(() => AuthBloc());
  locator.registerFactory(() => ScanBloc());

  //SERVICES
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  // locator.registerSingleton((Box box) => LocalStorageService(box));
  //STORAGES
  locator.registerLazySingleton(() => AuthLocalStorage());
  locator.registerLazySingleton(() => AppLocalStorage());
  //GLOBALS
  locator.registerLazySingleton(() => AppGlobals.instance);
}

//GLOBALS
AppGlobals appGlobals = locator.get<AppGlobals>();

//SERVICES
SnackbarService snackBars = locator.get<SnackbarService>();
NavigationService navigationService = locator.get<NavigationService>();
DialogService dialogService = locator.get<DialogService>();
BottomSheetService bottomSheetService = locator.get<BottomSheetService>();

//BLOCS
AuthBloc authBloc = locator.get<AuthBloc>();
ScanBloc scanBloc = locator.get<ScanBloc>();

//STORAGES
AuthLocalStorage authLocalStorage = locator.get<AuthLocalStorage>();
AppLocalStorage appLocalStorage = locator.get<AppLocalStorage>();

//REPOS
AuthRepository authRepo = locator.get<AuthRepository>();
