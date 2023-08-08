class ServiceModel {
  String? name;
  String? description;
  TypeService? type;
  StatusService? status;
  DateTime? lastUpdate;

  ServiceModel(
      {this.name, this.description, this.type, this.status, this.lastUpdate});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    type = responseTypeServiceMap[json['type']];
    status = responseStatusServiceMap[json['status']];
    lastUpdate = DateTime.parse(json['lastUpdate']);
  }
}

enum StatusService {
  online,
  unstable,
  offline,
  unknown,
}

Map<String, StatusService> responseStatusServiceMap = {
  'GREEN': StatusService.online,
  'YELLOW': StatusService.unstable,
  'RED': StatusService.offline,
};

enum TypeService {
  application,
  server,
  service,
  unknown,
}

Map<String, TypeService> responseTypeServiceMap = {
  'APPLICATION': TypeService.application,
  'SERVER': TypeService.server,
  'SERVICE': TypeService.service,
};
