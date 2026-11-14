// import 'package:flutter/material.dart';

// class SellCarsPage extends StatefulWidget {
//   const SellCarsPage({super.key});

//   @override
//   State<SellCarsPage> createState() => _SellCarsPageState();
// }

// class _SellCarsPageState extends State<SellCarsPage> {
//   List carCompanies = [
//     "Maruti Suzuki",
//     "Tata Motors",
//     "Hyundai",
//     "Mahindra",
//     "Kia",
//     "Toyota",
//     "Honda",
//     "MG Motor",
//     "Renault",
//     "Skoda",
//     "Volkswagen",
//     "Nissan",
//     "BMW",
//     "Mercedes-Benz",
//     "Audi",
//     "Jaguar Land Rover",
//     "Volvo",
//     "Porsche",
//     "Lexus",
//     "Jeep",
//   ];
//   List modelYearList = [];

//   List<String> getPreviousTwelveYears() {
//     final int currentYear = DateTime.now().year;
//     List<String> years = [];
//     for (int i = 0; i < 12; i++) {
//       years.add('${currentYear - i}');
//     }
//     return years;
//   }

//   @override
//   void initState() {
//     super.initState();
//     modelYearList = getPreviousTwelveYears();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: Colors.white,
//       padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Text(
//             "Sell Your Car",
//             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             "Looking to sell your car? At Car Site, we make it easy. "
//             "Submit your car details, and our experts will help you get the best price "
//             "through our trusted network of buyers.",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 16, height: 1.5),
//           ),
//           const SizedBox(height: 40),

//           // ✅ Simple form for car selling
//           ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 600),
//             child: Column(
//               children: [
//                 _inputField(label: "Car Make & Model"),

//                 // Padding(
//                 //   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 //   child: dropDownWidget(
//                 //     carCompanies,
//                 //     'Manufacturer',
//                 //     onChanged: (value) {},
//                 //   ),
//                 // ),
//                 // Padding(
//                 //   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 //   child: dropDownWidget(
//                 //     modelYearList,
//                 //     'Model Year',
//                 //     onChanged: (value) {},
//                 //   ),
//                 // ),
//                 _inputField(label: "Year"),
//                 _inputField(label: "Mileage (km)"),
//                 _inputField(label: "Expected Price"),
//                 _inputField(label: "Your Contact Info"),
//                 const SizedBox(height: 20),

//                 ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 40,
//                       vertical: 16,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {
//                     // TODO: Implement form submission
//                   },
//                   icon: const Icon(Icons.sell),
//                   label: const Text(
//                     "Submit Car for Sale",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   DropdownButtonFormField dropDownWidget(
//     List items,
//     String lable, {
//     required void Function(dynamic)? onChanged,
//   }) {
//     return DropdownButtonFormField(
//       items:
//           items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         label: Text(lable),
//         border: _border(),
//         enabledBorder: _border(),
//         focusedBorder: _border(),
//       ),
//     );
//   }

//   // ✅ Reusable input field
//   Widget _inputField({required String label}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         decoration: InputDecoration(
//           labelText: label,
//           border: _border(),
//           enabledBorder: _border(),
//           focusedBorder: _border(),

//           // filled: true,
//           // fillColor: Colors.grey[100],
//         ),
//       ),
//     );
//   }

//   static InputBorder _border() {
//     return OutlineInputBorder(borderRadius: BorderRadius.circular(10));
//   }
// }

//------------------- NEW CODE
import 'package:car_site/utils/my_colors.dart';
import 'package:flutter/material.dart';

class SellCarsPage extends StatefulWidget {
  const SellCarsPage({super.key});

  @override
  State<SellCarsPage> createState() => _SellCarsPageState();
}

class _SellCarsPageState extends State<SellCarsPage> {
  List carCompanies = [
    "Maruti Suzuki",
    "Tata Motors",
    "Hyundai",
    "Mahindra",
    "Kia",
    "Toyota",
    "Honda",
    "MG Motor",
    "Renault",
    "Skoda",
    "Volkswagen",
    "Nissan",
    "BMW",
    "Mercedes-Benz",
    "Audi",
    "Jaguar Land Rover",
    "Volvo",
    "Porsche",
    "Lexus",
    "Jeep",
  ];

  List modelYearList = [];

  String? selectedCompany;
  String? selectedYear;

  String? selectedFuelType;
  String? selectedTransmission;
  String? selectedCondition;

  final List<String> fuelTypes = [
    'Petrol',
    'Diesel',
    'CNG',
    'Electric',
    'Hybrid',
  ];

  final List<String> transmissionTypes = ['Manual', 'Automatic'];

  final List<String> conditions = ['Excellent', 'Good', 'Fair'];

  List<String> getPreviousTwelveYears() {
    final int currentYear = DateTime.now().year;

    List<String> years = [];

    for (int i = 0; i < 12; i++) {
      years.add('${currentYear - i}');
    }

    return years;
  }

  @override
  void initState() {
    super.initState();

    modelYearList = getPreviousTwelveYears();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 600;

    return Container(
      width: double.infinity,
      color: myColors.background,

      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : 30,
        vertical: isMobile ? 35 : 55,
      ),

      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1050),

          child: Column(
            children: [
              // ========================================================
              // HEADER
              // ========================================================
              Text(
                'Sell Your Car',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: myColors.text,
                  fontSize: isMobile ? 27 : 34,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: 650,
                child: Text(
                  'List your car with Car Site and connect with interested buyers or trusted dealers.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: myColors.secondaryText,
                    fontSize: isMobile ? 13 : 15,
                    height: 1.6,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // ========================================================
              // FORM CARD
              // ========================================================
              Container(
                width: double.infinity,

                padding: EdgeInsets.all(isMobile ? 18 : 30),

                decoration: BoxDecoration(
                  color: myColors.card,
                  borderRadius: BorderRadius.circular(18),

                  border: Border.all(color: myColors.border),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // ==================================================
                    // FORM TITLE
                    // ==================================================
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,

                          decoration: BoxDecoration(
                            color: myColors.highlightLight,
                            borderRadius: BorderRadius.circular(11),
                          ),

                          child: Icon(
                            Icons.directions_car_outlined,
                            color: myColors.highlight,
                            size: 22,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Car Information',
                              style: TextStyle(
                                color: myColors.text,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(height: 2),

                            Text(
                              'Tell us about your car',
                              style: TextStyle(
                                color: myColors.secondaryText,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // ==================================================
                    // COMPANY + YEAR
                    // ==================================================
                    if (isMobile)
                      Column(
                        children: [
                          dropDownWidget(
                            carCompanies,
                            'Manufacturer',
                            value: selectedCompany,
                            prefixIcon: Icons.business_outlined,
                            onChanged: (value) {
                              setState(() {
                                selectedCompany = value;
                              });
                            },
                          ),

                          const SizedBox(height: 15),

                          dropDownWidget(
                            modelYearList,
                            'Model Year',
                            value: selectedYear,
                            prefixIcon: Icons.calendar_today_outlined,
                            onChanged: (value) {
                              setState(() {
                                selectedYear = value;
                              });
                            },
                          ),
                        ],
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: dropDownWidget(
                              carCompanies,
                              'Manufacturer',
                              value: selectedCompany,
                              prefixIcon: Icons.business_outlined,
                              onChanged: (value) {
                                setState(() {
                                  selectedCompany = value;
                                });
                              },
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: dropDownWidget(
                              modelYearList,
                              'Model Year',
                              value: selectedYear,
                              prefixIcon: Icons.calendar_today_outlined,
                              onChanged: (value) {
                                setState(() {
                                  selectedYear = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 15),

                    // ==================================================
                    // MODEL
                    // ==================================================
                    _inputField(
                      label: 'Car Model',
                      hint: 'e.g. Creta, Swift, Nexon',
                      icon: Icons.directions_car_outlined,
                    ),

                    const SizedBox(height: 15),

                    // ==================================================
                    // MILEAGE + PRICE
                    // ==================================================
                    if (isMobile)
                      Column(
                        children: [
                          _inputField(
                            label: 'Mileage (km)',
                            hint: 'e.g. 32000',
                            icon: Icons.speed_outlined,
                            keyboardType: TextInputType.number,
                          ),

                          const SizedBox(height: 15),

                          _inputField(
                            label: 'Expected Price',
                            hint: 'e.g. ₹12,50,000',
                            icon: Icons.currency_rupee,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: _inputField(
                              label: 'Mileage (km)',
                              hint: 'e.g. 32000',
                              icon: Icons.speed_outlined,
                              keyboardType: TextInputType.number,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: _inputField(
                              label: 'Expected Price',
                              hint: 'e.g. ₹12,50,000',
                              icon: Icons.currency_rupee,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 15),

                    // ==================================================
                    // FUEL + TRANSMISSION
                    // ==================================================
                    if (isMobile)
                      Column(
                        children: [
                          dropDownWidget(
                            fuelTypes,
                            'Fuel Type',
                            value: selectedFuelType,
                            prefixIcon: Icons.local_gas_station_outlined,
                            onChanged: (value) {
                              setState(() {
                                selectedFuelType = value;
                              });
                            },
                          ),

                          const SizedBox(height: 15),

                          dropDownWidget(
                            transmissionTypes,
                            'Transmission',
                            value: selectedTransmission,
                            prefixIcon: Icons.settings_outlined,
                            onChanged: (value) {
                              setState(() {
                                selectedTransmission = value;
                              });
                            },
                          ),
                        ],
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: dropDownWidget(
                              fuelTypes,
                              'Fuel Type',
                              value: selectedFuelType,
                              prefixIcon: Icons.local_gas_station_outlined,
                              onChanged: (value) {
                                setState(() {
                                  selectedFuelType = value;
                                });
                              },
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: dropDownWidget(
                              transmissionTypes,
                              'Transmission',
                              value: selectedTransmission,
                              prefixIcon: Icons.settings_outlined,
                              onChanged: (value) {
                                setState(() {
                                  selectedTransmission = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 15),

                    // ==================================================
                    // CONDITION
                    // ==================================================
                    dropDownWidget(
                      conditions,
                      'Car Condition',
                      value: selectedCondition,
                      prefixIcon: Icons.verified_outlined,
                      onChanged: (value) {
                        setState(() {
                          selectedCondition = value;
                        });
                      },
                    ),

                    const SizedBox(height: 28),

                    // ==================================================
                    // CONTACT INFORMATION
                    // ==================================================
                    _sectionDivider(
                      icon: Icons.person_outline,
                      title: 'Contact Information',
                    ),

                    const SizedBox(height: 20),

                    _inputField(
                      label: 'Your Name',
                      hint: 'Enter your name',
                      icon: Icons.person_outline,
                    ),

                    const SizedBox(height: 15),

                    _inputField(
                      label: 'Mobile Number',
                      hint: 'Enter your mobile number',
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 15),

                    _inputField(
                      label: 'Location',
                      hint: 'e.g. Ahmedabad',
                      icon: Icons.location_on_outlined,
                    ),

                    const SizedBox(height: 28),

                    // ==================================================
                    // SUBMIT
                    // ==================================================
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // TODO:
                          // Implement form submission
                        },

                        icon: const Icon(Icons.sell_outlined, size: 20),

                        label: const Text(
                          'Submit Car for Sale',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: myColors.secondary,
                          foregroundColor: Colors.white,
                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ==================================================
                    // NOTE
                    // ==================================================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_outline,
                          size: 14,
                          color: myColors.secondaryText,
                        ),

                        const SizedBox(width: 6),

                        Flexible(
                          child: Text(
                            'Your information is safe and will only be used to contact you.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: myColors.secondaryText,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SECTION DIVIDER
  // ============================================================

  Widget _sectionDivider({required IconData icon, required String title}) {
    return Row(
      children: [
        Icon(icon, size: 19, color: myColors.highlight),

        const SizedBox(width: 8),

        Text(
          title,
          style: TextStyle(
            color: myColors.text,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(child: Divider(color: myColors.border)),
      ],
    );
  }

  // ============================================================
  // DROPDOWN
  // ============================================================

  Widget dropDownWidget(
    List items,
    String label, {
    required void Function(dynamic)? onChanged,
    dynamic value,
    IconData? prefixIcon,
  }) {
    return DropdownButtonFormField(
      value: value,

      isExpanded: true,

      items:
          items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.toString(), overflow: TextOverflow.ellipsis),
                ),
              )
              .toList(),

      onChanged: onChanged,

      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: myColors.secondaryText,
      ),

      decoration: InputDecoration(
        labelText: label,

        prefixIcon:
            prefixIcon == null
                ? null
                : Icon(prefixIcon, size: 20, color: myColors.secondaryText),

        border: _border(),

        enabledBorder: _border(),

        focusedBorder: _focusedBorder(),

        filled: true,

        fillColor: myColors.background,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
      ),
    );
  }

  // ============================================================
  // INPUT FIELD
  // ============================================================

  Widget _inputField({
    required String label,
    String? hint,
    IconData? icon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      keyboardType: keyboardType,

      decoration: InputDecoration(
        labelText: label,

        hintText: hint,

        prefixIcon:
            icon == null
                ? null
                : Icon(icon, size: 20, color: myColors.secondaryText),

        border: _border(),

        enabledBorder: _border(),

        focusedBorder: _focusedBorder(),

        filled: true,

        fillColor: myColors.background,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
      ),
    );
  }

  // ============================================================
  // BORDER
  // ============================================================

  InputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: myColors.border),
    );
  }

  InputBorder _focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: myColors.highlight, width: 1.5),
    );
  }
}
