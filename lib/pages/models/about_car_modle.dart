// class CarsModel {
//   final String manufacturer;
//   final List<Car> cars;

//   CarsModel({required this.manufacturer, required this.cars});

//   factory CarsModel.fromJson(Map<String, dynamic> json) => CarsModel(
//     manufacturer: json["manufacturer"],
//     cars: List<Car>.from(json["models"].map((x) => Car.fromJson(x))),
//   );

//   Map<String, dynamic> toJson() => {
//     "manufacturer": manufacturer,
//     "models": List<dynamic>.from(cars.map((x) => x.toJson())),
//   };
// }

// class Car {
//   final String carName;
//   final List<String> carVariants;

//   Car({required this.carName, required this.carVariants});

//   factory Car.fromJson(Map<String, dynamic> json) => Car(
//     carName: json["car_name"],
//     carVariants: List<String>.from(json["car_variants"].map((x) => x)),
//   );

//   Map<String, dynamic> toJson() => {
//     "car_name": carName,
//     "car_variants": List<dynamic>.from(carVariants.map((x) => x)),
//   };
// }

//--------------- NEW CODE

class CarsModel {
  final String manufacturer;
  final List<Car> cars;

  const CarsModel({required this.manufacturer, required this.cars});

  factory CarsModel.fromJson(Map<String, dynamic> json) {
    return CarsModel(
      manufacturer: json['manufacturer']?.toString() ?? '',
      cars:
          (json['models'] as List<dynamic>? ?? [])
              .map((e) => Car.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'manufacturer': manufacturer,
      'models': cars.map((car) => car.toJson()).toList(),
    };
  }
}

class Car {
  final String carName;
  final List<String> carVariants;

  const Car({required this.carName, required this.carVariants});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      carName: json['car_name']?.toString() ?? '',
      carVariants:
          (json['car_variants'] as List<dynamic>? ?? [])
              .map((e) => e.toString())
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'car_name': carName, 'car_variants': carVariants};
  }
}
