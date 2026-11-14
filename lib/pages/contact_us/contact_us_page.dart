// import 'package:car_site/pages/add_or_edit_contact_us/add_or_edit_contact_us_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ContactUsPage extends StatefulWidget {
//   const ContactUsPage({super.key});

//   @override
//   State<ContactUsPage> createState() => _ContactUsPageState();
// }

// class _ContactUsPageState extends State<ContactUsPage> {
//   double startLat = 37.7749;
//   double startLng = -122.4194;
//   double endLat = 34.0522;
//   double endLng = -118.2437;
//   String googleMapsUrl = "";
//   @override
//   void initState() {
//     super.initState();
//     googleMapsUrl =
//         "https://www.google.com/maps/dir/?api=1&origin=$startLat,$startLng&destination=$endLat,$endLng&travelmode=driving";
//   }

//   Future<void> _launchGoogleMaps() async {
//     final Uri uri = Uri.parse(googleMapsUrl);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       throw 'Could not launch $uri';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Center(
//             child: const Text(
//               "Contact Us",
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             "We’d love to hear from you! Whether you have questions, need advice, or "
//             "want to schedule a consultation, our team at Car Site is here to help.",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 16, height: 1.5),
//           ),
//           const SizedBox(height: 30),

//           // ✅ Contact Details in a Wrap (responsive for web)
//           Wrap(
//             spacing: 30,
//             runSpacing: 20,
//             children: [
//               _contactCard(
//                 icon: Icons.location_on,
//                 title: "Address",
//                 detail: "123 Auto Street, CarCity, Gandhinagar",
//                 onTap: () {
//                   // _launchGoogleMaps();
//                 },
//               ),
//               _contactCard(
//                 icon: Icons.phone,
//                 title: "Phone",
//                 detail: "+91 1234567890",
//                 onTap: () {},
//               ),
//               _contactCard(
//                 icon: Icons.email,
//                 title: "Email",
//                 detail: "support@carsite.com",
//                 onTap: () {},
//               ),
//               _contactCard(
//                 icon: Icons.access_time,
//                 title: "Working Hours",
//                 detail: "Mon – Sat: 9:00 AM – 6:00 PM",
//                 onTap: () {},
//               ),
//             ],
//           ),

//           const SizedBox(height: 40),

//           // ✅ Call to Action
//           Center(
//             child: ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 30,
//                   vertical: 16,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onPressed: () {
//                 // TODO: implement contact form or email launch
//               },
//               icon: const Icon(Icons.message),
//               label: const Text(
//                 "Send Us a Message",
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 40,
//                   vertical: 16,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AddOrEditContactUsScreen(),
//                   ),
//                 );
//               },
//               icon: Icon(Icons.edit),
//               label: const Text(
//                 "Update Contact Us",
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ Reusable Contact Card
//   Widget _contactCard({
//     required IconData icon,
//     required String title,
//     required String detail,
//     required Function()? onTap,
//   }) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(12),
//       onTap: onTap,
//       child: AnimatedContainer(
//         width: 260, // good width for web
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 6,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         duration: const Duration(seconds: 1),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(icon, size: 36, color: Colors.blueAccent),
//             const SizedBox(height: 12),
//             Text(
//               title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               detail,
//               style: const TextStyle(fontSize: 14, color: Colors.black87),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//-------------------- NEW CODE

import 'package:car_site/pages/add_or_edit_contact_us/add_or_edit_contact_us_screen.dart';
import 'package:car_site/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  double startLat = 37.7749;
  double startLng = -122.4194;
  double endLat = 34.0522;
  double endLng = -118.2437;

  String googleMapsUrl = "";

  @override
  void initState() {
    super.initState();

    googleMapsUrl =
        "https://www.google.com/maps/dir/?api=1"
        "&origin=$startLat,$startLng"
        "&destination=$endLat,$endLng"
        "&travelmode=driving";
  }

  Future<void> _launchGoogleMaps() async {
    final Uri uri = Uri.parse(googleMapsUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 950;

    return Container(
      width: double.infinity,
      color: myColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : 30,
        vertical: isMobile ? 38 : 55,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              // ==========================================================
              // HEADER
              // ==========================================================
              Text(
                "Contact Us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: myColors.text,
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                ),
              ),

              const SizedBox(height: 10),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 680),
                child: Text(
                  "Have a question about a car, want to sell your vehicle, "
                  "or need assistance? We’re here to help.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: myColors.secondaryText,
                    fontSize: isMobile ? 13 : 15,
                    height: 1.6,
                  ),
                ),
              ),

              const SizedBox(height: 38),

              // ==========================================================
              // CONTACT CARDS
              // ==========================================================
              LayoutBuilder(
                builder: (context, constraints) {
                  final double availableWidth = constraints.maxWidth;

                  int columns;

                  if (availableWidth < 600) {
                    columns = 1;
                  } else if (availableWidth < 900) {
                    columns = 2;
                  } else {
                    columns = 4;
                  }

                  const double spacing = 16;

                  final double cardWidth =
                      (availableWidth - ((columns - 1) * spacing)) / columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: [
                      SizedBox(
                        width: cardWidth,
                        child: _contactCard(
                          icon: Icons.location_on_outlined,
                          title: "Address",
                          detail: "123 Auto Street, CarCity, Gandhinagar",
                          onTap: _launchGoogleMaps,
                          actionText: "Open Maps",
                        ),
                      ),

                      SizedBox(
                        width: cardWidth,
                        child: _contactCard(
                          icon: Icons.phone_outlined,
                          title: "Phone",
                          detail: "+91 1234567890",
                          onTap: () {},
                          actionText: "Call Us",
                        ),
                      ),

                      SizedBox(
                        width: cardWidth,
                        child: _contactCard(
                          icon: Icons.email_outlined,
                          title: "Email",
                          detail: "support@carsite.com",
                          onTap: () {},
                          actionText: "Email Us",
                        ),
                      ),

                      SizedBox(
                        width: cardWidth,
                        child: _contactCard(
                          icon: Icons.access_time_outlined,
                          title: "Working Hours",
                          detail: "Mon – Sat: 9:00 AM – 6:00 PM",
                          onTap: null,
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 35),

              // ==========================================================
              // CONTACT CTA
              // ==========================================================
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isMobile ? 20 : 28),
                decoration: BoxDecoration(
                  color: myColors.primary,
                  borderRadius: BorderRadius.circular(18),
                ),
                child:
                    isMobile
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _ctaIcon(),
                            const SizedBox(height: 18),
                            _ctaContent(),
                            const SizedBox(height: 20),
                            _messageButton(),
                          ],
                        )
                        : Row(
                          children: [
                            _ctaIcon(),
                            const SizedBox(width: 18),
                            Expanded(child: _ctaContent()),
                            const SizedBox(width: 25),
                            _messageButton(),
                          ],
                        ),
              ),

              const SizedBox(height: 25),

              // ==========================================================
              // ADMIN / UPDATE CONTACT
              // ==========================================================
              if (isMobile)
                Column(
                  children: [
                    _adminText(),
                    const SizedBox(height: 12),
                    _updateButton(),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _adminText(),
                    const SizedBox(width: 15),
                    _updateButton(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // CONTACT CARD
  // ============================================================

  Widget _contactCard({
    required IconData icon,
    required String title,
    required String detail,
    required VoidCallback? onTap,
    String? actionText,
  }) {
    return _HoverContactCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: myColors.highlightLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: myColors.highlight, size: 23),
          ),

          const SizedBox(height: 16),

          Text(
            title,
            style: TextStyle(
              color: myColors.text,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 7),

          Text(
            detail,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: myColors.secondaryText,
              fontSize: 12,
              height: 1.45,
            ),
          ),

          if (actionText != null) ...[
            const SizedBox(height: 13),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  actionText,
                  style: TextStyle(
                    color: myColors.highlight,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(width: 4),

                Icon(
                  Icons.arrow_forward_rounded,
                  color: myColors.highlight,
                  size: 15,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  // ============================================================
  // CTA ICON
  // ============================================================

  Widget _ctaIcon() {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: myColors.secondary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Icon(
        Icons.chat_bubble_outline,
        color: Colors.white,
        size: 25,
      ),
    );
  }

  // ============================================================
  // CTA CONTENT
  // ============================================================

  Widget _ctaContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Need help?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          "Send us a message and our team will get back to you.",
          style: TextStyle(
            color: Colors.white.withOpacity(0.70),
            fontSize: 13,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // MESSAGE BUTTON
  // ============================================================

  Widget _messageButton() {
    return SizedBox(
      height: 46,
      child: ElevatedButton.icon(
        onPressed: () {
          // TODO: Implement contact form
        },
        icon: const Icon(Icons.message_outlined, size: 18),
        label: const Text(
          "Send Us a Message",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: myColors.secondary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ADMIN TEXT
  // ============================================================

  Widget _adminText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.admin_panel_settings_outlined,
          size: 16,
          color: myColors.secondaryText,
        ),

        const SizedBox(width: 6),

        Text(
          "Admin can update contact information",
          style: TextStyle(color: myColors.secondaryText, fontSize: 11),
        ),
      ],
    );
  }

  // ============================================================
  // UPDATE BUTTON
  // ============================================================

  Widget _updateButton() {
    return OutlinedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddOrEditContactUsScreen()),
        );
      },
      icon: Icon(Icons.edit_outlined, size: 17, color: myColors.highlight),
      label: Text(
        "Update Contact Us",
        style: TextStyle(
          color: myColors.highlight,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: myColors.border),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// HOVER CONTACT CARD
// ═══════════════════════════════════════════════════════════════

class _HoverContactCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _HoverContactCard({required this.child, required this.onTap});

  @override
  State<_HoverContactCard> createState() => _HoverContactCardState();
}

class _HoverContactCardState extends State<_HoverContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:
          widget.onTap != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,

      onEnter: (_) {
        if (widget.onTap != null) {
          setState(() {
            _isHovered = true;
          });
        }
      },

      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },

      child: GestureDetector(
        onTap: widget.onTap,

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,

          transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),

          width: double.infinity,

          padding: const EdgeInsets.all(18),

          decoration: BoxDecoration(
            color: myColors.card,
            borderRadius: BorderRadius.circular(15),

            border: Border.all(
              color:
                  _isHovered
                      ? myColors.highlight.withOpacity(0.4)
                      : myColors.border,
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.07 : 0.025),
                blurRadius: _isHovered ? 18 : 8,
                offset: Offset(0, _isHovered ? 7 : 3),
              ),
            ],
          ),

          child: widget.child,
        ),
      ),
    );
  }
}
