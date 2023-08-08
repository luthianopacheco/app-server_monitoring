import 'package:da_ginga/model/service_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension ServiceModelExtension on ServiceModel {
  IconData get iconType {
    switch (type) {
      case TypeService.application:
        return Icons.touch_app_rounded;
      case TypeService.service:
        return Icons.miscellaneous_services;
      case TypeService.server:
        return Icons.computer;
      default:
        return Icons.error;
    }
  }

  String get statusText {
    switch (status) {
      case StatusService.online:
        return StatusService.online.name.capitalizeFirst!;
      case StatusService.offline:
        return StatusService.offline.name.capitalizeFirst!;
      case StatusService.unstable:
        return StatusService.unstable.name.capitalizeFirst!;
      default:
        return StatusService.unknown.name.capitalizeFirst!;
    }
  }

  MaterialColor get statusColor {
    switch (status) {
      case StatusService.online:
        return Colors.green;
      case StatusService.offline:
        return Colors.red;
      case StatusService.unstable:
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  String get typeText {
    switch (type) {
      case TypeService.application:
        return TypeService.application.name.capitalizeFirst!;
      case TypeService.service:
        return TypeService.service.name.capitalizeFirst!;
      case TypeService.server:
        return TypeService.server.name.capitalizeFirst!;
      case TypeService.unknown:
      default:
        return TypeService.unknown.name.capitalizeFirst!;
    }
  }

  String get formatedDate {
    final formated = DateFormat('dd/MM/yyyy, HH:mm').format(lastUpdate!);
    return formated;
  }
}
