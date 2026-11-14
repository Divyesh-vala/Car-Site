// import 'package:flutter/material.dart';

// class AddOrEditContactUsScreen extends StatefulWidget {
//   const AddOrEditContactUsScreen({super.key});

//   @override
//   State<AddOrEditContactUsScreen> createState() =>
//       _AddOrEditContactUsScreenState();
// }

// class _AddOrEditContactUsScreenState extends State<AddOrEditContactUsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Contact Us Details",
//           style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // const Text(
//               //   "Sell Your Car",
//               //   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               // ),
//               // const SizedBox(height: 16),
//               // const Text(
//               //   "Looking to sell your car? At Car Site, we make it easy. "
//               //   "Submit your car details, and our experts will help you get the best price "
//               //   "through our trusted network of buyers.",
//               //   textAlign: TextAlign.center,
//               //   style: TextStyle(fontSize: 16, height: 1.5),
//               // ),
//               const SizedBox(height: 40),

//               ConstrainedBox(
//                 constraints: const BoxConstraints(maxWidth: 600),
//                 child: Column(
//                   children: [
//                     // ✅ Simple form for car selling
//                     _inputField(label: "Address"),
//                     _inputField(label: "Phone"),
//                     _inputField(label: "Email"),
//                     _inputField(label: "Working Hours"),
//                     const SizedBox(height: 20),

//                     ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 40,
//                           vertical: 16,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () {
//                         // TODO: Implement form submission
//                       },
//                       // icon: Icon(Icons.location_on),
//                       label: const Text(
//                         "Submit",
//                         style: TextStyle(fontSize: 16),
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

//   DropdownButtonFormField dropDownWidget(
//     List items,
//     String lable, {
//     required void Function(dynamic)? onChanged,
//   }) {
//     return DropdownButtonFormField(
//       items:
//           items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         label: Text(lable),
//         border: _border(),
//         enabledBorder: _border(),
//         focusedBorder: _border(),
//       ),
//     );
//   }

//   // ✅ Reusable input field
//   Widget _inputField({required String label}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         decoration: InputDecoration(
//           labelText: label,
//           border: _border(),
//           enabledBorder: _border(),
//           focusedBorder: _border(),

//           // filled: true,
//           // fillColor: Colors.grey[100],
//         ),
//       ),
//     );
//   }

//   static InputBorder _border() {
//     return OutlineInputBorder(borderRadius: BorderRadius.circular(10));
//   }
// }

//---------------- NEW CODE

import 'package:car_site/utils/my_colors.dart';
import 'package:flutter/material.dart';

class AddOrEditContactUsScreen extends StatefulWidget {
  const AddOrEditContactUsScreen({super.key});

  @override
  State<AddOrEditContactUsScreen> createState() =>
      _AddOrEditContactUsScreenState();
}

class _AddOrEditContactUsScreenState extends State<AddOrEditContactUsScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController workingHoursController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    workingHoursController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: myColors.background,
        surfaceTintColor: Colors.transparent,
        foregroundColor: myColors.text,
        title: const Text(
          "Contact Us Details",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: myColors.highlightLight,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: myColors.highlight.withOpacity(0.15),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: myColors.highlight,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            Icons.contact_page_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Business Contact Information",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Update the contact information displayed on your Car Site.",
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.4,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    "Contact Details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Keep your dealership information accurate so customers can reach you easily.",
                    style: TextStyle(
                      fontSize: 14,
                      color: myColors.secondaryText,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Address
                  _inputField(
                    controller: addressController,
                    label: "Address",
                    hintText: "Enter dealership address",
                    icon: Icons.location_on_outlined,
                    maxLines: 2,
                  ),

                  const SizedBox(height: 14),

                  // Phone
                  _inputField(
                    controller: phoneController,
                    label: "Phone",
                    hintText: "+91 98765 43210",
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                  ),

                  const SizedBox(height: 14),

                  // Email
                  _inputField(
                    controller: emailController,
                    label: "Email",
                    hintText: "dealer@example.com",
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 14),

                  // Working Hours
                  _inputField(
                    controller: workingHoursController,
                    label: "Working Hours",
                    hintText: "Mon - Sat: 9:00 AM - 7:00 PM",
                    icon: Icons.access_time_outlined,
                  ),

                  const SizedBox(height: 28),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Save / Update contact details
                      },
                      icon: const Icon(Icons.save_outlined),
                      label: const Text(
                        "Save Contact Details",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: myColors.highlight,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Center(
                    child: Text(
                      "These details will be visible to customers.",
                      style: TextStyle(fontSize: 12, color: myColors.neutral),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(color: myColors.text, fontSize: 15),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon, color: myColors.highlight, size: 21),
        filled: true,
        fillColor: myColors.card,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        labelStyle: TextStyle(color: myColors.secondaryText),
        hintStyle: TextStyle(color: myColors.neutral, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: myColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: myColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: myColors.highlight, width: 1.5),
        ),
      ),
    );
  }
}
