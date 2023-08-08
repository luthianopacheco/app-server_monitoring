import 'package:da_ginga/controllers.dart/service_details_controller.dart';
import 'package:da_ginga/model/model_extension/service_model_extension.dart';
import 'package:da_ginga/model/service_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailsPage extends StatefulWidget {
  final ServiceDetailsController _controller;
  ServiceDetailsPage(this._controller, {super.key});

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  late final ServiceModel item;

  @override
  void initState() {
    widget._controller.getByIndex(Get.arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Service Details',
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return widget._controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : widget._controller.selectedService == null
                  ? const Center(
                      child: Text('Failed to load data!'),
                    )
                  : buildDetailsCard();
        },
      ),
    );
  }

  Widget buildDetailsCard() {
    item = widget._controller.selectedService as ServiceModel;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  item.iconType,
                  size: 60,
                ),
                title: Text(
                  item.name!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(item.description!),
              ),
              ListTile(
                title: const Text(
                  "Type: ",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Text(
                  item.typeText,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              ListTile(
                title: const Text(
                  "Status: ",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.statusText,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 12,
                      height: 12,
                      color: item.statusColor,
                    )
                  ],
                ),
              ),
              ListTile(
                title: const Text(
                  "Last Update: ",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Text(
                  item.formatedDate,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Center(
                child: FilledButton(
                  onPressed:
                      null, // TODO: implement _controller.restartService();
                  child: Text(
                    'Restart ${item.typeText}',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
