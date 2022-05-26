import 'dart:io';

import 'package:core/api/coal_api.dart';
import 'package:core/model/history/coal/coal_model.dart';
import 'package:core/model/history/coal/coal_response.dart';
import 'package:core/model/login_model.dart';
import 'package:core/model/state/coal_state.dart';
import 'package:core/providers.dart';
import 'package:core/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryCoalViewModel extends StateNotifier<CoalState> {
  HistoryCoalViewModel({required this.api, required this.helper})
      : super(const CoalState.dataLoading([])) {
    init();
  }

  final CoalClient api;
  final StorageHelper helper;

  List<CoalModel> _coalData = [];

  void init() {}

  Future<void> fetchCoal(DateTimeRange date) async {
    try {
      state = CoalState.dataLoading(_coalData);
      final userData = await helper.getDataUser();
      final companySite = await helper.getSite();
      final CoalResponse result = await api.getCoalData(
          token: userData!.data!.token!,
          companySiteId: int.parse(companySite!),
          startDate: date.start.toString(),
          endDate: date.end.toString());
      if (result.status == 0 && result.message != null) {
        state = CoalState.error(result.message.toString());
      } else if (result.status == 1 && result.data != null) {
        state = CoalState.data(_coalData = result.data!);
      } else {
        state = const CoalState.error('Terjadi kesalahan server');
      }
    } catch (e) {
      if (e is SocketException || e is WebSocketException || e is Exception) {
        state = const CoalState.error('Anda tidak terhubung ke internet');
      } else if (e is FormatException) {
        state = const CoalState.error('Terjadi kesalahan server');
      } else {
        state =
            const CoalState.error('Terjadi kesalahan mohon coba lagi nanti');
      }
      throw e.toString();
    }
  }
}
