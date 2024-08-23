import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Placelook/model/contact.dart';
part 'contact_email.freezed.dart';

@unfreezed
class EmailContact extends Contact with _$EmailContact {
  EmailContact._();
  factory EmailContact({@Default(null) String? email}) = _EmailContact;
}
