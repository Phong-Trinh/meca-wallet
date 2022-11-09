import 'package:flutter/material.dart';

import '../../my_promotion/my_promotion.dart';

class PromotionShortcut extends StatelessWidget {
  const PromotionShortcut({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPromotion()),
              )
            },
        child: Container(
            height: 114,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 146, 144, 144), width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(
                      20.0) //                 <--- border radius here
                  ),
            ),
            child: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 16),
                          SizedBox(
                            height: 36,
                            width: 36,
                            child: Image.asset(
                                'assets/images/promotional-icon.jpg'),
                          ),
                          const SizedBox(width: 16),
                          const Text('Ưu đãi hôm nay',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700)),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios_rounded, size: 20),
                          SizedBox(width: 20),
                        ])),
                const Divider(
                    height: 0,
                    color: Color.fromARGB(255, 84, 82, 82),
                    thickness: 0.4),
                Expanded(
                    flex: 2,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0)
                                //                 <--- border radius here
                                ),
                            color: Color.fromARGB(255, 222, 219, 219)),
                        child: Row(children: const [
                          SizedBox(width: 16),
                          Icon(Icons.discount_rounded,
                              size: 18,
                              color: Color.fromARGB(255, 146, 144, 144)),
                          SizedBox(width: 12),
                          Text('Giảm 10% cho các loại nước ép.',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 146, 144, 144)))
                        ])))
              ],
            )));
  }
}
