sealed class AbstractContact {
  const AbstractContact();
}

class EmailContact extends AbstractContact {
  final String _email;
  const EmailContact(this._email);
  EmailContact.from(this._email);
  String get email => _email;
}

class PhoneContact extends AbstractContact {
  late final _phone;
  PhoneContact(this._phone);
  PhoneContact.from(this._phone);
  String get phone => _phone;
}
