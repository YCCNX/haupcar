import 'package:flutter/material.dart';
import 'language_button.dart';
import 'package:get/get.dart';

Widget hambergerMenu() => NavigationDrawer(
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        Column(
          children: [
            Text(
              'Language'.tr,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 1.5,
            ),
            LanguageButton(
              language: 'ไทย',
              onTap: () {
                var locale = const Locale('TH', 'th');
                Get.updateLocale(locale);
              },
            ),
            LanguageButton(
              language: 'English',
              onTap: () {
                var locale = const Locale('US', 'en');
                Get.updateLocale(locale);
              },
            ),
          ],
        ),
      ],
    );
