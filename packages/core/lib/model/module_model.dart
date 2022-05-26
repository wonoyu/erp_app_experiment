class ModuleResponse {
  ModuleResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<ModuleModel>? data;

  factory ModuleResponse.fromJson(Map<String, dynamic> json) {
    final status = json['status'] as int;
    final message = json['message'] as String?;
    final moduleData = json['data'] as List<dynamic>?;
    final dataModule = moduleData != null
        ? moduleData.map((dat) => ModuleModel.fromJson(dat)).toList()
        : <ModuleModel>[];
    return ModuleResponse(
      status: status,
      message: message,
      data: dataModule,
    );
  }
}

class ModuleModel {
  ModuleModel({
    this.moduleId,
    this.moduleName,
    this.subModuleData,
  });

  int? moduleId;
  String? moduleName;
  String? subModuleData;

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    final moduleId = json['module_id'] as int;
    final moduleName = json['module_name'] as String;
    final subModuledata = json['sub_module_data'] as String;
    return ModuleModel(
      moduleId: moduleId,
      moduleName: moduleName,
      subModuleData: subModuledata,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'module_id': moduleId,
      'module_name': moduleName,
      'sub_module_data': subModuleData,
    };
  }
}
