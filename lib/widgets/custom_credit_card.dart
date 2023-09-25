import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/core/assets.dart';
import 'package:flutter_ui/models/user_data_model.dart';
import 'package:flutter_ui/pages/home_page/sub/dashboard_page/dashboard_page.dart';
import 'package:get/get.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({
    super.key,
    required this.userData,
  });

  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            userData.firstColor,
            userData.secondColor,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Available Balance',
                  style: TextStyle(
                    fontFamily: 'SP400',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$${userData.balance}'.limit(10),
                      style: const TextStyle(
                        fontFamily: 'SP500',
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      userData.cent,
                      style: const TextStyle(
                        fontFamily: 'SP500',
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ).marginSymmetric(vertical: 10),
                Text(
                  userData.cardNo,
                  style: const TextStyle(
                    fontFamily: 'SP500',
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Valid From',
                      style: TextStyle(
                        fontFamily: 'SP400',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ).marginOnly(right: 5),
                    Text(
                      userData.validFrom,
                      style: const TextStyle(
                        fontFamily: 'SP500',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ).marginOnly(right: 10),
                    const Text(
                      'Valid Thru',
                      style: TextStyle(
                        fontFamily: 'SP400',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ).marginOnly(right: 5),
                    Text(
                      userData.validThru,
                      style: const TextStyle(
                        fontFamily: 'SP500',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ).marginOnly(right: 10),
                  ],
                ).marginSymmetric(vertical: 10),
                const Text(
                  'Card Holder',
                  style: TextStyle(
                    fontFamily: 'SP400',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ).marginOnly(top: 10, bottom: 5),
                Text(
                  userData.cardHolder.limit(20),
                  style: const TextStyle(
                    fontFamily: 'SP600',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  SvgIcons.chip,
                ),
                Image.asset(
                  PngImages.card,
                ),
              ],
            ),
          ),
        ],
      ).paddingAll(30),
    );
  }
}
