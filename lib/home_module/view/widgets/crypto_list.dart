import 'package:flutter/material.dart';

class CryptoList extends StatelessWidget {
  var controller;
  CryptoList({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.cryptoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: [
                Image.network(
                  controller.cryptoList[index].logo,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.cryptoList[index].symbol,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.cryptoList[index].name,
                      style: TextStyle(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 95, 95, 95)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Image.asset(
                  controller.cryptoList[index].percent <= 0
                      ? "assets/low.png"
                      : "assets/high.png",
                  width: 70,
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$${controller.cryptoList[index].price.toInt()} USD",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${double.parse(controller.cryptoList[index].percent.toStringAsFixed(2))} %",
                      style: TextStyle(
                          fontSize: 15,
                          color: controller.cryptoList[index].percent <= 0
                              ? Colors.red
                              : Colors.green,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
