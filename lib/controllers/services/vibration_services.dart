import 'package:vibration/vibration.dart';

/*
clase para manejar la vibración al hacer tap y darle feedback al usuario
*/
class VibrationServices {
  /*vibración del dispositivo al presionar*/
  Future<void> vibrate() async {
    if (await Vibration.hasVibrator() != null) {
      Vibration.vibrate(
        duration: 200,
        pattern: [20, 20, 20, 100],
        intensities: [1, 200],
      );
    }
  }
}
