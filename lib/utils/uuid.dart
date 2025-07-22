import 'package:uuid/uuid.dart';

class RandomUuid {
  static String generate() {
    return const Uuid().v4();
  }
}
