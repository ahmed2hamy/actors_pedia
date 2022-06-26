part of 'constants.dart';

class ElevatedButtonShape implements MaterialStateProperty<OutlinedBorder?> {
  const ElevatedButtonShape();

  @override
  OutlinedBorder? resolve(Set<MaterialState> states) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    );
  }
}

class ElevatedButtonBackgroundColor implements MaterialStateProperty<Color?> {
  const ElevatedButtonBackgroundColor();

  @override
  Color? resolve(Set<MaterialState> states) {
    return null;
  }
}

class ElevatedButtonSide implements MaterialStateProperty<BorderSide?> {
  const ElevatedButtonSide();

  @override
  BorderSide? resolve(Set<MaterialState> states) {
    return null;
  }
}
