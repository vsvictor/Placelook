sealed class AbstractContact {
  AbstractContact();
}

class EmailContact extends AbstractContact{
  late final String _email;
  EmailContact(this._email);
  EmailContact.from(this._email);
  String get email => _email;
}
class PhoneContact extends AbstractContact{
  late final _phone;
  PhoneContact(this._phone);
  PhoneContact.from(this._phone);
  String get phone => _phone;
}
