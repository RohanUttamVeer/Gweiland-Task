import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gweiland_task/home_module/view/widgets/cryptoList.dart';
import '../../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 18, right: 18, top: 24, bottom: 20),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "EXCHANGES",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Badge(
                        child: Icon(
                          Icons.notifications_none,
                          size: 30,
                        ),
                        backgroundColor: Colors.yellow,
                        smallSize: 10,
                        alignment: Alignment.topRight,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.settings_outlined,
                        size: 30,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 250,
                    height: 40,
                    child: TextFormField(
                        controller: controller.search,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Search Cryptocurrency",
                        )),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    icon: Icon(
                      Icons.filter_list_rounded,
                      size: 24.0,
                    ),
                    label: Text('Filter'),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Cryptocurrency",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "NFT",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                color: Color.fromARGB(255, 234, 255, 227),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                // color: ,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 40, bottom: 20),
                      child: Row(
                        children: [
                          FlutterLogo(
                            size: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BTC",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Bitcoin",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$3,800 USD",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "+2.5%",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset("assets/cardImage.png")
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Cryptocurrencies",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CryptoList(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      //   child: NavigationBar(
      //     onDestinationSelected: (int index) {
      //       // setState(() {
      //       //   currentPageIndex = index;
      //       // });
      //     },
      //     indicatorColor: Colors.amber[800],
      //     selectedIndex: controller.currentPageIndex.value,
      //     destinations: const <Widget>[
      //       NavigationDestination(
      //         selectedIcon: Icon(Icons.home),
      //         icon: Icon(Icons.home_outlined),
      //         label: 'Home',
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.business),
      //         label: 'Business',
      //       ),
      //       NavigationDestination(
      //         selectedIcon: Icon(Icons.school),
      //         icon: Icon(Icons.school_outlined),
      //         label: 'School',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
