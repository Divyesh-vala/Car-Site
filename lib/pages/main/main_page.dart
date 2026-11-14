// import 'package:car_site/pages/add_car/add_car_page.dart';
// import 'package:car_site/pages/main/main_controller.dart';
// import 'package:car_site/utils/m_query.dart';
// import 'package:car_site/utils/my_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
//   MainController mainController = Get.find();
//   @override
//   void initState() {
//     super.initState();

//     mainController.setTabController(
//       TabController(length: mainController.tabList.length, vsync: this),
//     );
//     // tabController = TabController(
//     //   length: mainController.tabList.length,
//     //   vsync: this,
//     // );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final viewportHeight = mQuery.mHieght(context, 1);
//     return GetBuilder<MainController>(
//       builder: (mValue) {
//         return DefaultTabController(
//           length: mValue.tabList.length,
//           child: Scaffold(
//             floatingActionButton: FloatingActionButton(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => AddCarPage()),
//                 );
//               },
//               // child: Icon(Icons.location_on),
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Icon(Icons.directions_car),
//                   Positioned(
//                     top: -5,
//                     right: -2,
//                     child: Icon(Icons.add, size: 12),
//                   ),
//                 ],
//               ),
//             ),
//             appBar: AppBar(
//               title: Text(
//                 'Car Site',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               centerTitle: true,
//               bottom: PreferredSize(
//                 preferredSize: Size(double.infinity, 50),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       color: myColors.primary.withOpacity(0.5),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Call us: +91 1234567890 | Email: support@carsite.com',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(color: myColors.tertiary),
//                         ),
//                       ),
//                     ),
//                     TabBar(
//                       controller: mValue.tabController,
//                       onTap: (value) {
//                         mValue.changeTabIndex(value);
//                       },
//                       isScrollable: true,
//                       indicatorSize: TabBarIndicatorSize.tab,
//                       tabs: mValue.tabList.map((e) => Tab(text: e)).toList(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             body: SingleChildScrollView(
//               controller: mValue.scrollController,
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(minHeight: viewportHeight),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     mValue.pages[mValue.tabIndex],
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         // color: Colors.black12,
//                         // border: Border(
//                         //   top: BorderSide(
//                         //     width: 1,
//                         //     color: Colors.blueGrey.shade100,
//                         //   ),
//                         // ),
//                         // color: Colors.pink.shade100,
//                       ),
//                       child: Column(
//                         crossAxisAlignment:
//                             // screenWidthIsGreater
//                             //     ? CrossAxisAlignment.start
//                             //     :
//                             CrossAxisAlignment.center,
//                         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: _buildFooterContent(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   List<Widget> _buildFooterContent() {
//     return [
//       Divider(height: 1, color: Colors.blueGrey.shade100),
//       // Footer 2 - Quick Links
//       const SizedBox(height: 10),
//       Text(
//         'Quick click',
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//       ),
//       const SizedBox(height: 10),
//       Wrap(
//         children: [
//           TextButton(
//             onPressed: () {
//               mainController.changeTabAndScrollTop(0);
//             },
//             child: Text("Home"),
//           ),
//           TextButton(
//             onPressed: () {
//               mainController.changeTabAndScrollTop(1);
//             },
//             child: Text("Stock cars"),
//           ),
//           TextButton(
//             onPressed: () {
//               mainController.changeTabAndScrollTop(2);
//             },
//             child: Text("Sell cars"),
//           ),
//           TextButton(
//             onPressed: () {
//               mainController.changeTabAndScrollTop(3);
//             },
//             child: Text("About us"),
//           ),
//           TextButton(
//             onPressed: () {
//               mainController.changeTabAndScrollTop(4);
//             },
//             child: Text("Services"),
//           ),

//           TextButton(
//             onPressed: () {
//               mainController.changeTabAndScrollTop(5);
//             },
//             child: Text("Contact us"),
//           ),
//         ],
//       ),

//       const SizedBox(height: 20),

//       // Footer 3 - Contact
//       Text(
//         "Contact",
//         style: TextStyle(
//           // color: Colors.white,
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       SizedBox(height: 10),

//       Text(
//         "📍 123 Auto street, Carcity, Gandhinagar",
//         // style: TextStyle(color: Colors.white70),
//       ),

//       Text(
//         "📞 +91 1234567890",
//         // style: TextStyle(color: Colors.white70)
//       ),

//       Text(
//         "✉ support@carsite.com",
//         // style: TextStyle(color: Colors.white70),
//       ),
//       // Row(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       //     // IconButton(onPressed: () {}, icon: Icon(Icons.location_on)),
//       //     // const SizedBox(width: 5),
//       //     IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
//       //     const SizedBox(width: 5),

//       //     IconButton(onPressed: () {}, icon: Icon(Icons.email)),
//       //     const SizedBox(width: 5),
//       //     IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
//       //     // const SizedBox(width: 5),
//       //     // IconButton(onPressed: () {}, icon: Icon(Icons.instagram)),
//       //   ],
//       // ),
//       //-----------------------------------------------------//
//       // const SizedBox(height: 20),

//       // // Footer 3 - Contact
//       // Text(
//       //   "Social Media",
//       //   style: TextStyle(
//       //     // color: Colors.white,
//       //     fontSize: 18,
//       //     fontWeight: FontWeight.w600,
//       //   ),
//       // ),
//       // SizedBox(height: 10),

//       // Row(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       //     Icon(Icons.facebook),
//       //     const SizedBox(width: 10),
//       //     Icon(Icons.facebook),
//       //     const SizedBox(width: 10),
//       //     Icon(Icons.facebook),
//       //   ],
//       // ),
//       //-----------------------------------------------------//
//       const SizedBox(height: 20),
//       // Text(
//       //   'Quick Click',
//       //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//       // ),
//       Container(
//         color: Colors.blueGrey.shade100,
//         child: Column(
//           children: [
//             // Divider(height: 1, color: Colors.blueGrey.shade100),
//             const SizedBox(height: 10),
//             Wrap(
//               crossAxisAlignment: WrapCrossAlignment.center,
//               children: [
//                 TextButton(onPressed: () {}, child: Text("Privacy policy")),
//                 Text('|'),
//                 TextButton(onPressed: () {}, child: Text("Terms & conditions")),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(width: 1, color: Colors.white),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Text('c'),
//                   ),
//                 ),
//                 Text(
//                   // ' 2025 Car Site | All Rights Reserved',
//                   ' 2025 Car Site | All rights reserved',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     ];
//   }

//   // changeTabAndScrollTop(int index) {
//   //   setState(() {
//   //     tabIndex = index;
//   //   });
//   //   tabController.animateTo(tabIndex);
//   //   scrollController.jumpTo(0.0);
//   // }
// }

//--------------------- NEW CODE
import 'package:car_site/pages/add_car/add_car_page.dart';
import 'package:car_site/pages/main/main_controller.dart';
import 'package:car_site/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final MainController mainController = Get.find();

  @override
  void initState() {
    super.initState();

    mainController.setTabController(
      TabController(length: mainController.tabList.length, vsync: this),
    );
  }

  @override
  void dispose() {
    mainController.tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (mValue) {
        return DefaultTabController(
          length: mValue.tabList.length,
          child: Scaffold(
            backgroundColor: myColors.background,

            // ─────────────────────────────────────────────
            // Floating Add Car Button
            // ─────────────────────────────────────────────
            floatingActionButton: _buildAddCarButton(),

            // ─────────────────────────────────────────────
            // APP BAR
            // ─────────────────────────────────────────────
            appBar: AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: myColors.card,
              surfaceTintColor: Colors.transparent,

              titleSpacing: 20,

              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: myColors.primary,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Icon(
                      Icons.directions_car_rounded,
                      color: myColors.tertiary,
                      size: 23,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Text(
                    'Car Site',
                    style: TextStyle(
                      color: myColors.text,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),

              actions: [
                _buildTopContactInfo(context),
                const SizedBox(width: 20),
              ],

              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: _buildNavigationBar(mValue),
              ),
            ),

            // ─────────────────────────────────────────────
            // BODY
            // ─────────────────────────────────────────────
            body: SingleChildScrollView(
              controller: mValue.scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [mValue.pages[mValue.tabIndex], _buildFooter(mValue)],
              ),
            ),
          ),
        );
      },
    );
  }

  // ═══════════════════════════════════════════════════
  // ADD CAR BUTTON
  // ═══════════════════════════════════════════════════

  Widget _buildAddCarButton() {
    return FloatingActionButton.extended(
      backgroundColor: myColors.secondary,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddCarPage()),
        );
      },
      icon: const Icon(Icons.add_circle_outline, size: 21),
      label: const Text(
        'Add Car',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  // ═══════════════════════════════════════════════════
  // TOP CONTACT INFO
  // ═══════════════════════════════════════════════════

  Widget _buildTopContactInfo(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Hide contact information on small screens.
    if (width < 800) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        _contactInfoItem(icon: Icons.phone_outlined, text: '+91 1234567890'),
        const SizedBox(width: 22),
        _contactInfoItem(
          icon: Icons.email_outlined,
          text: 'support@carsite.com',
        ),
      ],
    );
  }

  Widget _contactInfoItem({required IconData icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 17, color: myColors.highlight),
        const SizedBox(width: 7),
        Text(
          text,
          style: TextStyle(
            color: myColors.secondaryText,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════════════
  // NAVIGATION BAR
  // ═══════════════════════════════════════════════════

  Widget _buildNavigationBar(MainController mValue) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: myColors.card,
        border: Border(
          top: BorderSide(color: myColors.border, width: 1),
          bottom: BorderSide(color: myColors.border, width: 1),
        ),
      ),
      child: Center(
        child: TabBar(
          controller: mValue.tabController,

          isScrollable: true,

          tabAlignment: TabAlignment.center,

          dividerColor: Colors.transparent,

          indicatorColor: myColors.highlight,
          indicatorWeight: 3,

          indicatorSize: TabBarIndicatorSize.label,

          labelColor: myColors.text,
          unselectedLabelColor: myColors.secondaryText,

          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),

          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),

          labelPadding: const EdgeInsets.symmetric(horizontal: 18),

          onTap: (value) {
            mValue.changeTabIndex(value);

            // Keep navigation smooth.
            if (mValue.scrollController.hasClients) {
              mValue.scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOut,
              );
            }
          },

          tabs: [
            for (int i = 0; i < mValue.tabList.length; i++)
              Tab(
                text: mValue.tabList[i],
                icon: Icon(_getTabIcon(i)),
                iconMargin: const EdgeInsets.only(bottom: 3),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getTabIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;

      case 1:
        return Icons.directions_car_outlined;

      case 2:
        return Icons.sell_outlined;

      case 3:
        return Icons.info_outline;

      case 4:
        return Icons.miscellaneous_services_outlined;

      case 5:
        return Icons.contact_mail_outlined;

      default:
        return Icons.circle_outlined;
    }
  }

  // ═══════════════════════════════════════════════════
  // FOOTER
  // ═══════════════════════════════════════════════════

  Widget _buildFooter(MainController mValue) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 60),
      decoration: BoxDecoration(color: myColors.primary),
      child: Column(children: [_buildFooterMain(mValue), _buildFooterBottom()]),
    );
  }

  // ═══════════════════════════════════════════════════
  // FOOTER MAIN
  // ═══════════════════════════════════════════════════

  Widget _buildFooterMain(MainController mValue) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 800;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1150),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 45),
              child:
                  isDesktop
                      ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 2, child: _buildFooterAbout()),
                          const SizedBox(width: 50),
                          Expanded(child: _buildQuickLinks(mValue)),
                          const SizedBox(width: 50),
                          Expanded(child: _buildFooterContact()),
                        ],
                      )
                      : Column(
                        children: [
                          _buildFooterAbout(),
                          const SizedBox(height: 35),
                          _buildQuickLinks(mValue),
                          const SizedBox(height: 35),
                          _buildFooterContact(),
                        ],
                      ),
            ),
          ),
        );
      },
    );
  }

  // ═══════════════════════════════════════════════════
  // FOOTER ABOUT
  // ═══════════════════════════════════════════════════

  Widget _buildFooterAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: myColors.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.directions_car_rounded,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Car Site',
              style: TextStyle(
                color: myColors.tertiary,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        Text(
          'Your trusted place to discover, buy and sell quality pre-owned cars.',
          style: TextStyle(
            color: myColors.tertiary.withOpacity(0.70),
            height: 1.6,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════════════
  // QUICK LINKS
  // ═══════════════════════════════════════════════════

  Widget _buildQuickLinks(MainController mValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: TextStyle(
            color: myColors.tertiary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 14),

        _footerLink(
          title: 'Home',
          icon: Icons.home_outlined,
          onTap: () {
            mValue.changeTabAndScrollTop(0);
          },
        ),

        _footerLink(
          title: 'Stock Cars',
          icon: Icons.directions_car_outlined,
          onTap: () {
            mValue.changeTabAndScrollTop(1);
          },
        ),

        _footerLink(
          title: 'Sell Your Car',
          icon: Icons.sell_outlined,
          onTap: () {
            mValue.changeTabAndScrollTop(2);
          },
        ),

        _footerLink(
          title: 'About Us',
          icon: Icons.info_outline,
          onTap: () {
            mValue.changeTabAndScrollTop(3);
          },
        ),

        _footerLink(
          title: 'Services',
          icon: Icons.miscellaneous_services_outlined,
          onTap: () {
            mValue.changeTabAndScrollTop(4);
          },
        ),

        _footerLink(
          title: 'Contact Us',
          icon: Icons.contact_mail_outlined,
          onTap: () {
            mValue.changeTabAndScrollTop(5);
          },
        ),
      ],
    );
  }

  Widget _footerLink({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 17, color: myColors.tertiary.withOpacity(0.65)),
            const SizedBox(width: 9),
            Text(
              title,
              style: TextStyle(
                color: myColors.tertiary.withOpacity(0.75),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════
  // FOOTER CONTACT
  // ═══════════════════════════════════════════════════

  Widget _buildFooterContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: TextStyle(
            color: myColors.tertiary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 16),

        _footerContactItem(
          icon: Icons.location_on_outlined,
          text: '123 Auto Street, CarCity,\nGandhinagar',
        ),

        const SizedBox(height: 13),

        _footerContactItem(icon: Icons.phone_outlined, text: '+91 1234567890'),

        const SizedBox(height: 13),

        _footerContactItem(
          icon: Icons.email_outlined,
          text: 'support@carsite.com',
        ),
      ],
    );
  }

  Widget _footerContactItem({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: myColors.secondary),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: myColors.tertiary.withOpacity(0.70),
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════════════
  // FOOTER BOTTOM
  // ═══════════════════════════════════════════════════

  Widget _buildFooterBottom() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.15),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.08))),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 8,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  color: myColors.tertiary.withOpacity(0.70),
                  fontSize: 12,
                ),
              ),
            ),

            Text(
              '•',
              style: TextStyle(color: myColors.tertiary.withOpacity(0.35)),
            ),

            TextButton(
              onPressed: () {},
              child: Text(
                'Terms & Conditions',
                style: TextStyle(
                  color: myColors.tertiary.withOpacity(0.70),
                  fontSize: 12,
                ),
              ),
            ),

            Text(
              '•',
              style: TextStyle(color: myColors.tertiary.withOpacity(0.35)),
            ),

            Text(
              '© 2026 Car Site. All rights reserved.',
              style: TextStyle(
                color: myColors.tertiary.withOpacity(0.55),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
