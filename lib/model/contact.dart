import 'package:freezed_annotation/freezed_annotation.dart';
part 'contact.freezed.dart';


@unfreezed
abstract class Contact with _$Contact {
  Contact._();
  Contact();
  factory Contact.email(String? email) = EmailContact;
  factory Contact.phone(String? phone) = PhoneContact;
}