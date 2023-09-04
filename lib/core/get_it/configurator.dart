import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:neonyx/core/get_it/configurator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<void> configureDependencies() async => getIt.init();
