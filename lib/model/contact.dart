import 'package:freezed_annotation/freezed_annotation.dart';
part 'contact.freezed.dart';
part 'contact.g.dart';

@unfreezed
@Freezed(unionKey: 'type')
abstract class Contact with _$Contact {
  Contact._();
  Contact();
  @FreezedUnionValue('email')
  factory Contact.email(String? email) = EmailContact;
  @FreezedUnionValue('phone')
  factory Contact.phone(String? phone) = PhoneContact;
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}
