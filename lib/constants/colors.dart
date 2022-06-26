part of 'constants.dart';

const Color kPrimaryColor = Color(0xFFF0A500);

final MaterialColor kPrimarySwatch =
    MaterialColor(kPrimaryColor.hashCode, _primaryColorMap);

Map<int, Color> _primaryColorMap = {
  50: const Color.fromRGBO(240, 165, 0, .1),
  100: const Color.fromRGBO(240, 165, 0, .2),
  200: const Color.fromRGBO(240, 165, 0, .3),
  300: const Color.fromRGBO(240, 165, 0, .4),
  400: const Color.fromRGBO(240, 165, 0, .5),
  500: const Color.fromRGBO(240, 165, 0, .6),
  600: const Color.fromRGBO(240, 165, 0, .7),
  700: const Color.fromRGBO(240, 165, 0, .8),
  800: const Color.fromRGBO(240, 165, 0, .9),
  900: const Color.fromRGBO(240, 165, 0, 1),
};
