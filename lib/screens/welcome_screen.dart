// import 'package:flutter/material.dart';
// import 'package:my_farm/common_widgets/app_button.dart';
// import 'package:my_farm/common_widgets/app_text.dart';
// import 'package:my_farm/screens/dashboard/dashboard_screen.dart';
// import 'package:my_farm/styles/colors.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class WelcomeScreen extends StatelessWidget {
//   final String imagePath = "assets/images/welcome_image.png";

//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.primaryColor,
//         body: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(imagePath),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 const Spacer(),
//                 icon(),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 welcomeTextWidget(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 sloganText(),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 getButton(context),
//                 const SizedBox(
//                   height: 40,
//                 )
//               ],
//             ),
//           ),
//         ));
//   }

//   Widget icon() {
//     String iconPath = "assets/icons/app_icon.svg";
//     return SvgPicture.asset(
//       iconPath,
//       width: 48,
//       height: 56,
//     );
//   }

//   Widget welcomeTextWidget() {
//     return const Column(
//       children: [
//         AppText(
//           text: "Welcome",
//           fontSize: 48,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//         AppText(
//           text: "to our store",
//           fontSize: 48,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//       ],
//     );
//   }

//   Widget sloganText() {
//     return AppText(
//       text: "Get your grecories as fast as in hour",
//       fontSize: 16,
//       fontWeight: FontWeight.w600,
//       color: const Color(0xffFCFCFC).withOpacity(0.7),
//     );
//   }

//   Widget getButton(BuildContext context) {
//     return AppButton(
//       label: "Get Started",
//       fontWeight: FontWeight.w600,
//       padding: const EdgeInsets.symmetric(vertical: 25),
//       onPressed: () {
//         onGetStartedClicked(context);
//       },
//     );
//   }

//   void onGetStartedClicked(BuildContext context) {
//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (BuildContext context) {
//         return DashboardScreen();
//       },
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select User Type',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Farmer'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen(userType: 'Farmer')),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Customer'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen(userType: 'Customer')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
