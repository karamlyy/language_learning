// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:language_learning/data/model/language/language_model.dart';
// import 'package:language_learning/presenter/widgets/primary_text.dart';
// import 'package:language_learning/utils/colors/app_colors.dart';
// import 'package:provider/provider.dart';
//
// import '../provider/languages_provider.dart';
//
// class SetLanguagesList extends StatelessWidget {
//   const SetLanguagesList({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final languageProvider = context.watch<LanguagesProvider>();
//
//
//
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
//         child: Container(
//           color: Colors.red,
//           child: ListView.builder(
//             itemCount: languages.length,
//             itemBuilder: (context, index) {
//               final LanguageModel language = languages[index];
//
//               return Column(
//                 children: [
//                   ListTile(
//                     contentPadding: const EdgeInsets.only(left: 12).r,
//                     leading: Image.asset(
//                       language.image ?? '',
//                       width: 32,
//                       height: 32,
//                       fit: BoxFit.cover,
//                     ),
//                     title: PrimaryText(
//                       text: language.name ?? 'unknown',
//                       color: AppColors.primaryText,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                     ),
//                     selected: false,
//                     onTap: () {},
//                   ),
//                   8.verticalSpace,
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
