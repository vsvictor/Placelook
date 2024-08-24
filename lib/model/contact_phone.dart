import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Placelook/model/contact.dart';
part 'contact_phone.freezed.dart';
part 'contact_phone.g.dart';

@unfreezed
class PhoneContact extends Contact with _$PhoneContact {
  PhoneContact._();
  factory PhoneContact({@Default("") String? phone}) = _PhoneContact;
  factory PhoneContact.fromJson(Map<String, dynamic> json) =>
      _$PhoneContactFromJson(json);
}
