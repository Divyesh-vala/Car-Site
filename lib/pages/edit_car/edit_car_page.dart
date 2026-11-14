import 'package:car_site/pages/edit_car/edit_car_controller.dart';
import 'package:car_site/utils/my_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EditCarPage extends StatefulWidget {
  const EditCarPage({super.key});

  @override
  State<EditCarPage> createState() => _EditCarPageState();
}

class _EditCarPageState extends State<EditCarPage> {
  late CarouselSliderController carouselController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCarController>(
      builder:
          (editCarValue) => Scaffold(
            appBar: AppBar(title: Text('Edit Car')),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isDesktop = constraints.maxWidth > 600;

                  return Column(
                    children: [
                      SizedBox(
                        width: isDesktop ? 500 : null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCarImage(context, isDesktop, editCarValue),
                            const SizedBox(height: 20),

                            // Overview
                            const Text(
                              "Car Overview",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // dropDownWidget(
                            //   carCompanies,
                            //   'Car Made By',
                            //   onChanged: (value) {
                            //     print('value --> $value');
                            //     editCarValue.loadJsonData(value);
                            //   },
                            // ),
                            const SizedBox(height: 10),
                            // if (editCarValue.manufacturerList.isNotEmpty)
                            DropdownButtonFormField(
                              value: editCarValue.manufacturerValue,
                              items:
                                  editCarValue.manufacturerList
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.manufacturer),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  editCarValue.selectManufacturer(value);
                                }
                              },
                              decoration: InputDecoration(
                                label: Text('Manufacturer'),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // if (editCarValue.carList.isNotEmpty)
                            DropdownButtonFormField(
                              value: editCarValue.carValue,
                              items:
                                  editCarValue.carList
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.carName),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  editCarValue.selectCar(value);
                                }
                              },
                              decoration: InputDecoration(
                                label: Text('Car'),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // if (editCarValue.carVarientList.isNotEmpty)
                            DropdownButtonFormField(
                              value: editCarValue.carVarientValue,
                              items:
                                  editCarValue.carVarientList
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {
                                editCarValue.selectCarVariant(value ?? '');
                              },
                              decoration: InputDecoration(
                                label: Text('Varient'),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: dropDownWidget(
                                    editCarValue.modelYearList,
                                    'Model Year',
                                    onChanged: (value) {
                                      editCarValue.selectModelYear(value);
                                    },
                                    value: editCarValue.yearValue,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: dropDownWidget(
                                    editCarValue.ownerList,
                                    'Owner',
                                    onChanged: (value) {
                                      editCarValue.selectOwner(value);
                                    },
                                    value: editCarValue.ownerValue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            dropDownWidget(
                              editCarValue.insuranceList,
                              'Insurance',
                              onChanged: (value) {
                                editCarValue.selectInsurance(value);
                              },
                              value: editCarValue.insuranceValue,
                            ),
                            const SizedBox(height: 10),
                            // dropDownWidget(transmissionList, 'Transmission'),
                            // const SizedBox(height: 10),
                            // dropDownWidget(registrationTypeList, 'Registration Type'),
                            Row(
                              children: [
                                Expanded(
                                  child: dropDownWidget(
                                    editCarValue.transmissionList,
                                    'Transmission',
                                    onChanged: (value) {
                                      editCarValue.selectTransmission(value);
                                    },
                                    value: editCarValue.transmissionValue,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: dropDownWidget(
                                    editCarValue.registrationTypeList,
                                    'Registration Type',
                                    onChanged: (value) {
                                      editCarValue.selectRegistrationType(
                                        value,
                                      );
                                    },
                                    value: editCarValue.registrationTypeValue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: dropDownWidget(
                                    editCarValue.fuelTypeList,
                                    'Fuel Type',
                                    onChanged: (value) {
                                      editCarValue.selectFuelType(value);
                                    },
                                    value: editCarValue.fuelTypeValue,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: dropDownWidget(
                                    editCarValue.colorList,
                                    'Color',
                                    onChanged: (value) {
                                      editCarValue.selectColor(value);
                                    },
                                    value: editCarValue.colorValue,
                                  ),
                                ),
                              ],
                            ),
                            // dropDownWidget(fuelTypeList, 'Fuel Type'),
                            // const SizedBox(height: 10),
                            // dropDownWidget(colorList, 'Color'),
                            const SizedBox(height: 10),
                            TextField(
                              controller:
                                  editCarValue.carRegistrationController,
                              decoration: InputDecoration(
                                labelText: 'Car Registration Number',
                                hintText: 'e.g., AB 12 CD 3456',
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                                counterText: '',
                              ),
                              maxLength: 10,

                              keyboardType:
                                  TextInputType
                                      .text, // Or TextInputType.visiblePassword for mixed input
                              textCapitalization:
                                  TextCapitalization
                                      .characters, // To automatically capitalize letters
                              inputFormatters: [UpperCaseTextFormatter()],
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: editCarValue.kilometerController,
                              decoration: InputDecoration(
                                labelText: 'Kms Done',
                                hintText: 'e.g., 4567',
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                                counterText: '',
                              ),
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: editCarValue.priceController,
                              decoration: InputDecoration(
                                labelText: 'Price',
                                // hintText: 'e.g., 500000',
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                                counterText: '',
                              ),
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      // CTA Button
                      Center(
                        child: SizedBox(
                          width: isDesktop ? 300 : double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              editCarValue.editCar();
                            },
                            // icon: const Icon(Icons.steeing),
                            label: const Text("Update"),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              // backgroundColor: Colors.blueAccent,
                              textStyle: const TextStyle(fontSize: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
    );
  }

  // Car Image
  Widget _buildCarImage(
    BuildContext context,
    bool isDesktop,
    EditCarController editCarValue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              editCarValue.selectImg();
            },
            child: Text('Select Car Images'),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemCount: editCarValue.imgList.length,
          itemBuilder:
              (context, index) => Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: myColors.neutral,
                    ),
                    padding: EdgeInsets.all(3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),

                      child: Image.memory(editCarValue.imgList[index]),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton.filled(
                      color: myColors.primary,
                      onPressed: () {
                        editCarValue.removeImg(index);
                      },
                      icon: Icon(Icons.close, color: myColors.tertiary),
                    ),
                  ),
                ],
              ),
        ),
        const SizedBox(height: 3),
      ],
    );
  }

  DropdownButtonFormField dropDownWidget(
    List items,
    String lable, {
    required void Function(dynamic)? onChanged,
    required dynamic value,
  }) {
    return DropdownButtonFormField(
      value: value,
      items:
          items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(lable),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
      ),
    );
  }
}

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
