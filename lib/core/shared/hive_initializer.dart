import 'package:hive/hive.dart';
import 'package:neonyx/data/model/message_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';


Future<void> init() async {
  final appDocumentDirectory = await getApplicationSupportDirectory();
  Hive.init(appDocumentDirectory.path);

  // registering models
  Hive.registerAdapter(MessageModelAdapter()); // hive type [0]
}
