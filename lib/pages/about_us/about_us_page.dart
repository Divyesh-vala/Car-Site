// import 'package:car_site/utils/m_query.dart';
// import 'package:flutter/material.dart';

// class AboutUsPage extends StatefulWidget {
//   const AboutUsPage({super.key});

//   @override
//   State<AboutUsPage> createState() => _AboutUsPageState();
// }

// class _AboutUsPageState extends State<AboutUsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: Colors.grey[100],
//       width: mQuery.mWidth(context, 0.6),
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: const Text(
//               "About Us",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             "At Car Site, we believe that choosing the right car should be simple, "
//             "transparent, and stress-free. Whether you’re buying your first vehicle, "
//             "upgrading to your dream car, or seeking expert advice on maintaining your current ride, "
//             "we’re here to guide you every step of the way.",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 16, height: 1.5),
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             "What We Do",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "✅ Car buying consultation – find the perfect car for your needs.",
//           ),
//           const Text(
//             "✅ Market analysis – get the best deals and up-to-date insights.",
//           ),
//           const Text(
//             "✅ Maintenance guidance – keep your car running smoothly.",
//           ),
//           const Text(
//             "✅ Future planning – explore eco-friendly and next-gen mobility options.",
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             "Our Mission",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "To empower car buyers and owners with trusted advice, reliable information, "
//             "and personalized support so they can enjoy a hassle-free and rewarding automotive journey.",
//             style: TextStyle(fontSize: 16, height: 1.5),
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             "Why Choose Us?",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(height: 10),
//           const Text("• Experienced automotive consultants."),
//           const Text("• Independent, unbiased recommendations."),
//           const Text("• Customer-first approach."),
//           const Text("• A passion for cars and innovation."),
//         ],
//       ),
//     );
//   }
// }

//------------- NEW CODE
import 'package:car_site/pages/main/main_controller.dart';
import 'package:car_site/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 600;

    return Container(
      width: double.infinity,
      color: myColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : 32,
        vertical: isMobile ? 38 : 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==========================================================
              // HEADER
              // ==========================================================
              Center(
                child: Column(
                  children: [
                    Text(
                      'About Car Site',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: myColors.text,
                        fontSize: isMobile ? 28 : 36,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.7,
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: 680,
                      child: Text(
                        'Making the journey of buying and selling used cars simple, transparent and stress-free.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: myColors.secondaryText,
                          fontSize: isMobile ? 13 : 15,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // ==========================================================
              // INTRO CARD
              // ==========================================================
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isMobile ? 20 : 32),
                decoration: BoxDecoration(
                  color: myColors.primary,
                  borderRadius: BorderRadius.circular(18),
                ),
                child:
                    isMobile
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _introIcon(),
                            const SizedBox(height: 18),
                            _introContent(),
                          ],
                        )
                        : Row(
                          children: [
                            _introIcon(),
                            const SizedBox(width: 24),
                            Expanded(child: _introContent()),
                          ],
                        ),
              ),

              const SizedBox(height: 42),

              // ==========================================================
              // WHAT WE DO
              // ==========================================================
              _sectionHeading(
                title: 'What We Do',
                subtitle:
                    'Everything you need for a better used-car experience.',
                isMobile: isMobile,
              ),

              const SizedBox(height: 20),

              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;

                  int columns;

                  if (width < 600) {
                    columns = 1;
                  } else if (width < 900) {
                    columns = 2;
                  } else {
                    columns = 4;
                  }

                  const spacing = 15.0;

                  final cardWidth =
                      (width - ((columns - 1) * spacing)) / columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: [
                      SizedBox(
                        width: cardWidth,
                        child: _serviceCard(
                          icon: Icons.directions_car_outlined,
                          title: 'Car Buying',
                          description:
                              'Find the right car based on your needs and budget.',
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: _serviceCard(
                          icon: Icons.analytics_outlined,
                          title: 'Market Analysis',
                          description:
                              'Understand pricing and make informed decisions.',
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: _serviceCard(
                          icon: Icons.support_agent_outlined,
                          title: 'Expert Guidance',
                          description:
                              'Get helpful automotive guidance when you need it.',
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: _serviceCard(
                          icon: Icons.electric_car_outlined,
                          title: 'Future Mobility',
                          description:
                              'Explore modern and eco-friendly mobility options.',
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 42),

              // ==========================================================
              // MISSION
              // ==========================================================
              _sectionHeading(
                title: 'Our Mission',
                subtitle: 'Helping people make confident automotive decisions.',
                isMobile: isMobile,
              ),

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isMobile ? 20 : 28),
                decoration: BoxDecoration(
                  color: myColors.card,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: myColors.border),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.track_changes_outlined,
                      color: myColors.highlight,
                      size: 27,
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Text(
                        'To empower car buyers and owners with trusted advice, reliable information, and personalized support so they can enjoy a hassle-free and rewarding automotive journey.',
                        style: TextStyle(
                          color: myColors.secondaryText,
                          fontSize: isMobile ? 13 : 15,
                          height: 1.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 42),

              // ==========================================================
              // WHY CHOOSE US
              // ==========================================================
              _sectionHeading(
                title: 'Why Choose Us?',
                subtitle:
                    'Built around trust, simplicity and a customer-first experience.',
                isMobile: isMobile,
              ),

              const SizedBox(height: 20),

              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;

                  int columns;

                  if (width < 600) {
                    columns = 1;
                  } else if (width < 900) {
                    columns = 2;
                  } else {
                    columns = 4;
                  }

                  const spacing = 15.0;

                  final cardWidth =
                      (width - ((columns - 1) * spacing)) / columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: [
                      SizedBox(
                        width: cardWidth,
                        child: _reasonCard(
                          icon: Icons.verified_user_outlined,
                          title: 'Trusted Guidance',
                          description:
                              'Helpful information to make better car decisions.',
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: _reasonCard(
                          icon: Icons.balance_outlined,
                          title: 'Unbiased Advice',
                          description:
                              'Recommendations focused on your requirements.',
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: _reasonCard(
                          icon: Icons.person_outline,
                          title: 'Customer First',
                          description:
                              'A simple experience designed around our users.',
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: _reasonCard(
                          icon: Icons.auto_awesome_outlined,
                          title: 'Passion for Cars',
                          description:
                              'Technology and automotive passion together.',
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 45),

              // ==========================================================
              // BOTTOM CTA
              // ==========================================================
              InkWell(
                onTap: () {
                  final mValue = Get.find<MainController>();
                  mValue.changeTabAndScrollTop(1);
                },
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(isMobile ? 22 : 30),
                  decoration: BoxDecoration(
                    color: myColors.background,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: myColors.border),
                  ),
                  child:
                      isMobile
                          ? Column(
                            children: [
                              _ctaContent(),
                              const SizedBox(height: 20),
                              _ctaIcon(),
                            ],
                          )
                          : Row(
                            children: [
                              Expanded(child: _ctaContent()),
                              const SizedBox(width: 30),
                              _ctaIcon(),
                            ],
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // INTRO ICON
  // ============================================================

  Widget _introIcon() {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: myColors.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Icon(
        Icons.directions_car_rounded,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  // ============================================================
  // INTRO CONTENT
  // ============================================================

  Widget _introContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cars made simple.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'At Car Site, we believe choosing the right car should be simple, transparent and stress-free. Whether you are buying your first vehicle, upgrading your car or selling your used car, we are here to make the process easier.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.70),
            fontSize: 14,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SECTION HEADING
  // ============================================================

  Widget _sectionHeading({
    required String title,
    required String subtitle,
    required bool isMobile,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: myColors.text,
            fontSize: isMobile ? 22 : 26,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          subtitle,
          style: TextStyle(
            color: myColors.secondaryText,
            fontSize: isMobile ? 12 : 13,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SERVICE CARD
  // ============================================================

  Widget _serviceCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return _HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardIcon(icon),

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
            description,
            style: TextStyle(
              color: myColors.secondaryText,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // REASON CARD
  // ============================================================

  Widget _reasonCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return _HoverCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardIcon(icon),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: myColors.text,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  description,
                  style: TextStyle(
                    color: myColors.secondaryText,
                    fontSize: 11,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CARD ICON
  // ============================================================

  Widget _cardIcon(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: myColors.highlightLight,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Icon(icon, color: myColors.highlight, size: 21),
    );
  }

  // ============================================================
  // CTA
  // ============================================================

  Widget _ctaContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Looking for your next car?',
          style: TextStyle(
            color: myColors.text,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 7),

        Text(
          'Explore available cars or list your own car for interested buyers.',
          style: TextStyle(
            color: myColors.secondaryText,
            fontSize: 13,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _ctaIcon() {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: myColors.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Icon(
        Icons.arrow_forward_rounded,
        color: Colors.white,
        size: 26,
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// HOVER CARD
// ═══════════════════════════════════════════════════════════════

class _HoverCard extends StatefulWidget {
  final Widget child;

  const _HoverCard({required this.child});

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,

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
        duration: const Duration(milliseconds: 200),
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
                    ? myColors.highlight.withOpacity(0.35)
                    : myColors.border,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.07 : 0.025),
              blurRadius: _isHovered ? 18 : 8,
              offset: Offset(0, _isHovered ? 8 : 3),
            ),
          ],
        ),

        child: widget.child,
      ),
    );
  }
}
