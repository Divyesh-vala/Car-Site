import 'dart:typed_data';

class CarDetailsModel {
  final String manufacturer;
  final String carName;
  final String variant;
  final String carImage;
  List<Uint8List> imgList = [];

  // car details
  final String price;
  final String kmsDone;
  final String modelYear;
  final String color;
  final String owner;
  final String lastUpdated;
  final String insurance;
  final String registrationType;
  final String registrationNumber;
  final String transmission;
  final String fuelType;

  CarDetailsModel({
    required this.manufacturer,
    required this.carName,
    required this.variant,
    required this.carImage,
    required this.imgList,
    required this.price,
    required this.kmsDone,
    required this.modelYear,
    required this.color,
    required this.owner,
    required this.lastUpdated,
    required this.insurance,
    required this.registrationType,
    required this.registrationNumber,
    required this.transmission,
    required this.fuelType,
  });
}

List<CarDetailsModel> stockCarList = [
  CarDetailsModel(
    manufacturer: 'Maruti Suzuki',
    carName: 'Ertiga',
    variant: 'LXI',
    carImage: 'assets/artiga.jpeg',
    imgList: [],
    price: '11.4 Lac',
    kmsDone: '7215',
    modelYear: '2022',
    color: 'White',
    owner: '1',
    lastUpdated: '8 Oct 2025',
    insurance: 'Expire',
    registrationType: 'Comercial',
    registrationNumber: 'AB12CD3456',
    transmission: 'Manual',
    fuelType: 'Petrol',
  ),
  CarDetailsModel(
    manufacturer: 'Maruti Suzuki',
    carName: 'Brezza',
    variant: 'LXI',
    carImage: 'assets/brezza.jpeg',
    imgList: [],
    price: '14.3 Lac',
    kmsDone: '2241',
    modelYear: '2022',
    color: 'Red',
    owner: '1',
    lastUpdated: '8 Oct 2025',
    insurance: 'Expire',
    registrationType: 'Private',
    registrationNumber: 'AB12CD3456',
    transmission: 'Manual',
    fuelType: 'Petrol',
  ),
  CarDetailsModel(
    manufacturer: 'Hyundai',
    carName: 'Exter',
    variant: 'LXI',
    carImage: 'assets/exter.jpeg',
    imgList: [],
    price: '14.3 Lac',
    kmsDone: '2241',
    modelYear: '2022',
    color: 'Red',
    owner: '1',
    lastUpdated: '8 Oct 2025',
    insurance: 'Expire',
    registrationType: 'Private',
    registrationNumber: 'AB12CD3456',
    transmission: 'Manual',
    fuelType: 'Petrol',
  ),
  CarDetailsModel(
    manufacturer: 'Toyota',
    carName: 'Fortuner',
    variant: 'LXI',
    carImage: 'assets/Fortuner.jpeg',
    imgList: [],
    price: '14.3 Lac',
    kmsDone: '2241',
    modelYear: '2022',
    color: 'Black',
    owner: '1',
    lastUpdated: '8 Oct 2025',
    insurance: 'Expire',
    registrationType: 'Private',
    registrationNumber: 'AB12CD3456',
    transmission: 'Manual',
    fuelType: 'Petrol',
  ),
  CarDetailsModel(
    manufacturer: 'Toyota',
    carName: 'Hyrider',
    variant: 'LXI',
    carImage: 'assets/hyrider.jpeg',
    imgList: [],
    price: '14.3 Lac',
    kmsDone: '2241',
    modelYear: '2022',
    color: 'Black',
    owner: '1',
    lastUpdated: '8 Oct 2025',
    insurance: 'Expire',
    registrationType: 'Private',
    registrationNumber: 'AB12CD3456',
    transmission: 'Manual',
    fuelType: 'Petrol',
  ),
  CarDetailsModel(
    manufacturer: 'Tata',
    carName: 'Nexon',
    variant: 'LXI',
    carImage: 'assets/nexon.jpeg',
    imgList: [],
    price: '14.3 Lac',
    kmsDone: '2241',
    modelYear: '2022',
    color: 'Red',
    owner: '1',
    lastUpdated: '8 Oct 2025',
    insurance: 'Expire',
    registrationType: 'Private',
    registrationNumber: 'AB12CD3456',
    transmission: 'Manual',
    fuelType: 'Petrol',
  ),
  CarDetailsModel(
    manufacturer: 'Tata',
    carName: 'Safari',
    variant: 'LXI',
    carImage: 'assets/safari.jpeg',
    imgList: [],
    price: '14.3 Lac',
    kmsDone: '2241',
    modelYear: '2022',
    color: 'Golden',
    owner: '1',
    lastUpdated: '8 Oct 2025',
    insurance: 'Expire',
    registrationType: 'Private',
    registrationNumber: 'AB12CD3456',
    transmission: 'Manual',
    fuelType: 'Petrol',
  ),
  CarDetailsModel(
    manufacturer: 'Maruti Suzuki',
    carName: 'Swift',
    variant: 'LXI',
    carImage: 'assets/swift.jpeg',
    imgList: [],
    price: '14.3 Lac',
    kmsDone: '2241',
    modelYear: '2022',
    color: 'Blue',
    owner: '1',
    lastUpdated: '8 Oct 2025',
    insurance: 'Expire',
    registrationType: 'Private',
    registrationNumber: 'AB12CD3456',
    transmission: 'Manual',
    fuelType: 'Petrol',
  ),
  CarDetailsModel(
    manufacturer: 'Hyundai',
    carName: 'Verna',
    variant: 'LXI',
    carImage: 'assets/verna.jpeg',
    imgList: [],
    price: '14.3 Lac',
    kmsDone: '2241',
    modelYear: '2022',
    color: 'Red',
    owner: '1',
    lastUpdated: '8 Oct 2025',
    insurance: 'Expire',
    registrationType: 'Private',
    registrationNumber: 'AB12CD3456',
    transmission: 'Manual',
    fuelType: 'Petrol',
  ),
];

//----------------------- NEW CODE
// import 'dart:typed_data';

// class CarDetailsModel {
//   // ═══════════════════════════════════════════════════════════
//   // BASIC CAR INFORMATION
//   // ═══════════════════════════════════════════════════════════

//   final String manufacturer;
//   final String carName;
//   final String variant;
//   final String carImage;

//   /// Additional car images
//   List<Uint8List> imgList;

//   // ═══════════════════════════════════════════════════════════
//   // PRICE & USAGE
//   // ═══════════════════════════════════════════════════════════

//   final String price;
//   final String kmsDone;
//   final String modelYear;

//   // ═══════════════════════════════════════════════════════════
//   // CAR SPECIFICATIONS
//   // ═══════════════════════════════════════════════════════════

//   final String color;
//   final String owner;
//   final String transmission;
//   final String fuelType;

//   /// Example: SUV, Sedan, Hatchback, MUV
//   final String bodyType;

//   /// Example: 5, 6, 7
//   final String seatingCapacity;

//   /// Example: 1197 cc
//   final String engineCapacity;

//   /// Example: 18.5 km/l
//   final String mileage;

//   // ═══════════════════════════════════════════════════════════
//   // REGISTRATION & INSURANCE
//   // ═══════════════════════════════════════════════════════════

//   final String insurance;
//   final String registrationType;
//   final String registrationNumber;

//   // ═══════════════════════════════════════════════════════════
//   // LOCATION
//   // ═══════════════════════════════════════════════════════════

//   final String city;
//   final String state;

//   // ═══════════════════════════════════════════════════════════
//   // LISTING INFORMATION
//   // ═══════════════════════════════════════════════════════════

//   final String description;

//   /// Example:
//   /// ["Sunroof", "Reverse Camera", "Alloy Wheels"]
//   final List<String> features;

//   /// Listing status:
//   /// Available / Sold / Reserved
//   final String status;

//   /// Dealer / seller name
//   final String sellerName;

//   /// Seller contact number
//   final String sellerPhone;

//   /// Date when listing was created/updated
//   final String lastUpdated;

//   // ═══════════════════════════════════════════════════════════
//   // CONSTRUCTOR
//   // ═══════════════════════════════════════════════════════════

//   CarDetailsModel({
//     required this.manufacturer,
//     required this.carName,
//     required this.variant,
//     required this.carImage,
//     required this.imgList,

//     required this.price,
//     required this.kmsDone,
//     required this.modelYear,

//     required this.color,
//     required this.owner,
//     required this.transmission,
//     required this.fuelType,

//     required this.bodyType,
//     required this.seatingCapacity,
//     required this.engineCapacity,
//     required this.mileage,

//     required this.insurance,
//     required this.registrationType,
//     required this.registrationNumber,

//     required this.city,
//     required this.state,

//     required this.description,
//     required this.features,

//     required this.status,
//     required this.sellerName,
//     required this.sellerPhone,

//     required this.lastUpdated,
//   });
// }

// // ═══════════════════════════════════════════════════════════
// // DUMMY STOCK DATA
// // ═══════════════════════════════════════════════════════════

// List<CarDetailsModel> stockCarList = [
//   CarDetailsModel(
//     manufacturer: 'Maruti Suzuki',
//     carName: 'Ertiga',
//     variant: 'LXI',
//     carImage: 'assets/artiga.jpeg',
//     imgList: [],

//     price: '11.4 Lac',
//     kmsDone: '7215',
//     modelYear: '2022',

//     color: 'White',
//     owner: '1',
//     transmission: 'Manual',
//     fuelType: 'Petrol',

//     bodyType: 'MUV',
//     seatingCapacity: '7',
//     engineCapacity: '1462 cc',
//     mileage: '20.3 km/l',

//     insurance: 'Expired',
//     registrationType: 'Commercial',
//     registrationNumber: 'AB12CD3456',

//     city: 'Gandhinagar',
//     state: 'Gujarat',

//     description:
//         'Well maintained Maruti Suzuki Ertiga with good condition, '
//         'low kilometers and regular service history.',

//     features: [
//       'Air Conditioning',
//       'Power Steering',
//       'Power Windows',
//       'ABS',
//       'Rear Parking Sensors',
//     ],

//     status: 'Available',

//     sellerName: 'Car Site',
//     sellerPhone: '+91 1234567890',

//     lastUpdated: '8 Oct 2026',
//   ),

//   CarDetailsModel(
//     manufacturer: 'Maruti Suzuki',
//     carName: 'Brezza',
//     variant: 'LXI',
//     carImage: 'assets/brezza.jpeg',
//     imgList: [],

//     price: '14.3 Lac',
//     kmsDone: '2241',
//     modelYear: '2022',

//     color: 'Red',
//     owner: '1',
//     transmission: 'Manual',
//     fuelType: 'Petrol',

//     bodyType: 'SUV',
//     seatingCapacity: '5',
//     engineCapacity: '1462 cc',
//     mileage: '19.8 km/l',

//     insurance: 'Expired',
//     registrationType: 'Private',
//     registrationNumber: 'AB12CD3456',

//     city: 'Ahmedabad',
//     state: 'Gujarat',

//     description:
//         'Clean and well maintained Maruti Suzuki Brezza suitable for '
//         'daily city and highway driving.',

//     features: [
//       'Touchscreen Infotainment',
//       'Air Conditioning',
//       'ABS',
//       'Rear Parking Camera',
//       'Power Windows',
//     ],

//     status: 'Available',

//     sellerName: 'Car Site',
//     sellerPhone: '+91 1234567890',

//     lastUpdated: '8 Oct 2026',
//   ),

//   CarDetailsModel(
//     manufacturer: 'Hyundai',
//     carName: 'Exter',
//     variant: 'LXI',
//     carImage: 'assets/exter.jpeg',
//     imgList: [],

//     price: '14.3 Lac',
//     kmsDone: '2241',
//     modelYear: '2022',

//     color: 'Red',
//     owner: '1',
//     transmission: 'Manual',
//     fuelType: 'Petrol',

//     bodyType: 'SUV',
//     seatingCapacity: '5',
//     engineCapacity: '1197 cc',
//     mileage: '19.4 km/l',

//     insurance: 'Expired',
//     registrationType: 'Private',
//     registrationNumber: 'AB12CD3456',

//     city: 'Ahmedabad',
//     state: 'Gujarat',

//     description:
//         'Compact Hyundai Exter in good condition with comfortable '
//         'interior and useful modern features.',

//     features: [
//       'Touchscreen Infotainment',
//       'Air Conditioning',
//       'ABS',
//       'Rear Parking Camera',
//       'Power Windows',
//     ],

//     status: 'Available',

//     sellerName: 'Car Site',
//     sellerPhone: '+91 1234567890',

//     lastUpdated: '8 Oct 2026',
//   ),

//   CarDetailsModel(
//     manufacturer: 'Toyota',
//     carName: 'Fortuner',
//     variant: 'LXI',
//     carImage: 'assets/Fortuner.jpeg',
//     imgList: [],

//     price: '14.3 Lac',
//     kmsDone: '2241',
//     modelYear: '2022',

//     color: 'Black',
//     owner: '1',
//     transmission: 'Manual',
//     fuelType: 'Petrol',

//     bodyType: 'SUV',
//     seatingCapacity: '7',
//     engineCapacity: '2694 cc',
//     mileage: '10.0 km/l',

//     insurance: 'Expired',
//     registrationType: 'Private',
//     registrationNumber: 'AB12CD3456',

//     city: 'Gandhinagar',
//     state: 'Gujarat',

//     description:
//         'Premium Toyota Fortuner with spacious cabin, strong road presence '
//         'and comfortable driving experience.',

//     features: [
//       'Leather Seats',
//       'Touchscreen Infotainment',
//       'Rear Camera',
//       'Cruise Control',
//       'Alloy Wheels',
//     ],

//     status: 'Available',

//     sellerName: 'Car Site',
//     sellerPhone: '+91 1234567890',

//     lastUpdated: '8 Oct 2026',
//   ),

//   CarDetailsModel(
//     manufacturer: 'Toyota',
//     carName: 'Hyrider',
//     variant: 'LXI',
//     carImage: 'assets/hyrider.jpeg',
//     imgList: [],

//     price: '14.3 Lac',
//     kmsDone: '2241',
//     modelYear: '2022',

//     color: 'Black',
//     owner: '1',
//     transmission: 'Manual',
//     fuelType: 'Petrol',

//     bodyType: 'SUV',
//     seatingCapacity: '5',
//     engineCapacity: '1462 cc',
//     mileage: '21.1 km/l',

//     insurance: 'Expired',
//     registrationType: 'Private',
//     registrationNumber: 'AB12CD3456',

//     city: 'Ahmedabad',
//     state: 'Gujarat',

//     description:
//         'Toyota Hyryder with efficient performance, comfortable interior '
//         'and modern styling.',

//     features: [
//       'Touchscreen Infotainment',
//       'Cruise Control',
//       'Rear Camera',
//       'Alloy Wheels',
//       'Automatic Climate Control',
//     ],

//     status: 'Available',

//     sellerName: 'Car Site',
//     sellerPhone: '+91 1234567890',

//     lastUpdated: '8 Oct 2026',
//   ),

//   CarDetailsModel(
//     manufacturer: 'Tata',
//     carName: 'Nexon',
//     variant: 'LXI',
//     carImage: 'assets/nexon.jpeg',
//     imgList: [],

//     price: '14.3 Lac',
//     kmsDone: '2241',
//     modelYear: '2022',

//     color: 'Red',
//     owner: '1',
//     transmission: 'Manual',
//     fuelType: 'Petrol',

//     bodyType: 'SUV',
//     seatingCapacity: '5',
//     engineCapacity: '1199 cc',
//     mileage: '17.4 km/l',

//     insurance: 'Expired',
//     registrationType: 'Private',
//     registrationNumber: 'AB12CD3456',

//     city: 'Gandhinagar',
//     state: 'Gujarat',

//     description:
//         'Tata Nexon in good condition with a practical interior and '
//         'strong safety features.',

//     features: [
//       'ABS',
//       'Airbags',
//       'Rear Parking Camera',
//       'Touchscreen Infotainment',
//       'Power Windows',
//     ],

//     status: 'Available',

//     sellerName: 'Car Site',
//     sellerPhone: '+91 1234567890',

//     lastUpdated: '8 Oct 2026',
//   ),

//   CarDetailsModel(
//     manufacturer: 'Tata',
//     carName: 'Safari',
//     variant: 'LXI',
//     carImage: 'assets/safari.jpeg',
//     imgList: [],

//     price: '14.3 Lac',
//     kmsDone: '2241',
//     modelYear: '2022',

//     color: 'Golden',
//     owner: '1',
//     transmission: 'Manual',
//     fuelType: 'Petrol',

//     bodyType: 'SUV',
//     seatingCapacity: '7',
//     engineCapacity: '1956 cc',
//     mileage: '14.5 km/l',

//     insurance: 'Expired',
//     registrationType: 'Private',
//     registrationNumber: 'AB12CD3456',

//     city: 'Ahmedabad',
//     state: 'Gujarat',

//     description:
//         'Spacious Tata Safari offering comfortable seating, premium interior '
//         'and a smooth driving experience.',

//     features: [
//       'Panoramic Sunroof',
//       'Touchscreen Infotainment',
//       'Cruise Control',
//       'Rear Camera',
//       'Alloy Wheels',
//     ],

//     status: 'Available',

//     sellerName: 'Car Site',
//     sellerPhone: '+91 1234567890',

//     lastUpdated: '8 Oct 2026',
//   ),

//   CarDetailsModel(
//     manufacturer: 'Maruti Suzuki',
//     carName: 'Swift',
//     variant: 'LXI',
//     carImage: 'assets/swift.jpeg',
//     imgList: [],

//     price: '14.3 Lac',
//     kmsDone: '2241',
//     modelYear: '2022',

//     color: 'Blue',
//     owner: '1',
//     transmission: 'Manual',
//     fuelType: 'Petrol',

//     bodyType: 'Hatchback',
//     seatingCapacity: '5',
//     engineCapacity: '1197 cc',
//     mileage: '22.4 km/l',

//     insurance: 'Expired',
//     registrationType: 'Private',
//     registrationNumber: 'AB12CD3456',

//     city: 'Gandhinagar',
//     state: 'Gujarat',

//     description:
//         'Popular Maruti Suzuki Swift with excellent city drivability, '
//         'good mileage and easy maintenance.',

//     features: [
//       'Air Conditioning',
//       'Power Windows',
//       'ABS',
//       'Touchscreen Infotainment',
//       'Rear Parking Sensors',
//     ],

//     status: 'Available',

//     sellerName: 'Car Site',
//     sellerPhone: '+91 1234567890',

//     lastUpdated: '8 Oct 2026',
//   ),

//   CarDetailsModel(
//     manufacturer: 'Hyundai',
//     carName: 'Verna',
//     variant: 'LXI',
//     carImage: 'assets/verna.jpeg',
//     imgList: [],

//     price: '14.3 Lac',
//     kmsDone: '2241',
//     modelYear: '2022',

//     color: 'Red',
//     owner: '1',
//     transmission: 'Manual',
//     fuelType: 'Petrol',

//     bodyType: 'Sedan',
//     seatingCapacity: '5',
//     engineCapacity: '1497 cc',
//     mileage: '19.2 km/l',

//     insurance: 'Expired',
//     registrationType: 'Private',
//     registrationNumber: 'AB12CD3456',

//     city: 'Ahmedabad',
//     state: 'Gujarat',

//     description:
//         'Hyundai Verna with a comfortable cabin, smooth performance '
//         'and modern features.',

//     features: [
//       'Ventilated Seats',
//       'Touchscreen Infotainment',
//       'Rear Camera',
//       'Cruise Control',
//       'Alloy Wheels',
//     ],

//     status: 'Available',

//     sellerName: 'Car Site',
//     sellerPhone: '+91 1234567890',

//     lastUpdated: '8 Oct 2026',
//   ),
// ];
