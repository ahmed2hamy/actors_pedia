part of 'constants.dart';

const Color kPrimaryColor = Color(0xFFB07FED);

final MaterialColor kPrimarySwatch =
    MaterialColor(kPrimaryColor.hashCode, _primaryColorMap);

Map<int, Color> _primaryColorMap = {
  50: const Color.fromRGBO(176, 127, 237, .1),
  100: const Color.fromRGBO(176, 127, 237, .2),
  200: const Color.fromRGBO(176, 127, 237, .3),
  300: const Color.fromRGBO(176, 127, 237, .4),
  400: const Color.fromRGBO(176, 127, 237, .5),
  500: const Color.fromRGBO(176, 127, 237, .6),
  600: const Color.fromRGBO(176, 127, 237, .7),
  700: const Color.fromRGBO(176, 127, 237, .8),
  800: const Color.fromRGBO(176, 127, 237, .9),
  900: const Color.fromRGBO(176, 127, 237, 1),
};
