import 'package:car_site/pages/models/car_details_model.dart';
import 'package:get/get.dart';

class CarDetailsController extends GetxController {
  CarDetailsModel? carDetail;
  setCarDetails(CarDetailsModel car) {
    // stockCarList.add(car);
    carDetail = car;
    update();
  }
}
