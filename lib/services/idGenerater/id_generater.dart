import 'package:uuid/uuid.dart';
class IdGenerator {
  String generateCreditId() {
    Uuid uuid = Uuid();
    String makeProductId = uuid.v4().substring(0, 5);

    return makeProductId;
  }
}
