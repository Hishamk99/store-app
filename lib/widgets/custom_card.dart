import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // تخفيف حدة اللون
              blurRadius: 40,
              spreadRadius: 0,
              offset: const Offset(10, 10),
            )
          ]),
          child: const Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AHandBag Lv',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$225',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 32,
          bottom: 100,
          child: Image.network(
            '',
            height: 85,
          ),
        ),
      ],
    );
  }
}
