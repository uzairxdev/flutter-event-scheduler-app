import 'package:flutter/material.dart';
import 'package:flutter_event_scheduler_app_getx/pages/choose_event_page.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              padding: const EdgeInsets.only(
                  top: 100, right: 40, left: 40, bottom: 50),
              decoration: BoxDecoration(color: Colors.red.shade100),
              width: double.infinity,
              child: Lottie.asset("assets/88146-event-venue.json"),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: Colors.red,
                    child: const Text(
                      'Schedule an event?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildShimmerRow(200, 130),
                  const SizedBox(height: 16),
                  buildShimmerRow(100, 200),
                  const SizedBox(height: 16),
                  buildShimmerRow(40, 200, extraWidth: 90),
                  const SizedBox(height: 30),
                  buildMaterialButton(context, "Today", ChooseEventPage()),
                  const SizedBox(height: 12),
                  buildMaterialButton(context, "Tomorrow"),
                  const SizedBox(height: 12),
                  buildMaterialButton(context, "Next week"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShimmerRow(double width1, double width2,
      {double extraWidth = 0}) {
    return Row(
      children: [
        buildShimmerBox(width1),
        const SizedBox(width: 10),
        buildShimmerBox(width2),
        if (extraWidth > 0) ...[
          const SizedBox(width: 10),
          buildShimmerBox(extraWidth),
        ],
      ],
    );
  }

  Widget buildShimmerBox(double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        padding: const EdgeInsets.all(8),
      ),
    );
  }

  Widget buildMaterialButton(BuildContext context, String text,
      [Widget? page]) {
    return MaterialButton(
      onPressed: () {
        if (page != null) {
          Get.to(() => page);
        }
      },
      height: 50,
      elevation: 0,
      highlightElevation: 0,
      minWidth: double.infinity,
      color: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
