import 'package:get_it/get_it.dart';

import '../presentation/main/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<MainViewModel>(MainViewModel()..fetchWeathers());
}
