// import 'package:car_site/utils/my_colors.dart';
// import 'package:flutter/material.dart';

// class ServicesPage extends StatefulWidget {
//   const ServicesPage({super.key});

//   @override
//   State<ServicesPage> createState() => _ServicesPageState();
// }

// class _ServicesPageState extends State<ServicesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Center(
//             child: const Text(
//               "Our Services",
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             "At Car Site, we provide expert automotive services to help you make "
//             "informed decisions and enjoy a smooth ownership experience. From buying "
//             "guidance to long-term maintenance advice, we’ve got you covered.",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 16, height: 1.5),
//           ),
//           const SizedBox(height: 30),

//           // ✅ Services Grid/List
//           Wrap(
//             spacing: 20,
//             runSpacing: 20,
//             children: [
//               _ServiceCard(
//                 icon: Icons.directions_car,
//                 title: "Car Buying Consultation",
//                 description:
//                     "Get expert advice to choose the right car that fits your needs and budget.",
//               ),
//               _ServiceCard(
//                 icon: Icons.price_change,
//                 title: "Market Analysis",
//                 description:
//                     "Stay updated with the latest pricing, offers, and automotive trends.",
//               ),
//               _ServiceCard(
//                 icon: Icons.build,
//                 title: "Maintenance Guidance",
//                 description:
//                     "Learn how to maintain your vehicle for long-term reliability and performance.",
//               ),
//               _ServiceCard(
//                 icon: Icons.electric_car,
//                 title: "Future Mobility Planning",
//                 description:
//                     "Explore eco-friendly and next-gen mobility solutions tailored to your lifestyle.",
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ServiceCard extends StatefulWidget {
//   final String title, description;
//   final VoidCallback? onTap;
//   final IconData icon;

//   const _ServiceCard({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.icon,
//     this.onTap,
//   });

//   @override
//   State<_ServiceCard> createState() => __ServiceCardState();
// }

// class __ServiceCardState extends State<_ServiceCard> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child: AnimatedContainer(
//         width: 280,
//         // height: 258,
//         duration: const Duration(milliseconds: 200),
//         transform:
//             _isHovered
//                 ? (Matrix4.identity()..translate(0, -6, 0))
//                 : Matrix4.identity(),
//         decoration: BoxDecoration(
//           // color: _isHovered ? mColor.accentLight : mColor.cards,
//           color: myColors.tertiary,
//           borderRadius: BorderRadius.circular(18),
//           border: Border.all(
//             color:
//                 _isHovered
//                     ? const Color(0xFF42A5F5).withOpacity(0.5)
//                     : Colors.white.withOpacity(0.07),
//           ),
//           boxShadow:
//               _isHovered
//                   ? [
//                     BoxShadow(
//                       color: const Color(0xFF42A5F5).withOpacity(0.15),
//                       blurRadius: 20,
//                       spreadRadius: 2,
//                     ),
//                   ]
//                   : [],
//         ),
//         child: InkWell(
//           onTap: widget.onTap,
//           borderRadius: BorderRadius.circular(18),
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // FaIcon(
//                 //   skill['icon'],
//                 //   color: const Color(0xFF42A5F5),
//                 //   size: 30,
//                 // ),
//                 Icon(widget.icon, color: const Color(0xFF42A5F5), size: 30),
//                 // const Spacer(),
//                 Text(widget.title, style: const TextStyle(fontSize: 16)),
//                 Text(widget.description, style: TextStyle(fontSize: 12)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//------------------- NEW CODE
import 'package:car_site/utils/my_colors.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 700;
    final isTablet = screenWidth >= 700 && screenWidth < 1100;

    return Container(
      width: double.infinity,
      color: myColors.background,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 55 : 75,
        horizontal: isMobile ? 20 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // ─────────────────────────────────────────
              // Section Header
              // ─────────────────────────────────────────
              const Text(
                'Our Services',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: 680,
                child: Text(
                  'Everything you need to find, sell, and manage your car '
                  'with confidence.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    height: 1.6,
                    color: myColors.secondaryText,
                  ),
                ),
              ),

              const SizedBox(height: 42),

              // ─────────────────────────────────────────
              // Services
              // ─────────────────────────────────────────
              LayoutBuilder(
                builder: (context, constraints) {
                  double cardWidth;

                  if (isMobile) {
                    cardWidth = constraints.maxWidth;
                  } else if (isTablet) {
                    cardWidth = (constraints.maxWidth - 20) / 2;
                  } else {
                    cardWidth = (constraints.maxWidth - 60) / 4;
                  }

                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _ServiceCard(
                        width: cardWidth,
                        icon: Icons.directions_car_outlined,
                        title: 'Browse Cars',
                        description:
                            'Explore quality used cars with detailed information, pricing, and specifications.',
                      ),

                      _ServiceCard(
                        width: cardWidth,
                        icon: Icons.sell_outlined,
                        iconColor: myColors.secondary,
                        title: 'Sell Your Car',
                        description:
                            'Submit your car details and connect with interested dealers or buyers.',
                      ),

                      _ServiceCard(
                        width: cardWidth,
                        icon: Icons.support_agent_outlined,
                        title: 'Dealer Assistance',
                        description:
                            'Connect directly with dealers for pricing, availability, and vehicle enquiries.',
                      ),

                      _ServiceCard(
                        width: cardWidth,
                        icon: Icons.verified_outlined,
                        title: 'Verified Details',
                        description:
                            'View important vehicle information such as ownership, condition, mileage, and history.',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// Service Card
// ═══════════════════════════════════════════════════════════

class _ServiceCard extends StatefulWidget {
  final double width;
  final IconData icon;
  final String title;
  final String description;
  final Color? iconColor;
  final VoidCallback? onTap;

  const _ServiceCard({
    required this.width,
    required this.icon,
    required this.title,
    required this.description,
    this.iconColor,
    this.onTap,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final iconColor = widget.iconColor ?? myColors.highlight;

    return MouseRegion(
      cursor:
          widget.onTap != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
      onEnter: (_) {
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        width: widget.width,
        transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: myColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? iconColor.withOpacity(0.35) : myColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.08 : 0.03),
              blurRadius: _isHovered ? 22 : 10,
              offset: Offset(0, _isHovered ? 10 : 4),
            ),
          ],
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(16),
          hoverColor: Colors.transparent,
          splashColor: iconColor.withOpacity(0.05),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ─────────────────────────────────────
                // Icon
                // ─────────────────────────────────────
                AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color:
                        _isHovered
                            ? iconColor.withOpacity(0.12)
                            : myColors.highlightLight,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(widget.icon, size: 27, color: iconColor),
                ),

                const SizedBox(height: 20),

                // ─────────────────────────────────────
                // Title
                // ─────────────────────────────────────
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: myColors.text,
                  ),
                ),

                const SizedBox(height: 9),

                // ─────────────────────────────────────
                // Description
                // ─────────────────────────────────────
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.55,
                    color: myColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
