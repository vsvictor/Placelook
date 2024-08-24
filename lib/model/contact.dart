import 'package:freezed_annotation/freezed_annotation.dart';
part 'contact.freezed.dart';
part 'contact.g.dart';

@unfreezed
abstract class Contact with _$Contact {
  Contact._();
  Contact();
  factory Contact.email(String? email) = EmailContact;
  factory Contact.phone(String? phone) = PhoneContact;
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}
