// import 'package:car_site/pages/car_details/car_details_controller.dart';
// import 'package:car_site/pages/car_details/car_details_page.dart';
// import 'package:car_site/pages/models/car_details_model.dart';
// import 'package:car_site/utils/m_query.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<String> carSliderList = [
//     'assets/hyundai-creta.jpeg',
//     'assets/nissan-magnite.jpeg',
//     'assets/tata-tiago.jpeg',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     bool screenWidthIsGreater = mQuery.compareWidth(context, 576);
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const SizedBox(height: 15),
//         _carImage(context),
//         const SizedBox(height: 15),
//         Divider(height: 1, color: Colors.blueGrey.shade100),
//         const SizedBox(height: 15),
//         Text(
//           'Available Cars',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 15),
//         !screenWidthIsGreater
//             ? ListView.builder(
//               padding: const EdgeInsets.all(16),
//               shrinkWrap: true, // important: makes grid take only needed space
//               physics:
//                   const NeverScrollableScrollPhysics(), // disable inner scroll
//               itemCount: stockCarList.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: InkWell(
//                     onTap: () async {
//                       gotoCarDetails(stockCarList[index]);
//                     },
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       padding: EdgeInsets.all(8),

//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.blueGrey.shade100),
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.black54,
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: ClipRRect(
//                               child: Image.asset(
//                                 height: 150,
//                                 width: double.infinity,
//                                 stockCarList[index].carImage,
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
//                               padding: EdgeInsets.all(4),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${stockCarList[index].manufacturer} - ${stockCarList[index].carName} (${stockCarList[index].modelYear})',
//                                     maxLines: 2,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   Text(
//                                     '${stockCarList[index].fuelType} - ${stockCarList[index].price}',
//                                     maxLines: 2,
//                                     style: TextStyle(
//                                       color: Colors.white,
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
//                   ),
//                 );
//               },
//             )
//             :
//             // ✅ GridView inside Column
//             SizedBox(
//               width: mQuery.mWidth(context, 0.6),

//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 250, // max card width
//                   mainAxisSpacing: 16,
//                   crossAxisSpacing: 16,
//                 ),
//                 itemCount: stockCarList.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () async {
//                       gotoCarDetails(stockCarList[index]);
//                     },
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       padding: EdgeInsets.all(8),

//                       decoration: BoxDecoration(
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
//                                 stockCarList[index].carImage,
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
//                                 borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(10),
//                                   bottomRight: Radius.circular(10),
//                                 ),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${stockCarList[index].manufacturer} - ${stockCarList[index].carName} (${stockCarList[index].modelYear})',
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   Text(
//                                     '${stockCarList[index].fuelType} - ${stockCarList[index].price}',
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.white,
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
//             ),
//         const SizedBox(height: 15),
//       ],
//     );
//   }

//   gotoCarDetails(CarDetailsModel carDetails) {
//     CarDetailsController carDetailsController = Get.find();
//     carDetailsController.setCarDetails(carDetails);
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => CarDetailsPage()),
//     );
//   }

//   final List<String> imageUrls = [
//     'https://images.unsplash.com/photo-1549923746-c502d488b3ea',
//     'https://images.unsplash.com/photo-1503376780353-7e6692767b70',
//     'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023',
//     'https://images.unsplash.com/photo-1511919884226-fd3cad34687c',
//   ];
//   Widget _carImage(BuildContext context) {
//     // Responsive width detection
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double sliderHeight =
//         screenWidth < 600 ? 200 : 400; // Adjust height for devices
//     return Center(
//       child: AnimatedContainer(
//         duration: const Duration(seconds: 1),
//         width: screenWidth * 0.9, // responsive width
//         child: CarouselSlider.builder(
//           itemCount: imageUrls.length,
//           itemBuilder: (context, index, realIndex) {
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 image: DecorationImage(
//                   image: NetworkImage(imageUrls[index]),
//                   fit: BoxFit.cover,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 8,
//                     offset: Offset(0, 4),
//                   ),
//                 ],
//               ),
//             );
//           },
//           options: CarouselOptions(
//             height: sliderHeight,
//             autoPlay: true,
//             enlargeCenterPage: true,
//             viewportFraction:
//                 screenWidth < 600 ? 0.9 : 0.6, // responsive layout
//             autoPlayInterval: const Duration(seconds: 3),
//             autoPlayAnimationDuration: const Duration(milliseconds: 800),
//             aspectRatio: 16 / 9,
//           ),
//         ),
//       ),
//     );
//   }
// }

//------------------ NEW CODE
import 'package:car_site/pages/car_details/car_details_controller.dart';
import 'package:car_site/pages/car_details/car_details_page.dart';
import 'package:car_site/pages/main/main_controller.dart';
import 'package:car_site/pages/models/car_details_model.dart';
import 'package:car_site/utils/my_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1549923746-c502d488b3ea',
    'https://images.unsplash.com/photo-1503376780353-7e6692767b70',
    'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023',
    'https://images.unsplash.com/photo-1511919884226-fd3cad34687c',
  ];

  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';

  static const int _homeCarLimit = 6;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1000;

    final query = _searchQuery.toLowerCase().trim();

    final filteredCars =
        stockCarList.where((car) {
          if (query.isEmpty) {
            return true;
          }

          return car.manufacturer.toLowerCase().contains(query) ||
              car.carName.toLowerCase().contains(query) ||
              car.variant.toLowerCase().contains(query) ||
              car.modelYear.toLowerCase().contains(query) ||
              car.fuelType.toLowerCase().contains(query);
        }).toList();

    // Home page પર maximum 6 cars.
    final displayedCars =
        filteredCars.length > _homeCarLimit
            ? filteredCars.take(_homeCarLimit).toList()
            : filteredCars;

    return Container(
      width: double.infinity,
      color: myColors.background,
      child: Column(
        children: [
          _heroSection(context, isMobile: isMobile),

          _availableCarsSection(
            context,
            cars: displayedCars,
            totalCars: filteredCars.length,
            isMobile: isMobile,
            isTablet: isTablet,
          ),

          _sellCarSection(context, isMobile: isMobile),
        ],
      ),
    );
  }

  // ============================================================
  // HERO SECTION
  // ============================================================

  Widget _heroSection(BuildContext context, {required bool isMobile}) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: myColors.primary,
      padding: EdgeInsets.fromLTRB(
        isMobile ? 18 : 35,
        isMobile ? 40 : 55,
        isMobile ? 18 : 35,
        isMobile ? 35 : 55,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            children: [
              Text(
                'Find Your Perfect Car',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 30 : 46,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                  letterSpacing: -0.8,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Quality used cars from trusted dealers.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.70),
                  fontSize: isMobile ? 14 : 16,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 26),

              _heroSearchBar(context, isMobile: isMobile),

              const SizedBox(height: 38),

              // Hero Image Slider
              CarouselSlider.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: isMobile ? 3 : 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(isMobile ? 14 : 20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.22),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(isMobile ? 14 : 20),
                      child: Image.network(
                        imageUrls[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: myColors.highlightLight,
                            child: Icon(
                              Icons.directions_car_rounded,
                              size: isMobile ? 45 : 65,
                              color: myColors.highlight,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height:
                      isMobile
                          ? 185
                          : width < 1000
                          ? 270
                          : 350,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction:
                      isMobile
                          ? 0.94
                          : width < 1000
                          ? 0.78
                          : 0.70,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 700),
                  enableInfiniteScroll: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SEARCH BAR
  // ============================================================

  Widget _heroSearchBar(BuildContext context, {required bool isMobile}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 720),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 11),

          Icon(Icons.search_rounded, size: 21, color: myColors.secondaryText),

          const SizedBox(width: 8),

          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText:
                    isMobile
                        ? 'Search cars...'
                        : 'Search by brand, model or year...',
                hintStyle: TextStyle(color: myColors.neutral, fontSize: 14),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),

          if (_searchQuery.isNotEmpty)
            IconButton(
              tooltip: 'Clear',
              onPressed: () {
                _searchController.clear();

                setState(() {
                  _searchQuery = '';
                });
              },
              icon: Icon(
                Icons.close_rounded,
                size: 19,
                color: myColors.secondaryText,
              ),
            ),

          if (!isMobile)
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: myColors.secondary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: const Text(
                'Search',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
        ],
      ),
    );
  }

  // ============================================================
  // AVAILABLE CARS
  // ============================================================

  Widget _availableCarsSection(
    BuildContext context, {
    required List<CarDetailsModel> cars,
    required int totalCars,
    required bool isMobile,
    required bool isTablet,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : 35,
        vertical: isMobile ? 42 : 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ------------------------------------------------
              // Section Header
              // ------------------------------------------------
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available Cars',
                          style: TextStyle(
                            color: myColors.text,
                            fontSize: isMobile ? 24 : 30,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.4,
                          ),
                        ),

                        const SizedBox(height: 7),

                        Text(
                          'Explore our collection of quality used cars.',
                          style: TextStyle(
                            color: myColors.secondaryText,
                            fontSize: isMobile ? 13 : 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

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
                      '$totalCars Cars',
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

              // ------------------------------------------------
              // Cars
              // ------------------------------------------------
              if (cars.isEmpty)
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

                    const spacing = 18.0;

                    final cardWidth =
                        (availableWidth - ((columns - 1) * spacing)) / columns;

                    return Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children:
                          cars.map((car) {
                            return SizedBox(
                              width: cardWidth,
                              child: _CarCard(
                                car: car,
                                onTap: () {
                                  gotoCarDetails(car);
                                },
                              ),
                            );
                          }).toList(),
                    );
                  },
                ),

              // ------------------------------------------------
              // View All Cars
              // ------------------------------------------------
              if (totalCars > _homeCarLimit) ...[
                const SizedBox(height: 30),

                Center(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      final mainController = Get.find<MainController>();

                      mainController.changeTabAndScrollTop(1);
                    },
                    icon: const Icon(Icons.directions_car_outlined, size: 19),
                    label: const Text(
                      'View All Cars',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: myColors.primary,
                      side: BorderSide(color: myColors.border),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // EMPTY STATE
  // ============================================================

  Widget _emptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 55),
      child: Column(
        children: [
          Icon(Icons.search_off_rounded, size: 48, color: myColors.neutral),

          const SizedBox(height: 14),

          Text(
            'No cars found',
            style: TextStyle(
              color: myColors.text,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            'Try searching with another brand or model.',
            style: TextStyle(color: myColors.secondaryText, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SELL YOUR CAR
  // ============================================================

  Widget _sellCarSection(BuildContext context, {required bool isMobile}) {
    return Container(
      width: double.infinity,
      color: myColors.primary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 35,
        vertical: isMobile ? 38 : 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child:
              isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sellCarContent(),

                      const SizedBox(height: 24),

                      _sellCarButton(),
                    ],
                  )
                  : Row(
                    children: [
                      Expanded(child: _sellCarContent()),

                      const SizedBox(width: 40),

                      _sellCarButton(),
                    ],
                  ),
        ),
      ),
    );
  }

  Widget _sellCarContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Want to Sell Your Car?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Share your car details and connect with interested buyers or dealers.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.68),
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _sellCarButton() {
    return ElevatedButton.icon(
      onPressed: () {
        final mainController = Get.find<MainController>();

        mainController.changeTabAndScrollTop(2);
      },
      icon: const Icon(Icons.sell_outlined, size: 19),
      label: const Text(
        'Sell Your Car',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: myColors.secondary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // ============================================================
  // CAR DETAILS NAVIGATION
  // ============================================================

  void gotoCarDetails(CarDetailsModel carDetails) {
    final carDetailsController = Get.find<CarDetailsController>();

    carDetailsController.setCarDetails(carDetails);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CarDetailsPage()),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// CAR CARD
// ═══════════════════════════════════════════════════════════════

class _CarCard extends StatefulWidget {
  final CarDetailsModel car;
  final VoidCallback onTap;

  const _CarCard({required this.car, required this.onTap});

  @override
  State<_CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<_CarCard> {
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

// import 'package:car_site/pages/car_details/car_details_controller.dart';
// import 'package:car_site/pages/car_details/car_details_page.dart';
// import 'package:car_site/pages/main/main_controller.dart';
// import 'package:car_site/pages/models/car_details_model.dart';
// import 'package:car_site/utils/my_colors.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<String> carSliderList = [
//     'assets/hyundai-creta.jpeg',
//     'assets/nissan-magnite.jpeg',
//     'assets/tata-tiago.jpeg',
//   ];

//   final List<String> imageUrls = [
//     'https://images.unsplash.com/photo-1549923746-c502d488b3ea',
//     'https://images.unsplash.com/photo-1503376780353-7e6692767b70',
//     'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023',
//     'https://images.unsplash.com/photo-1511919884226-fd3cad34687c',
//   ];

//   final TextEditingController _searchController = TextEditingController();

//   String _searchQuery = '';

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     final bool isMobile = width < 600;
//     final bool isTablet = width >= 600 && width < 1000;

//     final filteredCars =
//         stockCarList.where((car) {
//           final query = _searchQuery.toLowerCase().trim();

//           if (query.isEmpty) {
//             return true;
//           }

//           return car.manufacturer.toLowerCase().contains(query) ||
//               car.carName.toLowerCase().contains(query) ||
//               car.modelYear.toString().contains(query) ||
//               car.fuelType.toLowerCase().contains(query);
//         }).toList();

//     return Container(
//       width: double.infinity,
//       color: myColors.background,
//       child: Column(
//         children: [
//           _heroSection(context, isMobile: isMobile),

//           _availableCarsSection(
//             context,
//             cars: filteredCars,
//             isMobile: isMobile,
//             isTablet: isTablet,
//           ),

//           _sellCarSection(context, isMobile: isMobile),
//         ],
//       ),
//     );
//   }

//   // ============================================================
//   // HERO SECTION
//   // ============================================================

//   Widget _heroSection(BuildContext context, {required bool isMobile}) {
//     final width = MediaQuery.of(context).size.width;

//     return Container(
//       width: double.infinity,
//       color: myColors.primary,
//       padding: EdgeInsets.fromLTRB(
//         isMobile ? 18 : 35,
//         isMobile ? 40 : 55,
//         isMobile ? 18 : 35,
//         isMobile ? 35 : 55,
//       ),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1180),
//           child: Column(
//             children: [
//               // Heading
//               Text(
//                 'Find Your Perfect Car',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: isMobile ? 30 : 46,
//                   fontWeight: FontWeight.w800,
//                   height: 1.15,
//                   letterSpacing: -0.8,
//                 ),
//               ),

//               const SizedBox(height: 12),

//               // Subtitle
//               Text(
//                 'Quality used cars from trusted dealers.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white.withOpacity(0.70),
//                   fontSize: isMobile ? 14 : 16,
//                   height: 1.5,
//                 ),
//               ),

//               const SizedBox(height: 26),

//               // Search
//               _heroSearchBar(context, isMobile: isMobile),

//               const SizedBox(height: 38),

//               // Slider
//               CarouselSlider.builder(
//                 itemCount: imageUrls.length,
//                 itemBuilder: (context, index, realIndex) {
//                   return Container(
//                     width: double.infinity,
//                     margin: EdgeInsets.symmetric(horizontal: isMobile ? 3 : 7),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(isMobile ? 14 : 20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.22),
//                           blurRadius: 20,
//                           offset: const Offset(0, 8),
//                         ),
//                       ],
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(isMobile ? 14 : 20),
//                       child: Image.network(
//                         imageUrls[index],
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           return Container(
//                             color: myColors.highlightLight,
//                             child: Icon(
//                               Icons.directions_car_rounded,
//                               size: isMobile ? 45 : 65,
//                               color: myColors.highlight,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 },
//                 options: CarouselOptions(
//                   height:
//                       isMobile
//                           ? 185
//                           : width < 1000
//                           ? 270
//                           : 350,
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   viewportFraction:
//                       isMobile
//                           ? 0.94
//                           : width < 1000
//                           ? 0.78
//                           : 0.70,
//                   autoPlayInterval: const Duration(seconds: 4),
//                   autoPlayAnimationDuration: const Duration(milliseconds: 700),
//                   enableInfiniteScroll: true,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ============================================================
//   // HERO SEARCH
//   // ============================================================

//   Widget _heroSearchBar(BuildContext context, {required bool isMobile}) {
//     return Container(
//       constraints: const BoxConstraints(maxWidth: 720),
//       padding: const EdgeInsets.all(5),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(13),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.14),
//             blurRadius: 20,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           const SizedBox(width: 11),

//           Icon(Icons.search_rounded, size: 21, color: myColors.secondaryText),

//           const SizedBox(width: 8),

//           Expanded(
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 setState(() {
//                   _searchQuery = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText:
//                     isMobile
//                         ? 'Search cars...'
//                         : 'Search by brand, model or year...',
//                 hintStyle: TextStyle(color: myColors.neutral, fontSize: 14),
//                 border: InputBorder.none,
//                 isDense: true,
//               ),
//             ),
//           ),

//           if (_searchQuery.isNotEmpty)
//             IconButton(
//               tooltip: 'Clear',
//               onPressed: () {
//                 _searchController.clear();

//                 setState(() {
//                   _searchQuery = '';
//                 });
//               },
//               icon: Icon(
//                 Icons.close_rounded,
//                 size: 19,
//                 color: myColors.secondaryText,
//               ),
//             ),

//           if (!isMobile)
//             ElevatedButton(
//               onPressed: () {
//                 FocusScope.of(context).unfocus();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: myColors.secondary,
//                 foregroundColor: Colors.white,
//                 elevation: 0,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 22,
//                   vertical: 14,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(9),
//                 ),
//               ),
//               child: const Text(
//                 'Search',
//                 style: TextStyle(fontWeight: FontWeight.w700),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   // ============================================================
//   // AVAILABLE CARS SECTION
//   // ============================================================

//   Widget _availableCarsSection(
//     BuildContext context, {
//     required List<CarDetailsModel> cars,
//     required bool isMobile,
//     required bool isTablet,
//   }) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 18 : 35,
//         vertical: isMobile ? 42 : 60,
//       ),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1180),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Available Cars',
//                           style: TextStyle(
//                             color: myColors.text,
//                             fontSize: isMobile ? 24 : 30,
//                             fontWeight: FontWeight.w800,
//                             letterSpacing: -0.4,
//                           ),
//                         ),
//                         const SizedBox(height: 7),
//                         Text(
//                           'Explore our collection of quality used cars.',
//                           style: TextStyle(
//                             color: myColors.secondaryText,
//                             fontSize: isMobile ? 13 : 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(width: 12),

//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 7,
//                     ),
//                     decoration: BoxDecoration(
//                       color: myColors.highlightLight,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       '${cars.length} Cars',
//                       style: TextStyle(
//                         color: myColors.highlight,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 28),

//               // Cars
//               if (cars.isEmpty)
//                 _emptyState()
//               else
//                 LayoutBuilder(
//                   builder: (context, constraints) {
//                     final availableWidth = constraints.maxWidth;

//                     int columns;

//                     if (availableWidth < 600) {
//                       columns = 1;
//                     } else if (availableWidth < 900) {
//                       columns = 2;
//                     } else if (availableWidth < 1150) {
//                       columns = 3;
//                     } else {
//                       columns = 4;
//                     }

//                     final spacing = 18.0;

//                     final cardWidth =
//                         (availableWidth - ((columns - 1) * spacing)) / columns;

//                     return Wrap(
//                       spacing: spacing,
//                       runSpacing: spacing,
//                       children:
//                           cars.map((car) {
//                             return SizedBox(
//                               width: cardWidth,
//                               child: _CarCard(
//                                 car: car,
//                                 onTap: () {
//                                   gotoCarDetails(car);
//                                 },
//                               ),
//                             );
//                           }).toList(),
//                     );
//                   },
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ============================================================
//   // EMPTY STATE
//   // ============================================================

//   Widget _emptyState() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 55),
//       child: Column(
//         children: [
//           Icon(Icons.search_off_rounded, size: 48, color: myColors.neutral),

//           const SizedBox(height: 14),

//           Text(
//             'No cars found',
//             style: TextStyle(
//               color: myColors.text,
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//           ),

//           const SizedBox(height: 6),

//           Text(
//             'Try searching with another brand or model.',
//             style: TextStyle(color: myColors.secondaryText, fontSize: 13),
//           ),
//         ],
//       ),
//     );
//   }

//   // ============================================================
//   // SELL YOUR CAR
//   // ============================================================

//   Widget _sellCarSection(BuildContext context, {required bool isMobile}) {
//     return Container(
//       width: double.infinity,
//       color: myColors.primary,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 35,
//         vertical: isMobile ? 38 : 48,
//       ),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1180),
//           child:
//               isMobile
//                   ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _sellCarContent(),

//                       const SizedBox(height: 24),

//                       _sellCarButton(),
//                     ],
//                   )
//                   : Row(
//                     children: [
//                       Expanded(child: _sellCarContent()),

//                       const SizedBox(width: 40),

//                       _sellCarButton(),
//                     ],
//                   ),
//         ),
//       ),
//     );
//   }

//   Widget _sellCarContent() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Want to Sell Your Car?',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 25,
//             fontWeight: FontWeight.w800,
//           ),
//         ),

//         const SizedBox(height: 8),

//         Text(
//           'Share your car details and connect with interested buyers or dealers.',
//           style: TextStyle(
//             color: Colors.white.withOpacity(0.68),
//             fontSize: 14,
//             height: 1.5,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _sellCarButton() {
//     return ElevatedButton.icon(
//       onPressed: () {
//         // TODO: Navigate to Sell Your Car page/form
//         final mValue = Get.find<MainController>();
//         mValue.changeTabAndScrollTop(2);
//       },
//       icon: const Icon(Icons.sell_outlined, size: 19),
//       label: const Text(
//         'Sell Your Car',
//         style: TextStyle(fontWeight: FontWeight.w700),
//       ),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: myColors.secondary,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//     );
//   }

//   // ============================================================
//   // CAR DETAILS NAVIGATION
//   // ============================================================

//   void gotoCarDetails(CarDetailsModel carDetails) {
//     CarDetailsController carDetailsController = Get.find();

//     carDetailsController.setCarDetails(carDetails);

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => CarDetailsPage()),
//     );
//   }
// }

// // ═══════════════════════════════════════════════════════════════
// // CAR CARD
// // ═══════════════════════════════════════════════════════════════

// class _CarCard extends StatefulWidget {
//   final CarDetailsModel car;
//   final VoidCallback onTap;

//   const _CarCard({required this.car, required this.onTap});

//   @override
//   State<_CarCard> createState() => _CarCardState();
// }

// class _CarCardState extends State<_CarCard> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     final car = widget.car;

//     return MouseRegion(
//       cursor: SystemMouseCursors.click,

//       onEnter: (_) {
//         setState(() {
//           _isHovered = true;
//         });
//       },

//       onExit: (_) {
//         setState(() {
//           _isHovered = false;
//         });
//       },

//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 220),
//         curve: Curves.easeOut,

//         transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),

//         decoration: BoxDecoration(
//           color: myColors.card,
//           borderRadius: BorderRadius.circular(16),

//           border: Border.all(
//             color:
//                 _isHovered
//                     ? myColors.highlight.withOpacity(0.35)
//                     : myColors.border,
//           ),

//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(_isHovered ? 0.09 : 0.035),
//               blurRadius: _isHovered ? 20 : 10,
//               offset: Offset(0, _isHovered ? 9 : 4),
//             ),
//           ],
//         ),

//         child: InkWell(
//           onTap: widget.onTap,
//           borderRadius: BorderRadius.circular(16),
//           hoverColor: Colors.transparent,
//           splashColor: myColors.highlight.withOpacity(0.05),

//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ─────────────────────────────────────────
//               // Car Image
//               // ─────────────────────────────────────────
//               AspectRatio(
//                 aspectRatio: 1.55,

//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.vertical(
//                     top: Radius.circular(16),
//                   ),

//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: [
//                       Image.asset(
//                         car.carImage,
//                         fit: BoxFit.cover,

//                         errorBuilder: (context, error, stackTrace) {
//                           return Container(
//                             color: myColors.highlightLight,
//                             child: Icon(
//                               Icons.directions_car_rounded,
//                               size: 52,
//                               color: myColors.highlight,
//                             ),
//                           );
//                         },
//                       ),

//                       // Year Badge
//                       Positioned(
//                         top: 12,
//                         left: 12,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 9,
//                             vertical: 6,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(7),
//                           ),
//                           child: Text(
//                             car.modelYear.toString(),
//                             style: TextStyle(
//                               color: myColors.text,
//                               fontSize: 11,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // ─────────────────────────────────────────
//               // Card Information
//               // ─────────────────────────────────────────
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(15, 14, 15, 15),

//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Car Name
//                     Text(
//                       '${car.manufacturer} ${car.carName}',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: myColors.text,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),

//                     const SizedBox(height: 7),

//                     // Price
//                     Text(
//                       car.price,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: myColors.secondary,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),

//                     const SizedBox(height: 13),

//                     // Specifications
//                     Wrap(
//                       spacing: 7,
//                       runSpacing: 6,
//                       children: [
//                         _specItem(
//                           Icons.calendar_today_outlined,
//                           car.modelYear.toString(),
//                         ),

//                         _specItem(
//                           Icons.local_gas_station_outlined,
//                           car.fuelType,
//                         ),

//                         _specItem(Icons.settings_outlined, 'Automatic'),
//                       ],
//                     ),

//                     const SizedBox(height: 11),

//                     // KM
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.speed_outlined,
//                           size: 16,
//                           color: myColors.secondaryText,
//                         ),

//                         const SizedBox(width: 6),

//                         Text(
//                           '32,000 km',
//                           style: TextStyle(
//                             color: myColors.secondaryText,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 10),

//                     // Location
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.location_on_outlined,
//                           size: 16,
//                           color: myColors.secondaryText,
//                         ),

//                         const SizedBox(width: 6),

//                         Expanded(
//                           child: Text(
//                             'Ahmedabad',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: myColors.secondaryText,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 15),

//                     // View Details Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 42,
//                       child: OutlinedButton(
//                         onPressed: widget.onTap,
//                         style: OutlinedButton.styleFrom(
//                           foregroundColor: myColors.primary,
//                           side: BorderSide(color: myColors.border),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(9),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               'View Details',
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),

//                             const SizedBox(width: 6),

//                             Icon(
//                               Icons.arrow_forward_rounded,
//                               size: 17,
//                               color: myColors.highlight,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _specItem(IconData icon, String text) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(icon, size: 14, color: myColors.secondaryText),

//         const SizedBox(width: 4),

//         Text(
//           text,
//           style: TextStyle(color: myColors.secondaryText, fontSize: 11),
//         ),
//       ],
//     );
//   }
// }
