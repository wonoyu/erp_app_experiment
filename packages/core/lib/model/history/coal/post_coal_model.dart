class PostCoalModel {
  PostCoalModel(
      {required this.shift,
      required this.jarak,
      required this.unitLoaderId,
      required this.planProdActivityId,
      required this.eventDate,
      required this.productivityProblemId,
      required this.desc,
      required this.multiHauler,
      required this.planProdMovingId});

  final String shift;
  final String jarak;
  final int unitLoaderId;
  final int planProdActivityId;
  final String eventDate;
  final String productivityProblemId;
  final String desc;
  final List<MultiHauler> multiHauler;
  final int planProdMovingId;

  factory PostCoalModel.fromJson(Map<String, dynamic> data) {
    final shift = data['shift'] as String;
    final jarak = data['jarak'] as String;
    final unitLoaderId = data['unit_loader_id'] as int;
    final planProdActivityId = data['plan_prod_activity_id'] as int;
    final eventDate = data['event_date'] as String;
    final productivityProblemId = data['productivity_problem_id'] as String;
    final desc = data['desc'] as String;
    final multiHaulerData = data['multiHauler'] as List<dynamic>?;
    final multiHauler = multiHaulerData != null
        ? multiHaulerData
            .map((haulerData) => MultiHauler.fromJson(haulerData))
            .toList()
        : <MultiHauler>[];
    final planProdMovingId = data['plan_prod_moving_id'] as int;
    return PostCoalModel(
      shift: shift,
      jarak: jarak,
      unitLoaderId: unitLoaderId,
      planProdActivityId: planProdActivityId,
      eventDate: eventDate,
      productivityProblemId: productivityProblemId,
      desc: desc,
      multiHauler: multiHauler,
      planProdMovingId: planProdMovingId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shift': shift,
      'jarak': jarak,
      'unit_loader_id': unitLoaderId,
      'plan_prod_activity_id': planProdActivityId,
      'event_date': eventDate,
      'productivity_problem_id': productivityProblemId,
      'desc': desc,
      'multiHauler': multiHauler.map((hauler) => hauler.toJson()).toList(),
      'plan_prod_moving_id': planProdMovingId,
    };
  }
}

class MultiHauler {
  MultiHauler(
      {required this.unitHaulerId, required this.rit, required this.totalBcm});

  final int unitHaulerId;
  final num rit;
  final num totalBcm;

  factory MultiHauler.fromJson(Map<String, dynamic> data) {
    final unitHaulerId = data['unit_hauler_id'] as int;
    final rit = data['rit'] as num;
    final totalBcm = data['total_bcm'] as num;
    return MultiHauler(
        unitHaulerId: unitHaulerId, rit: rit, totalBcm: totalBcm);
  }

  Map<String, dynamic> toJson() {
    return {
      'unit_hauler_id': unitHaulerId,
      'rit': rit,
      'total_bcm': totalBcm,
    };
  }
}
