// import 'package:car_site/pages/car_details/car_details_controller.dart';
// import 'package:car_site/pages/edit_car/edit_car_controller.dart';
// import 'package:car_site/pages/edit_car/edit_car_page.dart';
// import 'package:car_site/utils/m_query.dart';
// import 'package:car_site/utils/my_colors.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CarDetailsPage extends StatefulWidget {
//   const CarDetailsPage({super.key});

//   @override
//   State<CarDetailsPage> createState() => _CarDetailsPageState();
// }

// class _CarDetailsPageState extends State<CarDetailsPage> {
//   late CarouselSliderController carouselController;

//   @override
//   void initState() {
//     super.initState();
//     carouselController = CarouselSliderController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CarDetailsController>(
//       builder: (cdValue) {
//         return Scaffold(
//           // appBar: AppBar(title: Text(widget.carName)),
//           appBar: AppBar(title: Text(cdValue.carDetail?.carName ?? '')),
//           body: SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 bool isDesktop = constraints.maxWidth > 600;

//                 return Center(
//                   child: SizedBox(
//                     width: isDesktop ? 500 : null,
//                     child: Column(
//                       // crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Image + Basic Info (side-by-side on desktop, stacked on mobile)
//                         // isDesktop
//                         //     ? Row(
//                         //       crossAxisAlignment: CrossAxisAlignment.start,
//                         //       children: [
//                         //         Expanded(flex: 2, child: _buildCarImage()),
//                         //         const SizedBox(width: 20),
//                         //         Expanded(flex: 2, child: _buildCarHeader()),
//                         //       ],
//                         //     )
//                         //     :
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildCarImage(context, isDesktop, cdValue),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: myColors.highlight.withOpacity(
//                                         0.2,
//                                       ),
//                                     ),
//                                     child: InkWell(
//                                       onTap: () async {
//                                         if (cdValue.carDetail != null) {
//                                           EditCarController editCarController =
//                                               Get.find();
//                                           await editCarController
//                                               .loadJsonData();
//                                           editCarController.setCarDetails(
//                                             cdValue.carDetail!,
//                                           );
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder:
//                                                   (context) => EditCarPage(),
//                                             ),
//                                           );
//                                         }
//                                       },
//                                       borderRadius: BorderRadius.circular(10),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 8.0,
//                                           vertical: 4,
//                                         ),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             const Icon(Icons.edit),
//                                             const SizedBox(width: 5),
//                                             const Text("Edit"),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Expanded(
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: myColors.secondary.withOpacity(
//                                         0.2,
//                                       ),
//                                     ),
//                                     child: InkWell(
//                                       onTap: () {
//                                         showDialog(
//                                           context: context,
//                                           builder:
//                                               (context) => AlertDialog(
//                                                 title: Text('Confirmation'),
//                                                 content: Text(
//                                                   'Are you sure want to delete?',
//                                                 ),
//                                                 actions: [
//                                                   TextButton(
//                                                     onPressed: () {
//                                                       Get.back();
//                                                     },
//                                                     child: Text('Cancel'),
//                                                   ),
//                                                   TextButton(
//                                                     onPressed: () {
//                                                       Get.back();
//                                                     },
//                                                     child: Text(
//                                                       'Delete',
//                                                       style: TextStyle(
//                                                         color:
//                                                             myColors.secondary,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                         );
//                                       },
//                                       borderRadius: BorderRadius.circular(10),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 8.0,
//                                           vertical: 4,
//                                         ),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Icon(
//                                               Icons.delete,
//                                               color: myColors.secondary,
//                                             ),
//                                             const SizedBox(width: 5),
//                                             Text(
//                                               "Delete",
//                                               style: TextStyle(
//                                                 color: myColors.secondary,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//                             _buildCarHeader(cdValue),
//                             const SizedBox(height: 30),

//                             // Overview
//                             const Text(
//                               "Car Overview",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),

//                         const Divider(thickness: 1, height: 20),

//                         // isDesktop
//                         //     ? Row(
//                         //       crossAxisAlignment: CrossAxisAlignment.start,
//                         //       children: [
//                         //         Expanded(
//                         //           child: Column(
//                         //             children: [
//                         //               _buildDetailCard("Kms Done", kmsDone),
//                         //               _buildDetailCard("Model Year", modelYear),
//                         //               _buildDetailCard("Color", color),
//                         //               _buildDetailCard("Owner", owner),
//                         //               _buildDetailCard("Last Updated", lastUpdated),
//                         //             ],
//                         //           ),
//                         //         ),
//                         //         Expanded(
//                         //           child: Column(
//                         //             children: [
//                         //               _buildDetailCard("Insurance", insurance),
//                         //               _buildDetailCard(
//                         //                 "Registration Type",
//                         //                 registrationType,
//                         //               ),
//                         //               _buildDetailCard(
//                         //                 "Registration Number",
//                         //                 registrationNumber,
//                         //               ),
//                         //               _buildDetailCard("Transmission", transmission),
//                         //               _buildDetailCard("Fuel Type", fuelType),
//                         //             ],
//                         //           ),
//                         //         ),
//                         //       ],
//                         //     )
//                         //     :
//                         SizedBox(
//                           width: isDesktop ? 500 : null,
//                           child: Wrap(
//                             children: [
//                               _buildDetailCard(
//                                 "Kms Done",
//                                 cdValue.carDetail?.kmsDone ?? '',
//                               ),
//                               _buildDetailCard(
//                                 "Model Year",
//                                 cdValue.carDetail?.modelYear ?? '',
//                               ),
//                               _buildDetailCard(
//                                 "Color",
//                                 cdValue.carDetail?.color ?? '',
//                               ),
//                               _buildDetailCard(
//                                 "Owner",
//                                 cdValue.carDetail?.owner ?? '',
//                               ),
//                               _buildDetailCard(
//                                 "Last Updated",
//                                 cdValue.carDetail?.lastUpdated ?? '',
//                               ),
//                               _buildDetailCard(
//                                 "Insurance",
//                                 cdValue.carDetail?.insurance ?? '',
//                               ),
//                               _buildDetailCard(
//                                 "Registration Type",
//                                 cdValue.carDetail?.registrationType ?? '',
//                               ),
//                               _buildDetailCard(
//                                 "Registration Number",
//                                 cdValue.carDetail?.registrationNumber ?? '',
//                               ),
//                               _buildDetailCard(
//                                 "Transmission",
//                                 cdValue.carDetail?.transmission ?? '',
//                               ),
//                               _buildDetailCard(
//                                 "Fuel Type",
//                                 cdValue.carDetail?.fuelType ?? '',
//                               ),
//                             ],
//                           ),
//                         ),

//                         const SizedBox(height: 30),

//                         // CTA Button
//                         Center(
//                           child: SizedBox(
//                             width: isDesktop ? 300 : double.infinity,
//                             child: ElevatedButton.icon(
//                               onPressed: () {
//                                 // TODO: handle enquiry / booking
//                               },
//                               icon: const Icon(Icons.phone),
//                               label: const Text("Contact Dealer"),
//                               style: ElevatedButton.styleFrom(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 16,
//                                 ),
//                                 // backgroundColor: Colors.blueAccent,
//                                 textStyle: const TextStyle(fontSize: 18),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // Car Image
//   Widget _buildCarImage(
//     BuildContext context,
//     bool isDesktop,
//     CarDetailsController cdValue,
//   ) {
//     return Container(
//       color: myColors.neutral,
//       padding: EdgeInsets.all(3),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(6),
//             // child: Image.network(
//             //   widget.carImage,
//             //   height: !isDesktop ? mQuery.mWidth(context, 0.6) : 350,
//             //   width: !isDesktop ? mQuery.mWidth(context, 8) : 500,
//             //   fit: BoxFit.cover,
//             // ),
//             child: Image.asset(
//               // 'assets/nissan-magnite.jpeg',
//               cdValue.carDetail?.carImage ?? '',
//               height: !isDesktop ? mQuery.mWidth(context, 0.6) : 350,
//               width: !isDesktop ? mQuery.mWidth(context, 8) : 500,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 3),
//           SizedBox(
//             width: !isDesktop ? mQuery.mWidth(context, 8) : 500,
//             child: CarouselSlider(
//               carouselController: carouselController,
//               items:
//                   cdValue.carDetail?.imgList.map((i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return InkWell(
//                           onTap: () {
//                             // carouselController.animateToPage();
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             width: MediaQuery.of(context).size.width,
//                             margin: EdgeInsets.symmetric(horizontal: 5.0),
//                             decoration: BoxDecoration(color: Colors.amber),
//                             // child: Text(
//                             //   'text $i',
//                             //   style: TextStyle(fontSize: 16.0),
//                             // ),
//                             child: Image.memory(i),
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//               options: CarouselOptions(
//                 height: 50,
//                 // aspectRatio: 16 / 9,
//                 // viewportFraction: 0.8,
//                 viewportFraction: 0.15,
//                 initialPage: 0,
//                 enableInfiniteScroll: false,
//                 reverse: false,
//                 // autoPlay: true,
//                 autoPlayInterval: Duration(seconds: 3),
//                 autoPlayAnimationDuration: Duration(milliseconds: 800),
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 // enlargeCenterPage: true,
//                 // enlargeFactor: 0.3,
//                 // onPageChanged: callbackFunction,
//                 animateToClosest: true,

//                 scrollDirection: Axis.horizontal,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Car Header (Name + Price)
//   Widget _buildCarHeader(CarDetailsController cdValue) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           cdValue.carDetail?.carName ?? '',
//           style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           "₹ ${cdValue.carDetail?.price}",
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w600,
//             color: Colors.green,
//           ),
//         ),
//       ],
//     );
//   }

//   // Overview Detail Card
//   Widget _buildDetailCard(String label, String value) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(width: 0.2, color: myColors.neutral)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 8.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Text(
//                 label,
//                 style: const TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//             ),
//             const SizedBox(height: 4),
//             Expanded(
//               child: Text(
//                 value,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//---------------- NEW CODE

import 'package:car_site/pages/car_details/car_details_controller.dart';
import 'package:car_site/pages/edit_car/edit_car_controller.dart';
import 'package:car_site/pages/edit_car/edit_car_page.dart';
import 'package:car_site/pages/models/car_details_model.dart';
import 'package:car_site/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({super.key});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarDetailsController>(
      builder: (cdValue) {
        final car = cdValue.carDetail;

        if (car == null) {
          return Scaffold(
            backgroundColor: myColors.background,
            appBar: AppBar(title: const Text('Car Details')),
            body: Center(
              child: Text(
                'Car details not available',
                style: TextStyle(color: myColors.secondaryText, fontSize: 16),
              ),
            ),
          );
        }

        return Scaffold(
          backgroundColor: myColors.background,
          appBar: AppBar(
            backgroundColor: myColors.card,
            elevation: 0,
            scrolledUnderElevation: 0,
            surfaceTintColor: Colors.transparent,
            iconTheme: IconThemeData(color: myColors.text),
            title: Text(
              '${car.manufacturer} ${car.carName}',
              style: TextStyle(
                color: myColors.text,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isDesktop = constraints.maxWidth >= 900;

                    return isDesktop
                        ? _buildDesktopLayout(context, cdValue)
                        : _buildMobileLayout(context, cdValue);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // DESKTOP
  // ============================================================

  Widget _buildDesktopLayout(
    BuildContext context,
    CarDetailsController cdValue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 6, child: _buildImageGallery(context, cdValue)),
            const SizedBox(width: 28),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCarHeader(cdValue),
                  const SizedBox(height: 20),
                  _buildActionButtons(context, cdValue),
                  const SizedBox(height: 24),
                  _buildContactCard(),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        _buildOverviewSection(cdValue),

        const SizedBox(height: 28),

        _buildBottomContactButton(),
      ],
    );
  }

  // ============================================================
  // MOBILE / TABLET
  // ============================================================

  Widget _buildMobileLayout(
    BuildContext context,
    CarDetailsController cdValue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageGallery(context, cdValue),

        const SizedBox(height: 22),

        _buildCarHeader(cdValue),

        const SizedBox(height: 20),

        _buildActionButtons(context, cdValue),

        const SizedBox(height: 28),

        _buildOverviewSection(cdValue),

        const SizedBox(height: 28),

        _buildContactCard(),

        const SizedBox(height: 24),

        _buildBottomContactButton(),
      ],
    );
  }

  // ============================================================
  // IMAGE GALLERY
  // ============================================================

  Widget _buildImageGallery(
    BuildContext context,
    CarDetailsController cdValue,
  ) {
    final car = cdValue.carDetail!;

    /*
      Main car image + uploaded images.

      Index 0 = main asset image
      Index 1+ = imgList images
    */

    final totalImages = 1 + car.imgList.length;

    if (selectedImageIndex >= totalImages) {
      selectedImageIndex = 0;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: myColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: myColors.border),
      ),
      child: Column(
        children: [
          // ========================================================
          // MAIN IMAGE
          // ========================================================
          GestureDetector(
            onTap: () {
              // _openFullScreenGallery(context, car, selectedImageIndex);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: double.infinity,
                height: 380,
                color: myColors.background,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _buildSelectedImage(car),

                    // View image indicator
                    // Positioned(
                    //   right: 14,
                    //   bottom: 14,
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //       horizontal: 10,
                    //       vertical: 7,
                    //     ),
                    //     decoration: BoxDecoration(
                    //       color: Colors.black.withOpacity(0.60),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     child: const Row(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Icon(
                    //           Icons.open_in_full_rounded,
                    //           color: Colors.white,
                    //           size: 15,
                    //         ),
                    //         SizedBox(width: 6),
                    //         Text(
                    //           'View',
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.w600,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),

          // ========================================================
          // THUMBNAILS
          // ========================================================
          if (totalImages > 1) ...[
            const SizedBox(height: 12),

            SizedBox(
              height: 72,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 3),
                itemCount: totalImages,
                separatorBuilder: (_, __) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (context, index) {
                  final isSelected = selectedImageIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImageIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: 88,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              isSelected ? myColors.highlight : myColors.border,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: _buildThumbnailImage(car, index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ============================================================
  // SELECTED IMAGE
  // ============================================================

  Widget _buildSelectedImage(dynamic car) {
    if (selectedImageIndex == 0) {
      return Image.asset(
        car.carImage,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return _imageErrorWidget();
        },
      );
    }

    final imageIndex = selectedImageIndex - 1;

    if (imageIndex >= 0 && imageIndex < car.imgList.length) {
      return Image.memory(
        car.imgList[imageIndex],
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return _imageErrorWidget();
        },
      );
    }

    return _imageErrorWidget();
  }

  // ============================================================
  // THUMBNAIL
  // ============================================================

  Widget _buildThumbnailImage(dynamic car, int index) {
    if (index == 0) {
      return Image.asset(
        car.carImage,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _thumbnailErrorWidget();
        },
      );
    }

    final imageIndex = index - 1;

    return Image.memory(
      car.imgList[imageIndex],
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return _thumbnailErrorWidget();
      },
    );
  }

  Widget _thumbnailErrorWidget() {
    return Container(
      color: myColors.background,
      child: Icon(Icons.broken_image_outlined, color: myColors.neutral),
    );
  }

  Widget _imageErrorWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.image_not_supported_outlined,
            size: 48,
            color: myColors.neutral,
          ),
          const SizedBox(height: 8),
          Text(
            'Image not available',
            style: TextStyle(color: myColors.secondaryText, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FULL SCREEN IMAGE VIEWER
  // ============================================================

  void _openFullScreenGallery(
    BuildContext context,
    CarDetailsModel car,
    int initialIndex,
  ) {
    int totalImages = 1 + car.imgList.length;

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.94),
      builder: (dialogContext) {
        int currentIndex = initialIndex;

        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.88,
                child: Stack(
                  children: [
                    // ==================================================
                    // IMAGE
                    // ==================================================
                    Center(
                      child: InteractiveViewer(
                        minScale: 1,
                        maxScale: 4,
                        child: _buildFullScreenImage(car, currentIndex),
                      ),
                    ),

                    // ==================================================
                    // CLOSE
                    // ==================================================
                    Positioned(
                      top: 4,
                      right: 4,
                      child: IconButton(
                        tooltip: 'Close',
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.12),
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.close_rounded),
                      ),
                    ),

                    // ==================================================
                    // IMAGE COUNTER
                    // ==================================================
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${currentIndex + 1} / $totalImages',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // ==================================================
                    // PREVIOUS
                    // ==================================================
                    if (totalImages > 1)
                      Positioned(
                        left: 8,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: _galleryArrowButton(
                            icon: Icons.chevron_left_rounded,
                            onTap: () {
                              setDialogState(() {
                                currentIndex =
                                    (currentIndex - 1 + totalImages) %
                                    totalImages;
                              });
                            },
                          ),
                        ),
                      ),

                    // ==================================================
                    // NEXT
                    // ==================================================
                    if (totalImages > 1)
                      Positioned(
                        right: 8,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: _galleryArrowButton(
                            icon: Icons.chevron_right_rounded,
                            onTap: () {
                              setDialogState(() {
                                currentIndex = (currentIndex + 1) % totalImages;
                              });
                            },
                          ),
                        ),
                      ),

                    // ==================================================
                    // BOTTOM THUMBNAILS
                    // ==================================================
                    if (totalImages > 1)
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 8,
                        child: SizedBox(
                          height: 62,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            itemCount: totalImages,
                            separatorBuilder: (_, __) {
                              return const SizedBox(width: 8);
                            },
                            itemBuilder: (context, index) {
                              final selected = currentIndex == index;

                              return GestureDetector(
                                onTap: () {
                                  setDialogState(() {
                                    currentIndex = index;
                                  });
                                },
                                child: Container(
                                  width: 76,
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color:
                                          selected
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.30),
                                      width: selected ? 2 : 1,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: _buildThumbnailImage(car, index),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ============================================================
  // FULL SCREEN IMAGE
  // ============================================================

  Widget _buildFullScreenImage(dynamic car, int index) {
    if (index == 0) {
      return Image.asset(
        car.carImage,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return _fullScreenImageError();
        },
      );
    }

    final imageIndex = index - 1;

    return Image.memory(
      car.imgList[imageIndex],
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return _fullScreenImageError();
      },
    );
  }

  Widget _fullScreenImageError() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.image_not_supported_outlined,
          color: Colors.white54,
          size: 50,
        ),
        const SizedBox(height: 10),
        Text(
          'Image not available',
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
      ],
    );
  }

  Widget _galleryArrowButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.black.withOpacity(0.45),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: 44,
          height: 44,
          child: Icon(Icons.chevron_right_rounded, color: Colors.white),
        ),
      ),
    );
  }

  // ============================================================
  // CAR HEADER
  // ============================================================

  Widget _buildCarHeader(CarDetailsController cdValue) {
    final car = cdValue.carDetail!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${car.manufacturer} ${car.carName}',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: myColors.text,
            letterSpacing: -0.4,
          ),
        ),

        const SizedBox(height: 7),

        Text(
          '${car.variant} • ${car.modelYear} • ${car.fuelType} • ${car.transmission}',
          style: TextStyle(fontSize: 14, color: myColors.secondaryText),
        ),

        const SizedBox(height: 16),

        Text(
          '₹ ${car.price}',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w800,
            color: myColors.secondary,
          ),
        ),

        const SizedBox(height: 5),

        Row(
          children: [
            Icon(Icons.speed_outlined, size: 16, color: myColors.secondaryText),
            const SizedBox(width: 6),
            Text(
              '${car.kmsDone} km driven',
              style: TextStyle(fontSize: 13, color: myColors.secondaryText),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // EDIT / DELETE
  // ============================================================

  Widget _buildActionButtons(
    BuildContext context,
    CarDetailsController cdValue,
  ) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              final car = cdValue.carDetail;

              if (car == null) return;

              final EditCarController editCarController = Get.find();

              await editCarController.loadJsonData();

              editCarController.setCarDetails(car);

              if (!context.mounted) return;

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditCarPage()),
              );
            },
            icon: Icon(
              Icons.edit_outlined,
              color: myColors.highlight,
              size: 18,
            ),
            label: Text(
              'Edit',
              style: TextStyle(
                color: myColors.highlight,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 13),
              side: BorderSide(color: myColors.highlight.withOpacity(0.35)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              _showDeleteConfirmation(context, cdValue);
            },
            icon: Icon(
              Icons.delete_outline,
              color: myColors.secondary,
              size: 18,
            ),
            label: Text(
              'Delete',
              style: TextStyle(
                color: myColors.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 13),
              side: BorderSide(color: myColors.secondary.withOpacity(0.35)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DELETE CONFIRMATION
  // ============================================================

  void _showDeleteConfirmation(
    BuildContext context,
    CarDetailsController cdValue,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: myColors.card,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Delete Car?',
            style: TextStyle(color: myColors.text, fontWeight: FontWeight.w700),
          ),
          content: Text(
            'Are you sure you want to delete this car listing?',
            style: TextStyle(color: myColors.secondaryText),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                // Existing delete logic can be added here.
              },
              child: Text(
                'Delete',
                style: TextStyle(
                  color: myColors.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // OVERVIEW
  // ============================================================

  Widget _buildOverviewSection(CarDetailsController cdValue) {
    final car = cdValue.carDetail!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: myColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: myColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Car Overview',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: myColors.text,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            'Key information about this vehicle',
            style: TextStyle(fontSize: 13, color: myColors.secondaryText),
          ),

          const SizedBox(height: 18),

          LayoutBuilder(
            builder: (context, constraints) {
              final twoColumns = constraints.maxWidth >= 650;

              return Wrap(
                spacing: 14,
                runSpacing: 12,
                children: [
                  _buildDetailCard(
                    'Model Year',
                    car.modelYear,
                    Icons.calendar_today_outlined,
                    twoColumns,
                  ),
                  _buildDetailCard(
                    'Kms Done',
                    car.kmsDone,
                    Icons.speed_outlined,
                    twoColumns,
                  ),
                  _buildDetailCard(
                    'Owner',
                    car.owner,
                    Icons.person_outline,
                    twoColumns,
                  ),
                  _buildDetailCard(
                    'Fuel Type',
                    car.fuelType,
                    Icons.local_gas_station_outlined,
                    twoColumns,
                  ),
                  _buildDetailCard(
                    'Transmission',
                    car.transmission,
                    Icons.settings_outlined,
                    twoColumns,
                  ),
                  _buildDetailCard(
                    'Color',
                    car.color,
                    Icons.palette_outlined,
                    twoColumns,
                  ),
                  _buildDetailCard(
                    'Insurance',
                    car.insurance,
                    Icons.verified_user_outlined,
                    twoColumns,
                  ),
                  _buildDetailCard(
                    'Registration Type',
                    car.registrationType,
                    Icons.badge_outlined,
                    twoColumns,
                  ),
                  _buildDetailCard(
                    'Registration Number',
                    car.registrationNumber,
                    Icons.confirmation_number_outlined,
                    twoColumns,
                  ),
                  _buildDetailCard(
                    'Last Updated',
                    car.lastUpdated,
                    Icons.update_outlined,
                    twoColumns,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DETAIL CARD
  // ============================================================

  Widget _buildDetailCard(
    String label,
    String value,
    IconData icon,
    bool twoColumns,
  ) {
    return SizedBox(
      width: twoColumns ? 330 : double.infinity,
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: myColors.background,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: myColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: myColors.highlightLight,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(icon, size: 18, color: myColors.highlight),
            ),

            const SizedBox(width: 11),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      color: myColors.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    value.isEmpty ? '-' : value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: myColors.text,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // CONTACT CARD
  // ============================================================

  Widget _buildContactCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: myColors.highlightLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: myColors.highlight.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: myColors.highlight,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const Icon(Icons.phone_outlined, color: Colors.white),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Interested in this car?',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: myColors.text,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Contact us for more information.',
                      style: TextStyle(
                        fontSize: 12,
                        color: myColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Call / WhatsApp / enquiry
              },
              icon: const Icon(Icons.phone_outlined, size: 18),
              label: const Text(
                'Contact Dealer',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: myColors.highlight,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM CTA
  // ============================================================

  Widget _buildBottomContactButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          // TODO: Contact dealer form
        },
        icon: const Icon(Icons.chat_bubble_outline, size: 19),
        label: const Text(
          'Send Enquiry',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: myColors.secondary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
      ),
    );
  }
}

// import 'package:car_site/pages/car_details/car_details_controller.dart';
// import 'package:car_site/pages/edit_car/edit_car_controller.dart';
// import 'package:car_site/pages/edit_car/edit_car_page.dart';
// import 'package:car_site/utils/my_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CarDetailsPage extends StatefulWidget {
//   const CarDetailsPage({super.key});

//   @override
//   State<CarDetailsPage> createState() => _CarDetailsPageState();
// }

// class _CarDetailsPageState extends State<CarDetailsPage> {
//   int selectedImageIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CarDetailsController>(
//       builder: (cdValue) {
//         final car = cdValue.carDetail;

//         if (car == null) {
//           return Scaffold(
//             backgroundColor: myColors.background,
//             appBar: AppBar(title: const Text('Car Details')),
//             body: Center(
//               child: Text(
//                 'Car details not available',
//                 style: TextStyle(color: myColors.secondaryText, fontSize: 16),
//               ),
//             ),
//           );
//         }

//         return Scaffold(
//           backgroundColor: myColors.background,

//           // ─────────────────────────────────────────────
//           // App Bar
//           // ─────────────────────────────────────────────
//           appBar: AppBar(
//             backgroundColor: myColors.card,
//             elevation: 0,
//             surfaceTintColor: Colors.transparent,
//             title: Text(
//               car.carName,
//               style: TextStyle(
//                 color: myColors.text,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             iconTheme: IconThemeData(color: myColors.text),
//           ),

//           body: SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 final bool isDesktop = constraints.maxWidth >= 900;

//                 return Center(
//                   child: ConstrainedBox(
//                     constraints: const BoxConstraints(maxWidth: 1100),
//                     child:
//                         isDesktop
//                             ? _buildDesktopLayout(context, cdValue)
//                             : _buildMobileLayout(context, cdValue),
//                   ),
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ═══════════════════════════════════════════════════
//   // DESKTOP LAYOUT
//   // ═══════════════════════════════════════════════════

//   Widget _buildDesktopLayout(
//     BuildContext context,
//     CarDetailsController cdValue,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(flex: 6, child: _buildImageGallery(context, cdValue)),
//             const SizedBox(width: 24),
//             Expanded(
//               flex: 4,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildCarHeader(cdValue),
//                   const SizedBox(height: 20),
//                   _buildActionButtons(context, cdValue),
//                   const SizedBox(height: 24),
//                   _buildContactCard(),
//                 ],
//               ),
//             ),
//           ],
//         ),

//         const SizedBox(height: 32),

//         _buildOverviewSection(cdValue),

//         const SizedBox(height: 32),

//         _buildBottomContactButton(),
//       ],
//     );
//   }

//   // ═══════════════════════════════════════════════════
//   // MOBILE / TABLET LAYOUT
//   // ═══════════════════════════════════════════════════

//   Widget _buildMobileLayout(
//     BuildContext context,
//     CarDetailsController cdValue,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildImageGallery(context, cdValue),

//         const SizedBox(height: 20),

//         _buildCarHeader(cdValue),

//         const SizedBox(height: 20),

//         _buildActionButtons(context, cdValue),

//         const SizedBox(height: 28),

//         _buildOverviewSection(cdValue),

//         const SizedBox(height: 28),

//         _buildContactCard(),

//         const SizedBox(height: 24),

//         _buildBottomContactButton(),
//       ],
//     );
//   }

//   // ═══════════════════════════════════════════════════
//   // IMAGE GALLERY
//   // ═══════════════════════════════════════════════════

//   Widget _buildImageGallery(
//     BuildContext context,
//     CarDetailsController cdValue,
//   ) {
//     final car = cdValue.carDetail!;

//     final bool hasGalleryImages = car.imgList.isNotEmpty;

//     final String mainImagePath = car.carImage;

//     return Container(
//       decoration: BoxDecoration(
//         color: myColors.card,
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(color: myColors.border),
//       ),
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         children: [
//           // ─────────────────────────────────────
//           // Main Image
//           // ─────────────────────────────────────
//           ClipRRect(
//             borderRadius: BorderRadius.circular(14),
//             child: Container(
//               width: double.infinity,
//               height: 380,
//               color: myColors.background,
//               child: _buildMainImage(mainImagePath, car.imgList),
//             ),
//           ),

//           if (hasGalleryImages) ...[
//             const SizedBox(height: 12),

//             // ─────────────────────────────────────
//             // Thumbnail List
//             // ─────────────────────────────────────
//             SizedBox(
//               height: 72,
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 4),
//                 itemCount: car.imgList.length,
//                 separatorBuilder: (_, __) {
//                   return const SizedBox(width: 10);
//                 },
//                 itemBuilder: (context, index) {
//                   final bool isSelected = selectedImageIndex == index;

//                   return InkWell(
//                     borderRadius: BorderRadius.circular(10),
//                     onTap: () {
//                       setState(() {
//                         selectedImageIndex = index;
//                       });
//                     },
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 200),
//                       width: 88,
//                       padding: const EdgeInsets.all(3),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           color:
//                               isSelected ? myColors.highlight : myColors.border,
//                           width: isSelected ? 2 : 1,
//                         ),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(7),
//                         child: Image.memory(
//                           car.imgList[index],
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Container(
//                               color: myColors.background,
//                               child: Icon(
//                                 Icons.broken_image_outlined,
//                                 color: myColors.neutral,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   // ═══════════════════════════════════════════════════
//   // MAIN IMAGE
//   // ═══════════════════════════════════════════════════

//   Widget _buildMainImage(String assetPath, List<dynamic> imageList) {
//     // If thumbnail selected, show uploaded image.
//     if (selectedImageIndex >= 0 && selectedImageIndex < imageList.length) {
//       return Image.memory(
//         imageList[selectedImageIndex],
//         width: double.infinity,
//         height: double.infinity,
//         fit: BoxFit.contain,
//         errorBuilder: (context, error, stackTrace) {
//           return _imageErrorWidget();
//         },
//       );
//     }

//     // Otherwise show main asset image.
//     return Image.asset(
//       assetPath,
//       width: double.infinity,
//       height: double.infinity,
//       fit: BoxFit.contain,
//       errorBuilder: (context, error, stackTrace) {
//         return _imageErrorWidget();
//       },
//     );
//   }

//   Widget _imageErrorWidget() {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             Icons.image_not_supported_outlined,
//             size: 48,
//             color: myColors.neutral,
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Image not available',
//             style: TextStyle(color: myColors.secondaryText, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }

//   // ═══════════════════════════════════════════════════
//   // CAR HEADER
//   // ═══════════════════════════════════════════════════

//   Widget _buildCarHeader(CarDetailsController cdValue) {
//     final car = cdValue.carDetail!;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '${car.manufacturer} ${car.carName}',
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.w700,
//             color: myColors.text,
//           ),
//         ),

//         const SizedBox(height: 6),

//         Text(
//           '${car.modelYear} • ${car.fuelType} • ${car.transmission}',
//           style: TextStyle(fontSize: 14, color: myColors.secondaryText),
//         ),

//         const SizedBox(height: 16),

//         Text(
//           '₹ ${car.price}',
//           style: TextStyle(
//             fontSize: 26,
//             fontWeight: FontWeight.w700,
//             color: myColors.secondary,
//           ),
//         ),

//         const SizedBox(height: 6),

//         Text(
//           '${car.kmsDone} km driven',
//           style: TextStyle(fontSize: 14, color: myColors.secondaryText),
//         ),
//       ],
//     );
//   }

//   // ═══════════════════════════════════════════════════
//   // EDIT / DELETE BUTTONS
//   // ═══════════════════════════════════════════════════

//   Widget _buildActionButtons(
//     BuildContext context,
//     CarDetailsController cdValue,
//   ) {
//     return Row(
//       children: [
//         Expanded(
//           child: OutlinedButton.icon(
//             onPressed: () async {
//               final car = cdValue.carDetail;

//               if (car == null) return;

//               final EditCarController editCarController = Get.find();

//               await editCarController.loadJsonData();

//               editCarController.setCarDetails(car);

//               if (!context.mounted) return;

//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const EditCarPage()),
//               );
//             },
//             icon: Icon(Icons.edit_outlined, color: myColors.highlight),
//             label: Text('Edit', style: TextStyle(color: myColors.highlight)),
//             style: OutlinedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               side: BorderSide(color: myColors.highlight.withOpacity(0.4)),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//         ),

//         const SizedBox(width: 12),

//         Expanded(
//           child: OutlinedButton.icon(
//             onPressed: () {
//               _showDeleteConfirmation(context, cdValue);
//             },
//             icon: Icon(Icons.delete_outline, color: myColors.secondary),
//             label: Text('Delete', style: TextStyle(color: myColors.secondary)),
//             style: OutlinedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               side: BorderSide(color: myColors.secondary.withOpacity(0.4)),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // ═══════════════════════════════════════════════════
//   // DELETE CONFIRMATION
//   // ═══════════════════════════════════════════════════

//   void _showDeleteConfirmation(
//     BuildContext context,
//     CarDetailsController cdValue,
//   ) {
//     showDialog(
//       context: context,
//       builder: (dialogContext) {
//         return AlertDialog(
//           backgroundColor: myColors.card,
//           title: const Text('Delete Car?'),
//           content: Text(
//             'Are you sure you want to delete this car listing?',
//             style: TextStyle(color: myColors.secondaryText),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(dialogContext);
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(dialogContext);

//                 // Keep your existing delete logic here.
//                 //
//                 // Example:
//                 // cdValue.deleteCar();
//               },
//               child: Text(
//                 'Delete',
//                 style: TextStyle(
//                   color: myColors.secondary,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // ═══════════════════════════════════════════════════
//   // OVERVIEW SECTION
//   // ═══════════════════════════════════════════════════

//   Widget _buildOverviewSection(CarDetailsController cdValue) {
//     final car = cdValue.carDetail!;

//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: myColors.card,
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(color: myColors.border),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Car Overview',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w700,
//               color: myColors.text,
//             ),
//           ),

//           const SizedBox(height: 18),

//           LayoutBuilder(
//             builder: (context, constraints) {
//               final bool twoColumns = constraints.maxWidth >= 600;

//               return Wrap(
//                 spacing: 16,
//                 runSpacing: 12,
//                 children: [
//                   _buildDetailCard(
//                     'Model Year',
//                     car.modelYear,
//                     Icons.calendar_today_outlined,
//                     twoColumns,
//                   ),
//                   _buildDetailCard(
//                     'Kms Done',
//                     car.kmsDone,
//                     Icons.speed_outlined,
//                     twoColumns,
//                   ),
//                   _buildDetailCard(
//                     'Owner',
//                     car.owner,
//                     Icons.person_outline,
//                     twoColumns,
//                   ),
//                   _buildDetailCard(
//                     'Fuel Type',
//                     car.fuelType,
//                     Icons.local_gas_station_outlined,
//                     twoColumns,
//                   ),
//                   _buildDetailCard(
//                     'Transmission',
//                     car.transmission,
//                     Icons.settings_outlined,
//                     twoColumns,
//                   ),
//                   _buildDetailCard(
//                     'Color',
//                     car.color,
//                     Icons.palette_outlined,
//                     twoColumns,
//                   ),
//                   _buildDetailCard(
//                     'Insurance',
//                     car.insurance,
//                     Icons.verified_user_outlined,
//                     twoColumns,
//                   ),
//                   _buildDetailCard(
//                     'Registration Type',
//                     car.registrationType,
//                     Icons.badge_outlined,
//                     twoColumns,
//                   ),
//                   _buildDetailCard(
//                     'Registration Number',
//                     car.registrationNumber,
//                     Icons.confirmation_number_outlined,
//                     twoColumns,
//                   ),
//                   _buildDetailCard(
//                     'Last Updated',
//                     car.lastUpdated,
//                     Icons.update_outlined,
//                     twoColumns,
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   // ═══════════════════════════════════════════════════
//   // DETAIL ITEM
//   // ═══════════════════════════════════════════════════

//   Widget _buildDetailCard(
//     String label,
//     String value,
//     IconData icon,
//     bool twoColumns,
//   ) {
//     return SizedBox(
//       width: twoColumns ? 330 : double.infinity,
//       child: Container(
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: myColors.background,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: myColors.border),
//         ),
//         child: Row(
//           children: [
//             Container(
//               width: 38,
//               height: 38,
//               decoration: BoxDecoration(
//                 color: myColors.highlightLight,
//                 borderRadius: BorderRadius.circular(9),
//               ),
//               child: Icon(icon, size: 19, color: myColors.highlight),
//             ),

//             const SizedBox(width: 12),

//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     label,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: myColors.secondaryText,
//                     ),
//                   ),
//                   const SizedBox(height: 3),
//                   Text(
//                     value.isEmpty ? '-' : value,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: myColors.text,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ═══════════════════════════════════════════════════
//   // CONTACT CARD
//   // ═══════════════════════════════════════════════════

//   Widget _buildContactCard() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: myColors.highlightLight,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: myColors.highlight.withOpacity(0.15)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 42,
//                 height: 42,
//                 decoration: BoxDecoration(
//                   color: myColors.highlight,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(Icons.phone_outlined, color: Colors.white),
//               ),

//               const SizedBox(width: 12),

//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Interested in this car?',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         color: myColors.text,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       'Contact the dealer for more information.',
//                       style: TextStyle(
//                         fontSize: 13,
//                         color: myColors.secondaryText,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 16),

//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton.icon(
//               onPressed: () {
//                 // TODO:
//                 // Open contact form / WhatsApp / phone
//               },
//               icon: const Icon(Icons.phone, size: 18),
//               label: const Text('Contact Dealer'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: myColors.highlight,
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//                 elevation: 0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(11),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ═══════════════════════════════════════════════════
//   // BOTTOM CTA
//   // ═══════════════════════════════════════════════════

//   Widget _buildBottomContactButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton.icon(
//         onPressed: () {
//           // TODO:
//           // Contact dealer form
//         },
//         icon: const Icon(Icons.chat_bubble_outline),
//         label: const Text(
//           'Send Enquiry',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: myColors.secondary,
//           foregroundColor: Colors.white,
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),
//     );
//   }
// }
