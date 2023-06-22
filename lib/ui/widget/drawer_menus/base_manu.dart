import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class BaseManu extends StatelessWidget {
  const BaseManu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: colorPrimaryGreen, width: 1.0),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              margin: EdgeInsets.zero,
              child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 80,
                      ),
                      const Text(
                        "Welcome to Hungry Hound",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.login_sharp,
                color: colorPrimaryGreen,
              ),
              title: const Text("Sign in"),
            )
          ],
        ),
      ),
    );
  }
}
