import 'package:da_ginga/controllers.dart/services_controller.dart';
import 'package:da_ginga/model/model_extension/service_model_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicePage extends StatefulWidget {
  final ServiceController _controller;
  const ServicePage(this._controller, {super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Services',
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return widget._controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : widget._controller.serviceList.isEmpty
                  ? const Center(
                      child: Text("No service found! Please try again later!"),
                    )
                  : buildServicesListView();
        },
      ),
    );
  }

  Widget buildServicesListView() {
    return ListView.builder(
      itemCount: widget._controller.serviceList.length,
      itemBuilder: (context, index) {
        final item = widget._controller.serviceList[index];
        return ListTile(
          leading: Icon(item.iconType),
          title: Text(item.name!),
          subtitle: Text(item.formatedDate),
          trailing: Container(
            height: 20,
            width: 20,
            color: item.statusColor,
          ),
          onTap: () {
            Get.toNamed(
              'serviceDetails',
              arguments: index,
            );
          },
        );
      },
    );
  }
}
