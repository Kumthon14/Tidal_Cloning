import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../constant/constant.dart';

class EssentialWidget extends StatelessWidget {
  const EssentialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //Row 1
            children: [
              Text(
                'Albums',
                style: textSubTitle,
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(137, 31, 31, 31),
                  ),
                  child: Icon(
                    IconlyLight.arrow_right_2,
                    size: 18,
                    weight: 20,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Container(
                  width: (MediaQuery.of(context).size.width / 5 * 3) - 20,
                  height: (MediaQuery.of(context).size.width / 5 * 3) - 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('assets/images/St.Chroma.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      width:
                          (MediaQuery.of(context).size.width / 5 * 1.53) - 20,
                      height:
                          (MediaQuery.of(context).size.width / 5 * 1.53) - 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/BIRDSOFAFEATHER.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      width:
                          (MediaQuery.of(context).size.width / 5 * 1.53) - 20,
                      height:
                          (MediaQuery.of(context).size.width / 5 * 1.53) - 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage('assets/images/luther.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
