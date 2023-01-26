import 'index.dart';

const Color blackColor = Color(0xff000000);
const Color whiteColor = Color(0xffffffff);
const Color greenColor = Color.fromARGB(255, 135, 214, 89);
const Color blueColor = Color.fromARGB(255, 15, 40, 107);
const Color redColor = Color.fromARGB(255, 231, 32, 63);

const List<Color> redColorGradient = [
  Color.fromARGB(255, 231, 32, 63),
  Color.fromARGB(255, 231, 32, 63),
];

const List<Color> greenColorGradient = [Color(0xff68BD70), Color(0xff2D5F32)];

getBackgroundGradientOpacity({required double opacity,  Color color = greenColor}) => [
       color.withOpacity(opacity),
       color.withOpacity(opacity)
    ];
