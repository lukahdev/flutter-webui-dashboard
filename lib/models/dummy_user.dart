import 'package:webui/models/identifier_model.dart';

class DummyUser extends IdentifierModel {
  final String email, firstName, lastName;

  DummyUser(super.id, this.email, this.firstName, this.lastName);

  String get name => "$firstName $lastName";
}

