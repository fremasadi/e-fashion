import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bag_controller.dart';

class BagView extends GetView<BagController> {
  const BagView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BagView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BagView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
