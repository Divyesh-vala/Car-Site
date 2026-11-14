// import 'package:car_site/pages/add_car/add_car_conroller.dart';
// import 'package:car_site/utils/my_colors.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class AddCarPage extends StatefulWidget {
//   const AddCarPage({super.key});

//   @override
//   State<AddCarPage> createState() => _AddCarPageState();
// }

// class _AddCarPageState extends State<AddCarPage> {
//   late CarouselSliderController carouselController;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddCarConroller>(
//       builder:
//           (addCarValue) => Scaffold(
//             appBar: AppBar(title: Text('Add Car')),
//             body: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   bool isDesktop = constraints.maxWidth > 600;

//                   return Column(
//                     children: [
//                       SizedBox(
//                         width: isDesktop ? 500 : null,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildCarImage(context, isDesktop, addCarValue),
//                             const SizedBox(height: 20),

//                             // Overview
//                             const Text(
//                               "Car Overview",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             DropdownButtonFormField(
//                               value: addCarValue.manufacturerValue,
//                               items:
//                                   addCarValue.manufacturerList
//                                       .map(
//                                         (e) => DropdownMenuItem(
//                                           value: e,
//                                           child: Text(e.manufacturer),
//                                         ),
//                                       )
//                                       .toList(),
//                               onChanged: (value) {
//                                 if (value != null) {
//                                   addCarValue.selectManufacturer(value);
//                                 }
//                               },
//                               decoration: InputDecoration(
//                                 label: Text('Manufacturer'),
//                                 border: OutlineInputBorder(),
//                                 enabledBorder: OutlineInputBorder(),
//                                 focusedBorder: OutlineInputBorder(),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             DropdownButtonFormField(
//                               value: addCarValue.carValue,
//                               items:
//                                   addCarValue.carList
//                                       .map(
//                                         (e) => DropdownMenuItem(
//                                           value: e,
//                                           child: Text(e.carName),
//                                         ),
//                                       )
//                                       .toList(),
//                               onChanged: (value) {
//                                 if (value != null) {
//                                   addCarValue.selectCar(value);
//                                 }
//                               },
//                               decoration: InputDecoration(
//                                 label: Text('Car'),
//                                 border: OutlineInputBorder(),
//                                 enabledBorder: OutlineInputBorder(),
//                                 focusedBorder: OutlineInputBorder(),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             DropdownButtonFormField(
//                               value: addCarValue.carVarientValue,
//                               items:
//                                   addCarValue.carVarientList
//                                       .map(
//                                         (e) => DropdownMenuItem(
//                                           value: e,
//                                           child: Text(e),
//                                         ),
//                                       )
//                                       .toList(),
//                               onChanged: (value) {
//                                 addCarValue.selectCarVariant(value ?? '');
//                               },
//                               decoration: InputDecoration(
//                                 label: Text('Varient'),
//                                 border: OutlineInputBorder(),
//                                 enabledBorder: OutlineInputBorder(),
//                                 focusedBorder: OutlineInputBorder(),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: dropDownWidget(
//                                     addCarValue.modelYearList,
//                                     'Model Year',
//                                     onChanged: (value) {
//                                       addCarValue.selectModelYear(value);
//                                     },
//                                     value: addCarValue.yearValue,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Expanded(
//                                   child: dropDownWidget(
//                                     addCarValue.ownerList,
//                                     'Owner',
//                                     onChanged: (value) {
//                                       addCarValue.selectOwner(value);
//                                     },
//                                     value: addCarValue.ownerValue,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             dropDownWidget(
//                               addCarValue.insuranceList,
//                               'Insurance',
//                               onChanged: (value) {
//                                 addCarValue.selectInsurance(value);
//                               },
//                               value: addCarValue.insuranceValue,
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: dropDownWidget(
//                                     addCarValue.transmissionList,
//                                     'Transmission',
//                                     onChanged: (value) {
//                                       addCarValue.selectTransmission(value);
//                                     },
//                                     value: addCarValue.transmissionValue,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Expanded(
//                                   child: dropDownWidget(
//                                     addCarValue.registrationTypeList,
//                                     'Registration Type',
//                                     onChanged: (value) {
//                                       addCarValue.selectRegistrationType(value);
//                                     },
//                                     value: addCarValue.registrationTypeValue,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: dropDownWidget(
//                                     addCarValue.fuelTypeList,
//                                     'Fuel Type',
//                                     onChanged: (value) {
//                                       addCarValue.selectFuelType(value);
//                                     },
//                                     value: addCarValue.fuelTypeValue,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Expanded(
//                                   child: dropDownWidget(
//                                     addCarValue.colorList,
//                                     'Color',
//                                     onChanged: (value) {
//                                       addCarValue.selectColor(value);
//                                     },
//                                     value: addCarValue.colorValue,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: addCarValue.carRegistrationController,
//                               decoration: InputDecoration(
//                                 labelText: 'Car Registration Number',
//                                 hintText: 'e.g., AB 12 CD 3456',
//                                 border: OutlineInputBorder(),
//                                 enabledBorder: OutlineInputBorder(),
//                                 focusedBorder: OutlineInputBorder(),
//                                 counterText: '',
//                               ),
//                               maxLength: 10,

//                               keyboardType:
//                                   TextInputType
//                                       .text, // Or TextInputType.visiblePassword for mixed input
//                               textCapitalization:
//                                   TextCapitalization
//                                       .characters, // To automatically capitalize letters
//                               inputFormatters: [UpperCaseTextFormatter()],
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: addCarValue.kilometerController,
//                               decoration: InputDecoration(
//                                 labelText: 'Kms Done',
//                                 hintText: 'e.g., 4567',
//                                 border: OutlineInputBorder(),
//                                 enabledBorder: OutlineInputBorder(),
//                                 focusedBorder: OutlineInputBorder(),
//                                 counterText: '',
//                               ),
//                               maxLength: 10,
//                               keyboardType: TextInputType.number,
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.digitsOnly,
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: addCarValue.priceController,
//                               decoration: InputDecoration(
//                                 labelText: 'Price',
//                                 border: OutlineInputBorder(),
//                                 enabledBorder: OutlineInputBorder(),
//                                 focusedBorder: OutlineInputBorder(),
//                                 counterText: '',
//                               ),
//                               maxLength: 10,
//                               keyboardType: TextInputType.number,
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.digitsOnly,
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),

//                       const SizedBox(height: 30),

//                       // CTA Button
//                       Center(
//                         child: SizedBox(
//                           width: isDesktop ? 300 : double.infinity,
//                           child: ElevatedButton.icon(
//                             onPressed: () {
//                               // TODO: handle enquiry / booking
//                               addCarValue.addCar();
//                             },
//                             // icon: const Icon(Icons.steeing),
//                             label: const Text("Add Car"),
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                               textStyle: const TextStyle(fontSize: 18),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//     );
//   }

//   // Car Image
//   Widget _buildCarImage(
//     BuildContext context,
//     bool isDesktop,
//     AddCarConroller addCarValue,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: ElevatedButton(
//             onPressed: () {
//               addCarValue.selectImg();
//             },
//             child: Text('Select Car Images'),
//           ),
//         ),
//         GridView.builder(
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 200,
//             mainAxisSpacing: 2,
//             crossAxisSpacing: 2,
//           ),
//           itemCount: addCarValue.imgList.length,
//           itemBuilder:
//               (context, index) => Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       color: myColors.neutral,
//                     ),
//                     padding: EdgeInsets.all(3),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(6),

//                       child: Image.memory(addCarValue.imgList[index]),
//                     ),
//                   ),
//                   Positioned(
//                     top: 0,
//                     right: 0,
//                     child: IconButton.filled(
//                       color: myColors.primary,
//                       onPressed: () {
//                         addCarValue.removeImg(index);
//                       },
//                       icon: Icon(Icons.close, color: myColors.tertiary),
//                     ),
//                   ),
//                 ],
//               ),
//         ),
//         const SizedBox(height: 3),
//       ],
//     );
//   }

//   DropdownButtonFormField dropDownWidget(
//     List items,
//     String lable, {
//     required void Function(dynamic)? onChanged,
//     required dynamic value,
//   }) {
//     return DropdownButtonFormField(
//       value: value,
//       items:
//           items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         label: Text(lable),
//         border: OutlineInputBorder(),
//         enabledBorder: OutlineInputBorder(),
//         focusedBorder: OutlineInputBorder(),
//       ),
//     );
//   }
// }

// class UpperCaseTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     return TextEditingValue(
//       text: newValue.text.toUpperCase(),
//       selection: newValue.selection,
//     );
//   }
// }

//-------------- NEW CODE

import 'package:car_site/pages/add_car/add_car_conroller.dart';
import 'package:car_site/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({super.key});

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1000;

    return GetBuilder<AddCarConroller>(
      builder: (addCarValue) {
        return Scaffold(
          backgroundColor: myColors.background,

          appBar: AppBar(
            elevation: 0,
            backgroundColor: myColors.card,
            surfaceTintColor: Colors.transparent,

            title: Text(
              'Add Car',
              style: TextStyle(
                color: myColors.text,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),

            iconTheme: IconThemeData(color: myColors.text),
          ),

          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 24,
              vertical: isMobile ? 20 : 30,
            ),

            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // =====================================================
                    // PAGE HEADER
                    // =====================================================
                    Text(
                      'Add a New Car',
                      style: TextStyle(
                        color: myColors.text,
                        fontSize: isMobile ? 24 : 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'Add car details and images to your catalogue.',
                      style: TextStyle(
                        color: myColors.secondaryText,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // =====================================================
                    // MAIN CARD
                    // =====================================================
                    Container(
                      width: double.infinity,

                      padding: EdgeInsets.all(isMobile ? 16 : 28),

                      decoration: BoxDecoration(
                        color: myColors.card,
                        borderRadius: BorderRadius.circular(18),

                        border: Border.all(color: myColors.border),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.035),
                            blurRadius: 18,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          // =================================================
                          // IMAGE SECTION
                          // =================================================
                          _sectionHeader(
                            icon: Icons.photo_library_outlined,
                            title: 'Car Images',
                            subtitle: 'Add clear photos of the vehicle',
                          ),

                          const SizedBox(height: 18),

                          _buildCarImage(context, isMobile, addCarValue),

                          const SizedBox(height: 32),

                          // =================================================
                          // OVERVIEW
                          // =================================================
                          _sectionHeader(
                            icon: Icons.directions_car_outlined,
                            title: 'Car Overview',
                            subtitle: 'Basic information about the vehicle',
                          ),

                          const SizedBox(height: 20),

                          // Manufacturer + Car
                          if (isMobile)
                            Column(
                              children: [
                                _manufacturerDropdown(addCarValue),

                                const SizedBox(height: 14),

                                _carDropdown(addCarValue),
                              ],
                            )
                          else
                            Row(
                              children: [
                                Expanded(
                                  child: _manufacturerDropdown(addCarValue),
                                ),

                                const SizedBox(width: 14),

                                Expanded(child: _carDropdown(addCarValue)),
                              ],
                            ),

                          const SizedBox(height: 14),

                          // Variant
                          _variantDropdown(addCarValue),

                          const SizedBox(height: 14),

                          // Year + Owner
                          if (isMobile)
                            Column(
                              children: [
                                dropDownWidget(
                                  addCarValue.modelYearList,
                                  'Model Year',
                                  onChanged: (value) {
                                    addCarValue.selectModelYear(value);
                                  },
                                  value: addCarValue.yearValue,
                                  icon: Icons.calendar_today_outlined,
                                ),

                                const SizedBox(height: 14),

                                dropDownWidget(
                                  addCarValue.ownerList,
                                  'Owner',
                                  onChanged: (value) {
                                    addCarValue.selectOwner(value);
                                  },
                                  value: addCarValue.ownerValue,
                                  icon: Icons.person_outline,
                                ),
                              ],
                            )
                          else
                            Row(
                              children: [
                                Expanded(
                                  child: dropDownWidget(
                                    addCarValue.modelYearList,
                                    'Model Year',
                                    onChanged: (value) {
                                      addCarValue.selectModelYear(value);
                                    },
                                    value: addCarValue.yearValue,
                                    icon: Icons.calendar_today_outlined,
                                  ),
                                ),

                                const SizedBox(width: 14),

                                Expanded(
                                  child: dropDownWidget(
                                    addCarValue.ownerList,
                                    'Owner',
                                    onChanged: (value) {
                                      addCarValue.selectOwner(value);
                                    },
                                    value: addCarValue.ownerValue,
                                    icon: Icons.person_outline,
                                  ),
                                ),
                              ],
                            ),

                          const SizedBox(height: 14),

                          // Insurance
                          dropDownWidget(
                            addCarValue.insuranceList,
                            'Insurance',
                            onChanged: (value) {
                              addCarValue.selectInsurance(value);
                            },
                            value: addCarValue.insuranceValue,
                            icon: Icons.verified_user_outlined,
                          ),

                          const SizedBox(height: 32),

                          // =================================================
                          // SPECIFICATIONS
                          // =================================================
                          _sectionHeader(
                            icon: Icons.tune_outlined,
                            title: 'Specifications',
                            subtitle: 'Vehicle specifications and registration',
                          ),

                          const SizedBox(height: 20),

                          // Transmission + Registration
                          if (isMobile)
                            Column(
                              children: [
                                dropDownWidget(
                                  addCarValue.transmissionList,
                                  'Transmission',
                                  onChanged: (value) {
                                    addCarValue.selectTransmission(value);
                                  },
                                  value: addCarValue.transmissionValue,
                                  icon: Icons.settings_outlined,
                                ),

                                const SizedBox(height: 14),

                                dropDownWidget(
                                  addCarValue.registrationTypeList,
                                  'Registration Type',
                                  onChanged: (value) {
                                    addCarValue.selectRegistrationType(value);
                                  },
                                  value: addCarValue.registrationTypeValue,
                                  icon: Icons.badge_outlined,
                                ),
                              ],
                            )
                          else
                            Row(
                              children: [
                                Expanded(
                                  child: dropDownWidget(
                                    addCarValue.transmissionList,
                                    'Transmission',
                                    onChanged: (value) {
                                      addCarValue.selectTransmission(value);
                                    },
                                    value: addCarValue.transmissionValue,
                                    icon: Icons.settings_outlined,
                                  ),
                                ),

                                const SizedBox(width: 14),

                                Expanded(
                                  child: dropDownWidget(
                                    addCarValue.registrationTypeList,
                                    'Registration Type',
                                    onChanged: (value) {
                                      addCarValue.selectRegistrationType(value);
                                    },
                                    value: addCarValue.registrationTypeValue,
                                    icon: Icons.badge_outlined,
                                  ),
                                ),
                              ],
                            ),

                          const SizedBox(height: 14),

                          // Fuel + Color
                          if (isMobile)
                            Column(
                              children: [
                                dropDownWidget(
                                  addCarValue.fuelTypeList,
                                  'Fuel Type',
                                  onChanged: (value) {
                                    addCarValue.selectFuelType(value);
                                  },
                                  value: addCarValue.fuelTypeValue,
                                  icon: Icons.local_gas_station_outlined,
                                ),

                                const SizedBox(height: 14),

                                dropDownWidget(
                                  addCarValue.colorList,
                                  'Color',
                                  onChanged: (value) {
                                    addCarValue.selectColor(value);
                                  },
                                  value: addCarValue.colorValue,
                                  icon: Icons.palette_outlined,
                                ),
                              ],
                            )
                          else
                            Row(
                              children: [
                                Expanded(
                                  child: dropDownWidget(
                                    addCarValue.fuelTypeList,
                                    'Fuel Type',
                                    onChanged: (value) {
                                      addCarValue.selectFuelType(value);
                                    },
                                    value: addCarValue.fuelTypeValue,
                                    icon: Icons.local_gas_station_outlined,
                                  ),
                                ),

                                const SizedBox(width: 14),

                                Expanded(
                                  child: dropDownWidget(
                                    addCarValue.colorList,
                                    'Color',
                                    onChanged: (value) {
                                      addCarValue.selectColor(value);
                                    },
                                    value: addCarValue.colorValue,
                                    icon: Icons.palette_outlined,
                                  ),
                                ),
                              ],
                            ),

                          const SizedBox(height: 14),

                          // Registration Number
                          _textField(
                            controller: addCarValue.carRegistrationController,
                            label: 'Car Registration Number',
                            hint: 'e.g. GJ01AB1234',
                            icon: Icons.confirmation_number_outlined,
                            maxLength: 10,
                            keyboardType: TextInputType.text,
                            inputFormatters: [UpperCaseTextFormatter()],
                          ),

                          const SizedBox(height: 14),

                          // =================================================
                          // PRICE & USAGE
                          // =================================================
                          _sectionHeader(
                            icon: Icons.payments_outlined,
                            title: 'Price & Usage',
                            subtitle: 'Add mileage and asking price',
                          ),

                          const SizedBox(height: 20),

                          if (isMobile)
                            Column(
                              children: [
                                _textField(
                                  controller: addCarValue.kilometerController,
                                  label: 'Kilometers Done',
                                  hint: 'e.g. 32000',
                                  icon: Icons.speed_outlined,
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),

                                const SizedBox(height: 14),

                                _textField(
                                  controller: addCarValue.priceController,
                                  label: 'Price',
                                  hint: 'e.g. 1250000',
                                  icon: Icons.currency_rupee,
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ],
                            )
                          else
                            Row(
                              children: [
                                Expanded(
                                  child: _textField(
                                    controller: addCarValue.kilometerController,
                                    label: 'Kilometers Done',
                                    hint: 'e.g. 32000',
                                    icon: Icons.speed_outlined,
                                    maxLength: 10,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 14),

                                Expanded(
                                  child: _textField(
                                    controller: addCarValue.priceController,
                                    label: 'Price',
                                    hint: 'e.g. 1250000',
                                    icon: Icons.currency_rupee,
                                    maxLength: 10,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          const SizedBox(height: 30),

                          // =================================================
                          // ADD CAR BUTTON
                          // =================================================
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                addCarValue.addCar();
                              },

                              icon: const Icon(
                                Icons.add_circle_outline,
                                size: 20,
                              ),

                              label: const Text(
                                'Add Car',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              style: ElevatedButton.styleFrom(
                                backgroundColor: myColors.secondary,
                                foregroundColor: Colors.white,
                                elevation: 0,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Center(
                            child: Text(
                              'Make sure all car information is correct before adding.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: myColors.secondaryText,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // SECTION HEADER
  // ============================================================

  Widget _sectionHeader({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: myColors.highlightLight,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(icon, color: myColors.highlight, size: 21),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: myColors.text,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                subtitle,
                style: TextStyle(color: myColors.secondaryText, fontSize: 11),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // MANUFACTURER DROPDOWN
  // ============================================================

  Widget _manufacturerDropdown(AddCarConroller addCarValue) {
    return dropDownWidget(
      addCarValue.manufacturerList,
      'Manufacturer',
      onChanged: (value) {
        if (value != null) {
          addCarValue.selectManufacturer(value);
        }
      },
      value: addCarValue.manufacturerValue,
      icon: Icons.business_outlined,
      itemBuilder: (e) => e.manufacturer,
    );
  }

  // ============================================================
  // CAR DROPDOWN
  // ============================================================

  Widget _carDropdown(AddCarConroller addCarValue) {
    return dropDownWidget(
      addCarValue.carList,
      'Car',
      onChanged: (value) {
        if (value != null) {
          addCarValue.selectCar(value);
        }
      },
      value: addCarValue.carValue,
      icon: Icons.directions_car_outlined,
      itemBuilder: (e) => e.carName,
    );
  }

  // ============================================================
  // VARIANT DROPDOWN
  // ============================================================

  Widget _variantDropdown(AddCarConroller addCarValue) {
    return dropDownWidget(
      addCarValue.carVarientList,
      'Variant',
      onChanged: (value) {
        addCarValue.selectCarVariant(value ?? '');
      },
      value: addCarValue.carVarientValue,
      icon: Icons.tune_outlined,
    );
  }

  // ============================================================
  // IMAGE SECTION
  // ============================================================

  Widget _buildCarImage(
    BuildContext context,
    bool isMobile,
    AddCarConroller addCarValue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upload button
        SizedBox(
          height: 45,
          child: OutlinedButton.icon(
            onPressed: () {
              addCarValue.selectImg();
            },

            icon: Icon(
              Icons.add_photo_alternate_outlined,
              color: myColors.highlight,
              size: 20,
            ),

            label: Text(
              'Select Car Images',
              style: TextStyle(
                color: myColors.highlight,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),

            style: OutlinedButton.styleFrom(
              side: BorderSide(color: myColors.border),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        const SizedBox(height: 14),

        // Empty state
        if (addCarValue.imgList.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: myColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: myColors.border),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.photo_library_outlined,
                  color: myColors.neutral,
                  size: 38,
                ),

                const SizedBox(height: 10),

                Text(
                  'No images selected',
                  style: TextStyle(
                    color: myColors.text,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  'Add clear photos of the car',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: myColors.secondaryText, fontSize: 11),
                ),
              ],
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 4,

              mainAxisSpacing: 10,
              crossAxisSpacing: 10,

              childAspectRatio: 1.25,
            ),

            itemCount: addCarValue.imgList.length,

            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: myColors.neutral,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      padding: const EdgeInsets.all(3),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9),

                        child: Image.memory(
                          addCarValue.imgList[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 5,
                    right: 5,

                    child: GestureDetector(
                      onTap: () {
                        addCarValue.removeImg(index);
                      },

                      child: Container(
                        width: 28,
                        height: 28,

                        decoration: BoxDecoration(
                          color: myColors.error,
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
      ],
    );
  }

  // ============================================================
  // TEXT FIELD
  // ============================================================

  Widget _textField({
    required TextEditingController controller,
    required String label,
    String? hint,
    IconData? icon,
    int? maxLength,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextField(
      controller: controller,

      maxLength: maxLength,

      keyboardType: keyboardType,

      inputFormatters: inputFormatters,

      decoration: InputDecoration(
        labelText: label,
        hintText: hint,

        counterText: '',

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
          vertical: 15,
        ),
      ),
    );
  }

  // ============================================================
  // DROPDOWN
  // ============================================================

  Widget dropDownWidget(
    List items,
    String label, {
    required void Function(dynamic)? onChanged,
    required dynamic value,
    IconData? icon,
    String Function(dynamic)? itemBuilder,
  }) {
    return DropdownButtonFormField(
      value: value,

      isExpanded: true,

      items:
          items.map((e) {
            return DropdownMenuItem(
              value: e,

              child: Text(
                itemBuilder != null ? itemBuilder(e) : e.toString(),

                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),

      onChanged: onChanged,

      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: myColors.secondaryText,
      ),

      decoration: InputDecoration(
        labelText: label,

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
          vertical: 15,
        ),
      ),
    );
  }

  // ============================================================
  // BORDERS
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

      borderSide: BorderSide(color: myColors.highlight, width: 1.4),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// UPPERCASE FORMATTER
// ═══════════════════════════════════════════════════════════════

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
