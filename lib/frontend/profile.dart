import 'package:electronic_shop/app_theme.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF457b9d),
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Card(
            elevation: 20,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "User Name:",
                    style: AppTheme().textTheme.headline2,
                  ),
                  const Text(
                    "Modather Ali",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Balance:",
                    style: AppTheme().textTheme.headline2,
                  ),
                  Text(
                    "\$999.99",
                    style: AppTheme().textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Log out")),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 9,
            child: CircleAvatar(
              foregroundColor: const Color(0xFF457b9d),
              backgroundColor: const Color(0xFF457b9d),
              radius: 85,
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: const CircleAvatar(
                  foregroundImage: AssetImage('assets/profile.png'),
                  radius: 70,
                  backgroundColor: Color(0xFF457b9d),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
