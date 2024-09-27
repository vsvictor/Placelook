import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopPageWidget extends StatelessWidget {
  final String header;
  final TextStyle? style;
  const TopPageWidget(this.header, {super.key, this.style});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Text(
            AppLocalizations.of(context)!.appTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Gif(
            autostart: Autostart.loop,
            placeholder: (context) =>
                const Center(child: CircularProgressIndicator()),
            image: const AssetImage('assets/rick.gif'),
            height: size.height * 0.15,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Text(
              header,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
      ],
    ));
  }
}
