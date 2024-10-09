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
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height / 2.85),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.paddingOf(context).top,
          ),
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
          SizedBox(
            height: size.height * 0.02,
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Text(
              header,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }
}
