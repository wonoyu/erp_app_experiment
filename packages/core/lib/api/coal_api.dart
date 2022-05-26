import 'dart:convert';

import 'package:core/constants/url_constants.dart';
import 'package:core/model/history/coal/coal_response.dart';
import 'package:core/model/history/coal/hauler_model.dart';
import 'package:core/model/history/coal/loader_model.dart';
import 'package:core/model/history/coal/plan_prod_activity_model.dart';
import 'package:core/model/history/coal/post_coal_model.dart';
import 'package:core/model/history/coal/problem_model.dart';
import 'package:core/utils/network_handler.dart';
import 'package:http/http.dart' as http;

class CoalApi {
  static Uri coalUri(int companySiteId, String startDate, String endDate) {
    return Uri(
      scheme: scheme,
      host: baseUrl,
      path: getProCoal,
      queryParameters: {
        'site': '$companySiteId',
        'startDate': startDate,
        'endDate': endDate,
        'plan_prod_moving_id': '1',
      },
    );
  }

  static Uri planProdUri(String token) {
    return Uri(
      scheme: scheme,
      host: baseUrl,
      path: proActivity,
    );
  }

  static Uri loaderUri(String token) {
    return Uri(
      scheme: scheme,
      host: baseUrl,
      path: loader,
    );
  }

  static Uri haulerUri(String token) {
    return Uri(
      scheme: scheme,
      host: baseUrl,
      path: hauler,
    );
  }

  static Uri problemUri(String token) {
    return Uri(
      scheme: scheme,
      host: baseUrl,
      path: problem,
    );
  }

  static Uri postPlanCoalUri(int companySiteId) {
    return Uri(
      scheme: scheme,
      host: baseUrl,
      path: savePlanCoalUrl,
      queryParameters: {
        'site': '$companySiteId',
      },
    );
  }

  static Uri postCoalUri(int companySiteId) {
    return Uri(
      scheme: scheme,
      host: baseUrl,
      path: saveProCoal,
      queryParameters: {
        'site': '$companySiteId',
      },
    );
  }

  static Map<String, String> headers(String token) {
    return {
      'Authorization': 'Bearer $token',
    };
  }

  static Map<String, String> headersWithType(String token) {
    return {
      'Authorization': 'Bearer $token',
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static Map<String, dynamic> body(String eventDate, num plan) {
    return {
      'plan': '$plan',
      'event_date': eventDate,
      'plan_prod_moving_id': '1',
    };
  }

  static Map<String, dynamic> bodyPostCoal(Map<String, dynamic> postCoalModel) {
    postCoalModel['multiHauler'].map((hauler) => hauler.toJson()).toList();
    return postCoalModel;
  }
}

class CoalClient {
  Future<CoalResponse> getCoalData(
      {required String token,
      required int companySiteId,
      required String startDate,
      required String endDate}) async {
    final response = await http.get(
        CoalApi.coalUri(companySiteId, startDate, endDate),
        headers: CoalApi.headers(token));
    return CoalResponse.fromJson(NetworkHandler.apiResponse(response));
  }

  Future<PlanProdResponse> getPlanProd({
    required String token,
  }) async {
    final response = await http.get(CoalApi.planProdUri(token),
        headers: CoalApi.headers(token));
    return PlanProdResponse.fromJson(NetworkHandler.apiResponse(response));
  }

  Future<LoaderResponse> getLoader({
    required String token,
  }) async {
    final response = await http.get(CoalApi.loaderUri(token),
        headers: CoalApi.headers(token));
    return LoaderResponse.fromJson(NetworkHandler.apiResponse(response));
  }

  Future<HaulerResponse> getHauler({
    required String token,
  }) async {
    final response = await http.get(CoalApi.haulerUri(token),
        headers: CoalApi.headers(token));
    return HaulerResponse.fromJson(NetworkHandler.apiResponse(response));
  }

  Future<ProblemResponse> getProblem({
    required String token,
  }) async {
    final response = await http.get(CoalApi.problemUri(token),
        headers: CoalApi.headers(token));
    return ProblemResponse.fromJson(NetworkHandler.apiResponse(response));
  }

  Future<CoalResponse> postPlanCoal(
      {required String token,
      required int companySiteId,
      required String eventDate,
      required num plan}) async {
    final response = await http.post(CoalApi.postPlanCoalUri(companySiteId),
        headers: CoalApi.headers(token), body: CoalApi.body(eventDate, plan));
    return CoalResponse.fromJson(NetworkHandler.apiResponse(response));
  }

  Future<CoalResponse> postCoal(
      {required PostCoalModel postCoalModel,
      required String token,
      required int companySiteId}) async {
    final response = await http.post(CoalApi.postCoalUri(companySiteId),
        headers: CoalApi.headersWithType(token),
        body: jsonEncode(postCoalModel.toJson()));
    return CoalResponse.fromJson(NetworkHandler.apiResponse(response));
  }
}
