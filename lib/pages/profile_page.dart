import 'package:Placelook/model/contact.dart';
import 'package:Placelook/model/languages.dart';
import 'package:Placelook/model/role.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/widgets/top_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:Placelook/widgets/avatar_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserViewModel? vm;
  final TextEditingController _teFirstName = TextEditingController();
  final TextEditingController _teLastName = TextEditingController();
  final TextEditingController _teEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    vm = context.read<UserViewModel>();
    Size size = MediaQuery.of(context).size;
    if (_teFirstName.text.trim().isEmpty) _teFirstName.text = vm!.firstName;
    if (_teLastName.text.trim().isEmpty) _teLastName.text = vm!.lastName;
    if (_teEmail.text.trim().isEmpty) _teEmail.text = vm!.email;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
              children: [
                TopPageWidget(AppLocalizations.of(context)!.profile),
                Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: AvatarWidger(
                      backgroundImage: Image.asset("assets/edit.png"),
                      radius: 128.0,
                      colorBask: Colors.grey,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.only(
                                top: 8, left: 64, right: 64, bottom: 8))),
                    child: Text(AppLocalizations.of(context)!.logout,
                        style: Theme.of(context).textTheme.displayMedium,),
                    onPressed: () => {_logout()},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: TextField(
                    controller: _teFirstName,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.first_name,
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      hintText: AppLocalizations.of(context)!.first_name,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: TextField(
                    controller: _teLastName,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.last_lame,
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      hintText: AppLocalizations.of(context)!.language,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: TextField(
                    controller: _teEmail,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.email,
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      hintText: AppLocalizations.of(context)!.email,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: DropdownButtonFormField<String?>(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.role,
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor: Theme.of(context).dialogBackgroundColor,
                    onChanged: (String? newSelect) {
                      if (newSelect != null) {
                        vm?.user?.role =
                            Role.values.byName(newSelect.toUpperCase());
                      }
                    },
                    items: Role.values
                        .map((e) => e.title)
                        .toList()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(value, style: Theme.of(context).textTheme.bodyMedium,),
                          ],
                        ),
                      );
                    }).toList(),
                    value: vm?.user?.role.title,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: DropdownButtonFormField<String?>(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.language,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor: Theme.of(context).dialogBackgroundColor,
                    onChanged: (String? newSelect) {
                      if (newSelect != null) {
                        vm?.user?.language =
                            Languages.values.byName(newSelect.toUpperCase());
                      }
                    },
                    items: Languages.values
                        .map((e) => e.title)
                        .toList()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(value, style: Theme.of(context).textTheme.bodyMedium,),
                          ],
                        ),
                      );
                    }).toList(),
                    value: vm?.user?.language.title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 128),
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.only(
                              top: 8, left: 64, right: 64, bottom: 8),
                        ),
                      ),
                      child: Text(AppLocalizations.of(context)!.save,
                          style: Theme.of(context).textTheme.displayMedium),
                      onPressed: () => {_saveProfile()},
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  void _saveProfile() {
    if (vm?.user?.id == null) vm?.user?.generateID();
    vm?.user?.firstName = _teFirstName.text;
    vm?.user?.lastName = _teLastName.text;
    vm?.user?.contacts = ([Contact.email(_teEmail.text)]).toList();
    vm?.save();
  }

  void _logout() {
    context.go("/auth", extra: "Page not found");
  }
}
