import 'package:flutter/material.dart';
import 'language_button.dart';

Widget hambergerMenu() => NavigationDrawer(
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        Column(
          children: [
            const Text(
              'Language/ภาษา',
              style: TextStyle(
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
              onTap: () {},
            ),
            LanguageButton(
              language: 'English',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
