import 'dart:convert';

import 'package:car_site/pages/models/about_car_modle.dart';
import 'package:car_site/pages/models/car_details_model.dart';
import 'package:car_site/pages/stock_cars/stock_cars_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddCarConroller extends GetxController {
  final carRegistrationController = TextEditingController(),
      kilometerController = TextEditingController(),
      priceController = TextEditingController();
  List modelYearList = [];
  String? yearValue;
  List<String> getPreviousTwelveYears() {
    final int currentYear = DateTime.now().year;
    List<String> years = [];
    for (int i = 0; i < 12; i++) {
      years.add('${currentYear - i}');
    }
    return years;
  }

  void selectModelYear(String value) async {
    print('*~~~~~~~~~~ selectModelYear ~~~~~~~~~~*');
    yearValue = value;
    update();
  }

  List ownerList = ['1', '2', '3', '4'];
  String? ownerValue;
  void selectOwner(String value) async {
    print('*~~~~~~~~~~ selectOwner ~~~~~~~~~~*');
    ownerValue = value;
    update();
  }

  List insuranceList = [
    'Third-Party Liability Insurance',
    'Comprehensive Insurance',
    'Standalone Own Damage (OD) Insurance',
    'Expired',
  ];
  String? insuranceValue;
  void selectInsurance(String value) async {
    print('*~~~~~~~~~~ selectInsurance ~~~~~~~~~~*');
    insuranceValue = value;
    update();
  }

  List transmissionList = ['Manual', 'Automatic'];
  String? transmissionValue;
  void selectTransmission(String value) async {
    print('*~~~~~~~~~~ selectTransmission ~~~~~~~~~~*');
    transmissionValue = value;
    update();
  }

  List registrationTypeList = ['Private', 'Commercial', 'Electric'];
  String? registrationTypeValue;
  void selectRegistrationType(String value) async {
    print('*~~~~~~~~~~ selectRegistrationType ~~~~~~~~~~*');
    registrationTypeValue = value;
    update();
  }

  List fuelTypeList = ['Petrol', 'Diesel', 'CNG', 'LPG', 'Electric'];
  String? fuelTypeValue;
  void selectFuelType(String value) async {
    print('*~~~~~~~~~~ selectFuelType ~~~~~~~~~~*');
    fuelTypeValue = value;
    update();
  }

  List colorList = [
    'White',
    'Silver',
    'Black',
    'Grey',
    'Blue',
    'Red',
    'Green',
    'Orange',
    'Yellow',
    'Brown',
    'Purple',
  ];
  String? colorValue;
  void selectColor(String value) async {
    print('*~~~~~~~~~~ selectColor ~~~~~~~~~~*');
    colorValue = value;
    update();
  }

  List<Uint8List> imgList = [];

  Future<void> selectImg() async {
    print('*~~~~~~~~~~ selectImg ~~~~~~~~~~*');

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      // allowedExtensions: ['jpg', 'png', 'jpeg'],
      type: FileType.image,
    );

    if (result != null) {
      for (int i = 0; i < result.files.length; i++) {
        Uint8List? fileBytes = result.files[i].bytes;
        if (fileBytes != null) {
          imgList.add(fileBytes);
        }
      }
    }

    update();
  }

  removeImg(int index) {
    imgList.removeAt(index);
    update();
  }

  List<CarsModel> manufacturerList = [];
  CarsModel? manufacturerValue;
  List<Car> carList = [];
  Car? carValue;
  List<String> carVarientList = [];
  String? carVarientValue;
  Future<void> loadJsonData() async {
    print('*~~~~~~~~~~ loadJsonData ~~~~~~~~~~*');
    final String response = await rootBundle.loadString(
      'assets/cars_data/cars_data.json',
    );
    final data = jsonDecode(response);

    for (int i = 0; i < (data as List).length; i++) {
      CarsModel carsModel = CarsModel.fromJson(data[i]);
      manufacturerList.add(carsModel);
    }

    update();
  }

  Future<void> selectManufacturer(CarsModel manufacturer) async {
    print('*~~~~~~~~~~ selectManufacturer ~~~~~~~~~~*');
    manufacturerValue = manufacturer;
    loadCarsData(manufacturer.manufacturer);
  }

  Future<void> selectCar(Car car) async {
    print('*~~~~~~~~~~ selectCar ~~~~~~~~~~*');
    carValue = car;
    loadCarVarientData(car.carName);
  }

  void selectCarVariant(String carVariant) async {
    print('*~~~~~~~~~~ selectCarVariant ~~~~~~~~~~*');
    carVarientValue = carVariant;
    update();
  }

  Future<void> loadCarsData(String manufacturer) async {
    print('*~~~~~~~~~~ Load Cars Of "$manufacturer" ~~~~~~~~~~*');
    carValue = null;
    if (carVarientValue != null || carVarientList.isNotEmpty) {
      print(
        'carVarientValue - $carVarientValue  & carVarientList legth - ${carVarientList.length}',
      );
      carVarientValue = null;
      carVarientList.clear();
    }

    print('car dropdown value - ${carValue?.carName}');

    for (final m in manufacturerList) {
      if (manufacturer.toLowerCase() == m.manufacturer.toLowerCase()) {
        carList = m.cars;
        break;
      }
    }
    update();

    print('carList legth - ${carList.length}');
    for (final c in carList) {
      print('Car Name ~~> ${c.carName}');
    }
  }

  Future<void> loadCarVarientData(String carName) async {
    print('*~~~~~~~~~~ Load Car Variants Of "$carName" ~~~~~~~~~~*');
    carVarientValue = null;
    print('carVarientValue - $carVarientValue');

    for (final c in carList) {
      if (carName.toLowerCase() == c.carName.toLowerCase()) {
        carVarientList = c.carVariants;
        break;
      }
    }

    print(
      'carVarientList legth - ${carVarientList.length}\nCar Variants ~~> $carVarientList',
    );
    update();
  }

  addCar() {
    String updatedAt =
        '${DateTime.now().day} ${DateTime.now().month == 1
            ? 'Jan'
            : DateTime.now().month == 2
            ? 'Feb'
            : DateTime.now().month == 3
            ? 'Mar'
            : DateTime.now().month == 4
            ? 'Apr'
            : DateTime.now().month == 5
            ? 'May'
            : DateTime.now().month == 6
            ? 'Jun'
            : DateTime.now().month == 7
            ? 'Jul'
            : DateTime.now().month == 8
            ? 'Aug'
            : DateTime.now().month == 9
            ? 'Sep'
            : DateTime.now().month == 10
            ? 'Oct'
            : DateTime.now().month == 11
            ? 'Nov'
            : 'Dec'} ${DateTime.now().year}';
    StockCarsController stockCarsController = Get.find();
    stockCarsController.addNewCar(
      CarDetailsModel(
        manufacturer: manufacturerValue?.manufacturer ?? '',
        carName: carValue?.carName ?? '',
        variant: carVarientValue ?? '',
        carImage: '',
        imgList: imgList,
        price: priceController.text,
        kmsDone: kilometerController.text,
        modelYear: yearValue ?? '',
        color: colorValue ?? '',
        owner: ownerValue ?? '',
        lastUpdated: updatedAt,
        insurance: insuranceValue ?? '',
        registrationType: registrationTypeValue ?? '',
        registrationNumber: carRegistrationController.text,
        transmission: transmissionValue ?? '',
        fuelType: fuelTypeValue ?? '',
      ),
    );

    update();
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    modelYearList = getPreviousTwelveYears();
    loadJsonData();
  }
}
