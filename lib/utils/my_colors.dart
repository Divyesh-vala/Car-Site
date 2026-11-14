// import 'dart:ui';

// class MyColors {
//   final primary = Color(
//     0xff1A1A1A,
//   ); // (Carbon Black) – Background for a premium look.
//   final secondary = Color(
//     0xffE63946,
//   ); // (Racing Red) – Accent for call-to-actions (CTA).
//   final tertiary = Color(0xffF1FAEE); // (Snow White) – Text on dark background.
//   final highlight = Color(
//     0xff457B9D,
//   ); // (Steel Blue) – For cards, hover effects, or secondary buttons.
//   final neutral = Color(0xffA8A8A8); // (Grey) – Borders, muted text.
// }

// MyColors myColors = MyColors();

//--------------- NEW CODE
import 'dart:ui';

class MyColors {
  // ─────────────────────────────────────────────
  // Brand Colors
  // ─────────────────────────────────────────────

  /// Deep Navy – Main brand color
  final primary = const Color(0xFF0F172A);

  /// Racing Red – CTA / Important actions
  final secondary = const Color(0xFFE63946);

  /// Soft White – Main text / backgrounds
  final tertiary = const Color(0xFFF8FAFC);

  /// Steel Blue – Secondary elements / icons
  final highlight = const Color(0xFF3B82F6);

  // ─────────────────────────────────────────────
  // Neutral Colors
  // ─────────────────────────────────────────────

  /// Secondary text / disabled content
  final neutral = const Color(0xFF64748B);

  /// Page background
  final background = const Color(0xFFF8FAFC);

  /// Card background
  final card = const Color(0xFFFFFFFF);

  /// Border / Divider
  final border = const Color(0xFFE2E8F0);

  /// Light red background for selected/important states
  final secondaryLight = const Color(0xFFFFE8EB);

  /// Light blue background
  final highlightLight = const Color(0xFFEFF6FF);

  /// Main dark text
  final text = const Color(0xFF0F172A);

  /// Muted text
  final secondaryText = const Color(0xFF64748B);

  /// Success
  final success = const Color(0xFF16A34A);

  /// Warning
  final warning = const Color(0xFFF59E0B);

  /// Error
  final error = const Color(0xFFDC2626);
}

final MyColors myColors = MyColors();
