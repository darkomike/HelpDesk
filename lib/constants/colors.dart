import 'index.dart';

const Color blackColor = Color(0xff000000);
const Color whiteColor = Color(0xffffffff);
const Color greenColor = Color.fromARGB(255, 135, 214, 89);
const List<Color> bgColorGradient = [Color(0xff68BD70), Color(0xff2D5F32)];

getBackgroundGradientOpacity({required double opacity}) => [
      const Color(0xff68BD70).withOpacity(opacity),
      const Color(0xff2D5F32).withOpacity(opacity)
    ];
