import 'package:car_site/pages/add_car/add_car_conroller.dart';
import 'package:car_site/pages/car_details/car_details_controller.dart';
import 'package:car_site/pages/edit_car/edit_car_controller.dart';
import 'package:car_site/pages/main/main_controller.dart';
import 'package:car_site/pages/main/main_page.dart';
import 'package:car_site/pages/stock_cars/stock_cars_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(MainController());
  Get.put(AddCarConroller());
  Get.put(EditCarController());
  Get.put(StockCarsController());
  Get.put(CarDetailsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        title: 'Car Site',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.blue),
        ),
        // theme: ThemeData(
        //   brightness: Brightness.dark,
        //   primaryColor: myColors.primary,
        //   scaffoldBackgroundColor: myColors.primary,
        //   colorScheme: ColorScheme.dark(
        //     primary: myColors.secondary,
        //     secondary: myColors.highlight,
        //     surface: Color(0xFF2A2A2A),
        //     onPrimary: Colors.white,
        //     onSecondary: Colors.white,
        //   ),
        //   textTheme: TextTheme(
        //     headlineLarge: TextStyle(
        //       fontSize: 40,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white,
        //     ),
        //     headlineMedium: TextStyle(
        //       fontSize: 28,
        //       fontWeight: FontWeight.w600,
        //       color: Colors.white,
        //     ),
        //     titleMedium: TextStyle(
        //       fontSize: 18,
        //       fontWeight: FontWeight.w500,
        //       color: Colors.white,
        //     ),
        //     bodyMedium: TextStyle(
        //       fontSize: 16,
        //       fontWeight: FontWeight.w400,
        //       color: Color(0xFFF1FAEE),
        //     ),
        //     bodySmall: TextStyle(
        //       fontSize: 14,
        //       fontWeight: FontWeight.w300,
        //       color: Color(0xFFA8A8A8),
        //     ),
        //   ),
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Color(0xFFE63946), // Racing Red
        //       foregroundColor: Colors.white,
        //       textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(12),
        //       ),
        //     ),
        //   ),
        // ),
        home: const MainPage(),
      ),
    );
  }
}
