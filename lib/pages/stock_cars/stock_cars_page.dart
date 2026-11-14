// import 'package:car_site/pages/car_details/car_details_controller.dart';
// import 'package:car_site/pages/car_details/car_details_page.dart';
// import 'package:car_site/pages/stock_cars/stock_cars_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class StockCarsPage extends StatefulWidget {
//   const StockCarsPage({super.key});

//   @override
//   State<StockCarsPage> createState() => _StockCarsPageState();
// }

// class _StockCarsPageState extends State<StockCarsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<StockCarsController>(
//       builder:
//           (stockCarsValue) => Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               GridView.builder(
//                 padding: EdgeInsets.all(16),
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 300, // max card width
//                   mainAxisSpacing: 16,
//                   crossAxisSpacing: 16,
//                   // childAspectRatio: 0.75, // height relative to width
//                 ),
//                 // itemCount: 8,
//                 itemCount: stockCarsValue.stockCarList.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () async {
//                       CarDetailsController carDetailsController = Get.find();
//                       carDetailsController.setCarDetails(
//                         stockCarsValue.stockCarList[index],
//                       );
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CarDetailsPage(),
//                         ),
//                       );
//                     },
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       padding: EdgeInsets.all(8),

//                       decoration: BoxDecoration(
//                         // color: Colors.teal.shade100,
//                         border: Border.all(color: Colors.blueGrey.shade100),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                               ),
//                               child: Image.asset(
//                                 height: 150,
//                                 width: double.infinity,
//                                 stockCarsValue.stockCarList[index].carImage,
//                                 fit: BoxFit.cover,
//                                 errorBuilder:
//                                     (context, error, stackTrace) => Container(
//                                       color: Colors.grey.shade200,
//                                       child: Icon(Icons.image_not_supported),
//                                     ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               width: double.infinity,
//                               padding: EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 color: Colors.black54,
//                                 // color: Colors.white24,
//                                 borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(10),
//                                   bottomRight: Radius.circular(10),
//                                 ),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     // 'Nissan - Magnite (2022)',
//                                     '${stockCarsValue.stockCarList[index].manufacturer} - ${stockCarsValue.stockCarList[index].carName} (${stockCarsValue.stockCarList[index].modelYear})',
//                                     // stockCarList[index].carName,
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       // color: Colors.black,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   Text(
//                                     // 'Nissan - Magnite',
//                                     '${stockCarsValue.stockCarList[index].fuelType} - ${stockCarsValue.stockCarList[index].price}',
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       // color: Colors.black,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Load More'),
//                 ),
//               ),
//               const SizedBox(height: 8),
//             ],
//           ),
//     );
//   }
// }

//---------------- NEW CODE
import 'package:car_site/pages/car_details/car_details_controller.dart';
import 'package:car_site/pages/car_details/car_details_page.dart';
import 'package:car_site/pages/models/car_details_model.dart';
import 'package:car_site/pages/stock_cars/stock_cars_controller.dart';
import 'package:car_site/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockCarsPage extends StatefulWidget {
  const StockCarsPage({super.key});

  @override
  State<StockCarsPage> createState() => _StockCarsPageState();
}

class _StockCarsPageState extends State<StockCarsPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StockCarsController>(
      builder: (stockCarsValue) {
        final screenWidth = MediaQuery.of(context).size.width;

        final bool isMobile = screenWidth < 600;
        final bool isTablet = screenWidth >= 600 && screenWidth < 1000;

        return Container(
          width: double.infinity,
          color: myColors.background,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 18 : 32,
            vertical: isMobile ? 35 : 50,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ======================================================
                  // HEADER
                  // ======================================================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Our Cars',
                              style: TextStyle(
                                color: myColors.text,
                                fontSize: isMobile ? 25 : 31,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
                              ),
                            ),

                            const SizedBox(height: 7),

                            Text(
                              'Explore our collection of quality used cars.',
                              style: TextStyle(
                                color: myColors.secondaryText,
                                fontSize: isMobile ? 13 : 14,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Cars Count
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: myColors.highlightLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${stockCarsValue.stockCarList.length} Cars',
                          style: TextStyle(
                            color: myColors.highlight,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // ======================================================
                  // CARS GRID
                  // ======================================================
                  if (stockCarsValue.stockCarList.isEmpty)
                    _emptyState()
                  else
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final availableWidth = constraints.maxWidth;

                        int columns;

                        if (availableWidth < 600) {
                          columns = 1;
                        } else if (availableWidth < 900) {
                          columns = 2;
                        } else if (availableWidth < 1150) {
                          columns = 3;
                        } else {
                          columns = 4;
                        }

                        const double spacing = 18;

                        final cardWidth =
                            (availableWidth - ((columns - 1) * spacing)) /
                            columns;

                        return Wrap(
                          spacing: spacing,
                          runSpacing: spacing,
                          children:
                              stockCarsValue.stockCarList.map((car) {
                                return SizedBox(
                                  width: cardWidth,
                                  child: _StockCarCard(
                                    car: car,
                                    onTap: () {
                                      _gotoCarDetails(context, car);
                                    },
                                  ),
                                );
                              }).toList(),
                        );
                      },
                    ),

                  const SizedBox(height: 30),

                  // ======================================================
                  // LOAD MORE
                  // ======================================================
                  Center(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: myColors.primary,
                        side: BorderSide(color: myColors.border),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Load More',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(width: 7),

                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 19,
                            color: myColors.highlight,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // CAR DETAILS NAVIGATION
  // ============================================================

  void _gotoCarDetails(BuildContext context, CarDetailsModel car) {
    CarDetailsController carDetailsController = Get.find();

    carDetailsController.setCarDetails(car);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CarDetailsPage()),
    );
  }

  // ============================================================
  // EMPTY STATE
  // ============================================================

  Widget _emptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Column(
        children: [
          Icon(
            Icons.directions_car_outlined,
            size: 52,
            color: myColors.neutral,
          ),

          const SizedBox(height: 15),

          Text(
            'No cars available',
            style: TextStyle(
              color: myColors.text,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            'Please check back later for available cars.',
            style: TextStyle(color: myColors.secondaryText, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// STOCK CAR CARD
// ═══════════════════════════════════════════════════════════════

class _StockCarCard extends StatefulWidget {
  final dynamic car;
  final VoidCallback onTap;

  const _StockCarCard({required this.car, required this.onTap});

  @override
  State<_StockCarCard> createState() => _StockCarCardState();
}

class _StockCarCardState extends State<_StockCarCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final car = widget.car;

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },

      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,

        transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),

        decoration: BoxDecoration(
          color: myColors.card,
          borderRadius: BorderRadius.circular(16),

          border: Border.all(
            color:
                _isHovered
                    ? myColors.highlight.withOpacity(0.35)
                    : myColors.border,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.09 : 0.035),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 9 : 4),
            ),
          ],
        ),

        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(16),
          hoverColor: Colors.transparent,
          splashColor: myColors.highlight.withOpacity(0.05),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==================================================
              // IMAGE
              // ==================================================
              AspectRatio(
                aspectRatio: 1.55,

                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),

                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        car.carImage,
                        fit: BoxFit.cover,

                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: myColors.highlightLight,
                            child: Icon(
                              Icons.directions_car_rounded,
                              size: 52,
                              color: myColors.highlight,
                            ),
                          );
                        },
                      ),

                      // Year Badge
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            car.modelYear,
                            style: TextStyle(
                              color: myColors.text,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ==================================================
              // BASIC CAR INFORMATION
              // ==================================================
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 14, 15, 15),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Car Name
                    Text(
                      '${car.manufacturer} ${car.carName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: myColors.text,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 5),
                    // Price
                    Text(
                      '₹ ${car.price}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: myColors.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 13),

                    // Basic Specifications
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: myColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: _specItem(
                              Icons.local_gas_station_outlined,
                              car.fuelType,
                            ),
                          ),
                          Container(
                            height: 18,
                            width: 1,
                            color: myColors.border,
                          ),
                          Expanded(
                            child: _specItem(
                              Icons.speed_outlined,
                              '${car.kmsDone} km',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // View Details Button
                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: widget.onTap,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: myColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'View Details',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(width: 6),

                            const Icon(Icons.arrow_forward_rounded, size: 17),
                          ],
                        ),
                      ),
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

  Widget _specItem(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 14, color: myColors.secondaryText),

        const SizedBox(width: 4),

        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: myColors.secondaryText,
              fontSize: 10.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
