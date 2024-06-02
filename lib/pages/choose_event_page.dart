import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/choose_event_controller.dart';

// ignore: use_key_in_widget_constructors
class ChooseEventPage extends StatelessWidget {
  final ChooseEventController controller = Get.put(ChooseEventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 120.0, right: 30, left: 30),
                child: Column(
                  children: [
                    Text(
                      "Choose Your Favorite Event",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                      child: Text(
                        "We will suggest events based on what you like",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.services.length,
                  itemBuilder: (BuildContext context, int index) {
                    return serviceContainer(controller.services[index], index);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: MaterialButton(
                  onPressed: () => {},
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.amber,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceContainer(String name, int index) {
    return GestureDetector(
      onTap: () {
        controller.selectService(index);
      },
      child: Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: controller.selectedService.value == index
                  ? Colors.amber.shade50
                  : Colors.grey.shade100,
              border: Border.all(
                color: controller.selectedService.value == index
                    ? Colors.amber
                    : Colors.blue.withOpacity(0),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: controller.selectedService.value == index
                        ? Colors.amber.shade800
                        : Colors.black,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
