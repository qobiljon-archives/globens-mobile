///
//  Generated code. Do not modify.
//  source: gb_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'gb_service.pb.dart' as $0;
export 'gb_service.pb.dart';

class GlobensServiceClient extends $grpc.Client {
  static final _$authenticateUser = $grpc.ClientMethod<$0.AuthenticateUser_Request, $0.AuthenticateUser_Response>('/GlobensService/authenticateUser', ($0.AuthenticateUser_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.AuthenticateUser_Response.fromBuffer(value));
  static final _$deactivateUser = $grpc.ClientMethod<$0.DeactivateUser_Request, $0.DeactivateUser_Response>('/GlobensService/deactivateUser', ($0.DeactivateUser_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.DeactivateUser_Response.fromBuffer(value));
  static final _$updateUserDetails = $grpc.ClientMethod<$0.UpdateUserDetails_Request, $0.UpdateUserDetails_Response>('/GlobensService/updateUserDetails', ($0.UpdateUserDetails_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.UpdateUserDetails_Response.fromBuffer(value));
  static final _$fetchUserDetails = $grpc.ClientMethod<$0.FetchUserDetails_Request, $0.FetchUserDetails_Response>('/GlobensService/fetchUserDetails', ($0.FetchUserDetails_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.FetchUserDetails_Response.fromBuffer(value));
  static final _$createVacancy = $grpc.ClientMethod<$0.CreateVacancy_Request, $0.CreateVacancy_Response>('/GlobensService/createVacancy', ($0.CreateVacancy_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.CreateVacancy_Response.fromBuffer(value));
  static final _$updateVacancyDetails =
      $grpc.ClientMethod<$0.UpdateVacancyDetails_Request, $0.UpdateVacancyDetails_Response>('/GlobensService/updateVacancyDetails', ($0.UpdateVacancyDetails_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.UpdateVacancyDetails_Response.fromBuffer(value));
  static final _$uncreateVacancy = $grpc.ClientMethod<$0.UncreateVacancy_Request, $0.UncreateVacancy_Response>('/GlobensService/uncreateVacancy', ($0.UncreateVacancy_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.UncreateVacancy_Response.fromBuffer(value));
  static final _$fetchVacancies = $grpc.ClientMethod<$0.FetchVacancies_Request, $0.FetchVacancies_Response>('/GlobensService/fetchVacancies', ($0.FetchVacancies_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.FetchVacancies_Response.fromBuffer(value));
  static final _$fetchVacancyDetails =
      $grpc.ClientMethod<$0.FetchVacancyDetails_Request, $0.FetchVacancyDetails_Response>('/GlobensService/fetchVacancyDetails', ($0.FetchVacancyDetails_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.FetchVacancyDetails_Response.fromBuffer(value));
  static final _$createVacancyApplication = $grpc.ClientMethod<$0.CreateVacancyApplication_Request, $0.CreateVacancyApplication_Response>(
      '/GlobensService/createVacancyApplication', ($0.CreateVacancyApplication_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.CreateVacancyApplication_Response.fromBuffer(value));
  static final _$updateVacancyApplicationDetails = $grpc.ClientMethod<$0.UpdateVacancyApplicationDetails_Request, $0.UpdateVacancyApplicationDetails_Response>(
      '/GlobensService/updateVacancyApplicationDetails', ($0.UpdateVacancyApplicationDetails_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.UpdateVacancyApplicationDetails_Response.fromBuffer(value));
  static final _$uncreateVacancyApplication = $grpc.ClientMethod<$0.UncreateVacancyApplication_Request, $0.UncreateVacancyApplication_Response>(
      '/GlobensService/uncreateVacancyApplication', ($0.UncreateVacancyApplication_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.UncreateVacancyApplication_Response.fromBuffer(value));
  static final _$fetchMyVacancyApplications = $grpc.ClientMethod<$0.FetchMyVacancyApplications_Request, $0.FetchMyVacancyApplications_Response>(
      '/GlobensService/fetchMyVacancyApplications', ($0.FetchMyVacancyApplications_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.FetchMyVacancyApplications_Response.fromBuffer(value));
  static final _$fetchVacancyApplicationDetails = $grpc.ClientMethod<$0.FetchVacancyApplicationDetails_Request, $0.FetchVacancyApplicationDetails_Response>(
      '/GlobensService/fetchVacancyApplicationDetails', ($0.FetchVacancyApplicationDetails_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.FetchVacancyApplicationDetails_Response.fromBuffer(value));
  static final _$createBusinessPage =
      $grpc.ClientMethod<$0.CreateBusinessPage_Request, $0.CreateBusinessPage_Response>('/GlobensService/createBusinessPage', ($0.CreateBusinessPage_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.CreateBusinessPage_Response.fromBuffer(value));
  static final _$updateBusinessPageDetails = $grpc.ClientMethod<$0.UpdateBusinessPageDetails_Request, $0.UpdateBusinessPageDetails_Response>(
      '/GlobensService/updateBusinessPageDetails', ($0.UpdateBusinessPageDetails_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.UpdateBusinessPageDetails_Response.fromBuffer(value));
  static final _$uncreateBusinessPage =
      $grpc.ClientMethod<$0.UncreateBusinessPage_Request, $0.UncreateBusinessPage_Response>('/GlobensService/uncreateBusinessPage', ($0.UncreateBusinessPage_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.UncreateBusinessPage_Response.fromBuffer(value));
  static final _$fetchBusinessPages =
      $grpc.ClientMethod<$0.FetchBusinessPages_Request, $0.FetchBusinessPages_Response>('/GlobensService/fetchBusinessPages', ($0.FetchBusinessPages_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.FetchBusinessPages_Response.fromBuffer(value));
  static final _$fetchBusinessPageDetails = $grpc.ClientMethod<$0.FetchBusinessPageDetails_Request, $0.FetchBusinessPageDetails_Response>(
      '/GlobensService/fetchBusinessPageDetails', ($0.FetchBusinessPageDetails_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.FetchBusinessPageDetails_Response.fromBuffer(value));
  static final _$createProduct = $grpc.ClientMethod<$0.CreateProduct_Request, $0.CreateProduct_Response>('/GlobensService/createProduct', ($0.CreateProduct_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.CreateProduct_Response.fromBuffer(value));
  static final _$updateProductDetails =
      $grpc.ClientMethod<$0.UpdateProductDetails_Request, $0.UpdateProductDetails_Response>('/GlobensService/updateProductDetails', ($0.UpdateProductDetails_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.UpdateProductDetails_Response.fromBuffer(value));
  static final _$publishProduct = $grpc.ClientMethod<$0.PublishProduct_Request, $0.PublishProduct_Response>('/GlobensService/publishProduct', ($0.PublishProduct_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.PublishProduct_Response.fromBuffer(value));
  static final _$unpublishProduct = $grpc.ClientMethod<$0.UnpublishProduct_Request, $0.UnpublishProduct_Response>('/GlobensService/unpublishProduct', ($0.UnpublishProduct_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.UnpublishProduct_Response.fromBuffer(value));
  static final _$uncreateProduct = $grpc.ClientMethod<$0.UncreateProduct_Request, $0.UncreateProduct_Response>('/GlobensService/uncreateProduct', ($0.UncreateProduct_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.UncreateProduct_Response.fromBuffer(value));
  static final _$fetchProducts = $grpc.ClientMethod<$0.FetchProducts_Request, $0.FetchProducts_Response>('/GlobensService/fetchProducts', ($0.FetchProducts_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.FetchProducts_Response.fromBuffer(value));
  static final _$fetchProductDetails =
      $grpc.ClientMethod<$0.FetchProductDetails_Request, $0.FetchProductDetails_Response>('/GlobensService/fetchProductDetails', ($0.FetchProductDetails_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.FetchProductDetails_Response.fromBuffer(value));
  static final _$logPurchase = $grpc.ClientMethod<$0.LogPurchase_Request, $0.LogPurchase_Response>('/GlobensService/logPurchase', ($0.LogPurchase_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.LogPurchase_Response.fromBuffer(value));
  static final _$fetchPurchases = $grpc.ClientMethod<$0.FetchPurchases_Request, $0.FetchPurchases_Response>('/GlobensService/fetchPurchases', ($0.FetchPurchases_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.FetchPurchases_Response.fromBuffer(value));
  static final _$fetchPurchaseDetails =
      $grpc.ClientMethod<$0.FetchPurchaseDetails_Request, $0.FetchPurchaseDetails_Response>('/GlobensService/fetchPurchaseDetails', ($0.FetchPurchaseDetails_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.FetchPurchaseDetails_Response.fromBuffer(value));
  static final _$testSum = $grpc.ClientMethod<$0.TestSum_Request, $0.TestSum_Response>('/GlobensService/testSum', ($0.TestSum_Request value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.TestSum_Response.fromBuffer(value));

  GlobensServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options}) : super(channel, options: options);

  $grpc.ResponseFuture<$0.AuthenticateUser_Response> authenticateUser($0.AuthenticateUser_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$authenticateUser, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.DeactivateUser_Response> deactivateUser($0.DeactivateUser_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$deactivateUser, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateUserDetails_Response> updateUserDetails($0.UpdateUserDetails_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$updateUserDetails, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchUserDetails_Response> fetchUserDetails($0.FetchUserDetails_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$fetchUserDetails, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.CreateVacancy_Response> createVacancy($0.CreateVacancy_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$createVacancy, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateVacancyDetails_Response> updateVacancyDetails($0.UpdateVacancyDetails_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$updateVacancyDetails, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UncreateVacancy_Response> uncreateVacancy($0.UncreateVacancy_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$uncreateVacancy, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchVacancies_Response> fetchVacancies($0.FetchVacancies_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$fetchVacancies, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchVacancyDetails_Response> fetchVacancyDetails($0.FetchVacancyDetails_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$fetchVacancyDetails, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.CreateVacancyApplication_Response> createVacancyApplication($0.CreateVacancyApplication_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$createVacancyApplication, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateVacancyApplicationDetails_Response> updateVacancyApplicationDetails($0.UpdateVacancyApplicationDetails_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$updateVacancyApplicationDetails, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UncreateVacancyApplication_Response> uncreateVacancyApplication($0.UncreateVacancyApplication_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$uncreateVacancyApplication, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchMyVacancyApplications_Response> fetchMyVacancyApplications($0.FetchMyVacancyApplications_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$fetchMyVacancyApplications, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchVacancyApplicationDetails_Response> fetchVacancyApplicationDetails($0.FetchVacancyApplicationDetails_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$fetchVacancyApplicationDetails, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.CreateBusinessPage_Response> createBusinessPage($0.CreateBusinessPage_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$createBusinessPage, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateBusinessPageDetails_Response> updateBusinessPageDetails($0.UpdateBusinessPageDetails_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$updateBusinessPageDetails, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UncreateBusinessPage_Response> uncreateBusinessPage($0.UncreateBusinessPage_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$uncreateBusinessPage, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchBusinessPages_Response> fetchBusinessPages($0.FetchBusinessPages_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$fetchBusinessPages, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchBusinessPageDetails_Response> fetchBusinessPageDetails($0.FetchBusinessPageDetails_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$fetchBusinessPageDetails, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.CreateProduct_Response> createProduct($0.CreateProduct_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$createProduct, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateProductDetails_Response> updateProductDetails($0.UpdateProductDetails_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$updateProductDetails, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.PublishProduct_Response> publishProduct($0.PublishProduct_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$publishProduct, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UnpublishProduct_Response> unpublishProduct($0.UnpublishProduct_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$unpublishProduct, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UncreateProduct_Response> uncreateProduct($0.UncreateProduct_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$uncreateProduct, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchProducts_Response> fetchProducts($0.FetchProducts_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$fetchProducts, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchProductDetails_Response> fetchProductDetails($0.FetchProductDetails_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$fetchProductDetails, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.LogPurchase_Response> logPurchase($0.LogPurchase_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$logPurchase, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchPurchases_Response> fetchPurchases($0.FetchPurchases_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$fetchPurchases, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchPurchaseDetails_Response> fetchPurchaseDetails($0.FetchPurchaseDetails_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$fetchPurchaseDetails, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.TestSum_Response> testSum($0.TestSum_Request request, {$grpc.CallOptions options}) {
    final call = $createCall(_$testSum, $async.Stream.fromIterable([request]), options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class GlobensServiceBase extends $grpc.Service {
  $core.String get $name => 'GlobensService';

  GlobensServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AuthenticateUser_Request, $0.AuthenticateUser_Response>('authenticateUser', authenticateUser_Pre, false, false, ($core.List<$core.int> value) => $0.AuthenticateUser_Request.fromBuffer(value), ($0.AuthenticateUser_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeactivateUser_Request, $0.DeactivateUser_Response>('deactivateUser', deactivateUser_Pre, false, false, ($core.List<$core.int> value) => $0.DeactivateUser_Request.fromBuffer(value), ($0.DeactivateUser_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateUserDetails_Request, $0.UpdateUserDetails_Response>('updateUserDetails', updateUserDetails_Pre, false, false, ($core.List<$core.int> value) => $0.UpdateUserDetails_Request.fromBuffer(value), ($0.UpdateUserDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchUserDetails_Request, $0.FetchUserDetails_Response>('fetchUserDetails', fetchUserDetails_Pre, false, false, ($core.List<$core.int> value) => $0.FetchUserDetails_Request.fromBuffer(value), ($0.FetchUserDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateVacancy_Request, $0.CreateVacancy_Response>('createVacancy', createVacancy_Pre, false, false, ($core.List<$core.int> value) => $0.CreateVacancy_Request.fromBuffer(value), ($0.CreateVacancy_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateVacancyDetails_Request, $0.UpdateVacancyDetails_Response>(
        'updateVacancyDetails', updateVacancyDetails_Pre, false, false, ($core.List<$core.int> value) => $0.UpdateVacancyDetails_Request.fromBuffer(value), ($0.UpdateVacancyDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UncreateVacancy_Request, $0.UncreateVacancy_Response>('uncreateVacancy', uncreateVacancy_Pre, false, false, ($core.List<$core.int> value) => $0.UncreateVacancy_Request.fromBuffer(value), ($0.UncreateVacancy_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchVacancies_Request, $0.FetchVacancies_Response>('fetchVacancies', fetchVacancies_Pre, false, false, ($core.List<$core.int> value) => $0.FetchVacancies_Request.fromBuffer(value), ($0.FetchVacancies_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchVacancyDetails_Request, $0.FetchVacancyDetails_Response>(
        'fetchVacancyDetails', fetchVacancyDetails_Pre, false, false, ($core.List<$core.int> value) => $0.FetchVacancyDetails_Request.fromBuffer(value), ($0.FetchVacancyDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateVacancyApplication_Request, $0.CreateVacancyApplication_Response>(
        'createVacancyApplication', createVacancyApplication_Pre, false, false, ($core.List<$core.int> value) => $0.CreateVacancyApplication_Request.fromBuffer(value), ($0.CreateVacancyApplication_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateVacancyApplicationDetails_Request, $0.UpdateVacancyApplicationDetails_Response>(
        'updateVacancyApplicationDetails', updateVacancyApplicationDetails_Pre, false, false, ($core.List<$core.int> value) => $0.UpdateVacancyApplicationDetails_Request.fromBuffer(value), ($0.UpdateVacancyApplicationDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UncreateVacancyApplication_Request, $0.UncreateVacancyApplication_Response>(
        'uncreateVacancyApplication', uncreateVacancyApplication_Pre, false, false, ($core.List<$core.int> value) => $0.UncreateVacancyApplication_Request.fromBuffer(value), ($0.UncreateVacancyApplication_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchMyVacancyApplications_Request, $0.FetchMyVacancyApplications_Response>(
        'fetchMyVacancyApplications', fetchMyVacancyApplications_Pre, false, false, ($core.List<$core.int> value) => $0.FetchMyVacancyApplications_Request.fromBuffer(value), ($0.FetchMyVacancyApplications_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchVacancyApplicationDetails_Request, $0.FetchVacancyApplicationDetails_Response>(
        'fetchVacancyApplicationDetails', fetchVacancyApplicationDetails_Pre, false, false, ($core.List<$core.int> value) => $0.FetchVacancyApplicationDetails_Request.fromBuffer(value), ($0.FetchVacancyApplicationDetails_Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CreateBusinessPage_Request, $0.CreateBusinessPage_Response>('createBusinessPage', createBusinessPage_Pre, false, false, ($core.List<$core.int> value) => $0.CreateBusinessPage_Request.fromBuffer(value), ($0.CreateBusinessPage_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateBusinessPageDetails_Request, $0.UpdateBusinessPageDetails_Response>(
        'updateBusinessPageDetails', updateBusinessPageDetails_Pre, false, false, ($core.List<$core.int> value) => $0.UpdateBusinessPageDetails_Request.fromBuffer(value), ($0.UpdateBusinessPageDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UncreateBusinessPage_Request, $0.UncreateBusinessPage_Response>(
        'uncreateBusinessPage', uncreateBusinessPage_Pre, false, false, ($core.List<$core.int> value) => $0.UncreateBusinessPage_Request.fromBuffer(value), ($0.UncreateBusinessPage_Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.FetchBusinessPages_Request, $0.FetchBusinessPages_Response>('fetchBusinessPages', fetchBusinessPages_Pre, false, false, ($core.List<$core.int> value) => $0.FetchBusinessPages_Request.fromBuffer(value), ($0.FetchBusinessPages_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchBusinessPageDetails_Request, $0.FetchBusinessPageDetails_Response>(
        'fetchBusinessPageDetails', fetchBusinessPageDetails_Pre, false, false, ($core.List<$core.int> value) => $0.FetchBusinessPageDetails_Request.fromBuffer(value), ($0.FetchBusinessPageDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateProduct_Request, $0.CreateProduct_Response>('createProduct', createProduct_Pre, false, false, ($core.List<$core.int> value) => $0.CreateProduct_Request.fromBuffer(value), ($0.CreateProduct_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateProductDetails_Request, $0.UpdateProductDetails_Response>(
        'updateProductDetails', updateProductDetails_Pre, false, false, ($core.List<$core.int> value) => $0.UpdateProductDetails_Request.fromBuffer(value), ($0.UpdateProductDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PublishProduct_Request, $0.PublishProduct_Response>('publishProduct', publishProduct_Pre, false, false, ($core.List<$core.int> value) => $0.PublishProduct_Request.fromBuffer(value), ($0.PublishProduct_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UnpublishProduct_Request, $0.UnpublishProduct_Response>('unpublishProduct', unpublishProduct_Pre, false, false, ($core.List<$core.int> value) => $0.UnpublishProduct_Request.fromBuffer(value), ($0.UnpublishProduct_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UncreateProduct_Request, $0.UncreateProduct_Response>('uncreateProduct', uncreateProduct_Pre, false, false, ($core.List<$core.int> value) => $0.UncreateProduct_Request.fromBuffer(value), ($0.UncreateProduct_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchProducts_Request, $0.FetchProducts_Response>('fetchProducts', fetchProducts_Pre, false, false, ($core.List<$core.int> value) => $0.FetchProducts_Request.fromBuffer(value), ($0.FetchProducts_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchProductDetails_Request, $0.FetchProductDetails_Response>(
        'fetchProductDetails', fetchProductDetails_Pre, false, false, ($core.List<$core.int> value) => $0.FetchProductDetails_Request.fromBuffer(value), ($0.FetchProductDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogPurchase_Request, $0.LogPurchase_Response>('logPurchase', logPurchase_Pre, false, false, ($core.List<$core.int> value) => $0.LogPurchase_Request.fromBuffer(value), ($0.LogPurchase_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchPurchases_Request, $0.FetchPurchases_Response>('fetchPurchases', fetchPurchases_Pre, false, false, ($core.List<$core.int> value) => $0.FetchPurchases_Request.fromBuffer(value), ($0.FetchPurchases_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchPurchaseDetails_Request, $0.FetchPurchaseDetails_Response>(
        'fetchPurchaseDetails', fetchPurchaseDetails_Pre, false, false, ($core.List<$core.int> value) => $0.FetchPurchaseDetails_Request.fromBuffer(value), ($0.FetchPurchaseDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TestSum_Request, $0.TestSum_Response>('testSum', testSum_Pre, false, false, ($core.List<$core.int> value) => $0.TestSum_Request.fromBuffer(value), ($0.TestSum_Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthenticateUser_Response> authenticateUser_Pre($grpc.ServiceCall call, $async.Future<$0.AuthenticateUser_Request> request) async {
    return authenticateUser(call, await request);
  }

  $async.Future<$0.DeactivateUser_Response> deactivateUser_Pre($grpc.ServiceCall call, $async.Future<$0.DeactivateUser_Request> request) async {
    return deactivateUser(call, await request);
  }

  $async.Future<$0.UpdateUserDetails_Response> updateUserDetails_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateUserDetails_Request> request) async {
    return updateUserDetails(call, await request);
  }

  $async.Future<$0.FetchUserDetails_Response> fetchUserDetails_Pre($grpc.ServiceCall call, $async.Future<$0.FetchUserDetails_Request> request) async {
    return fetchUserDetails(call, await request);
  }

  $async.Future<$0.CreateVacancy_Response> createVacancy_Pre($grpc.ServiceCall call, $async.Future<$0.CreateVacancy_Request> request) async {
    return createVacancy(call, await request);
  }

  $async.Future<$0.UpdateVacancyDetails_Response> updateVacancyDetails_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateVacancyDetails_Request> request) async {
    return updateVacancyDetails(call, await request);
  }

  $async.Future<$0.UncreateVacancy_Response> uncreateVacancy_Pre($grpc.ServiceCall call, $async.Future<$0.UncreateVacancy_Request> request) async {
    return uncreateVacancy(call, await request);
  }

  $async.Future<$0.FetchVacancies_Response> fetchVacancies_Pre($grpc.ServiceCall call, $async.Future<$0.FetchVacancies_Request> request) async {
    return fetchVacancies(call, await request);
  }

  $async.Future<$0.FetchVacancyDetails_Response> fetchVacancyDetails_Pre($grpc.ServiceCall call, $async.Future<$0.FetchVacancyDetails_Request> request) async {
    return fetchVacancyDetails(call, await request);
  }

  $async.Future<$0.CreateVacancyApplication_Response> createVacancyApplication_Pre($grpc.ServiceCall call, $async.Future<$0.CreateVacancyApplication_Request> request) async {
    return createVacancyApplication(call, await request);
  }

  $async.Future<$0.UpdateVacancyApplicationDetails_Response> updateVacancyApplicationDetails_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateVacancyApplicationDetails_Request> request) async {
    return updateVacancyApplicationDetails(call, await request);
  }

  $async.Future<$0.UncreateVacancyApplication_Response> uncreateVacancyApplication_Pre($grpc.ServiceCall call, $async.Future<$0.UncreateVacancyApplication_Request> request) async {
    return uncreateVacancyApplication(call, await request);
  }

  $async.Future<$0.FetchMyVacancyApplications_Response> fetchMyVacancyApplications_Pre($grpc.ServiceCall call, $async.Future<$0.FetchMyVacancyApplications_Request> request) async {
    return fetchMyVacancyApplications(call, await request);
  }

  $async.Future<$0.FetchVacancyApplicationDetails_Response> fetchVacancyApplicationDetails_Pre($grpc.ServiceCall call, $async.Future<$0.FetchVacancyApplicationDetails_Request> request) async {
    return fetchVacancyApplicationDetails(call, await request);
  }

  $async.Future<$0.CreateBusinessPage_Response> createBusinessPage_Pre($grpc.ServiceCall call, $async.Future<$0.CreateBusinessPage_Request> request) async {
    return createBusinessPage(call, await request);
  }

  $async.Future<$0.UpdateBusinessPageDetails_Response> updateBusinessPageDetails_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateBusinessPageDetails_Request> request) async {
    return updateBusinessPageDetails(call, await request);
  }

  $async.Future<$0.UncreateBusinessPage_Response> uncreateBusinessPage_Pre($grpc.ServiceCall call, $async.Future<$0.UncreateBusinessPage_Request> request) async {
    return uncreateBusinessPage(call, await request);
  }

  $async.Future<$0.FetchBusinessPages_Response> fetchBusinessPages_Pre($grpc.ServiceCall call, $async.Future<$0.FetchBusinessPages_Request> request) async {
    return fetchBusinessPages(call, await request);
  }

  $async.Future<$0.FetchBusinessPageDetails_Response> fetchBusinessPageDetails_Pre($grpc.ServiceCall call, $async.Future<$0.FetchBusinessPageDetails_Request> request) async {
    return fetchBusinessPageDetails(call, await request);
  }

  $async.Future<$0.CreateProduct_Response> createProduct_Pre($grpc.ServiceCall call, $async.Future<$0.CreateProduct_Request> request) async {
    return createProduct(call, await request);
  }

  $async.Future<$0.UpdateProductDetails_Response> updateProductDetails_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateProductDetails_Request> request) async {
    return updateProductDetails(call, await request);
  }

  $async.Future<$0.PublishProduct_Response> publishProduct_Pre($grpc.ServiceCall call, $async.Future<$0.PublishProduct_Request> request) async {
    return publishProduct(call, await request);
  }

  $async.Future<$0.UnpublishProduct_Response> unpublishProduct_Pre($grpc.ServiceCall call, $async.Future<$0.UnpublishProduct_Request> request) async {
    return unpublishProduct(call, await request);
  }

  $async.Future<$0.UncreateProduct_Response> uncreateProduct_Pre($grpc.ServiceCall call, $async.Future<$0.UncreateProduct_Request> request) async {
    return uncreateProduct(call, await request);
  }

  $async.Future<$0.FetchProducts_Response> fetchProducts_Pre($grpc.ServiceCall call, $async.Future<$0.FetchProducts_Request> request) async {
    return fetchProducts(call, await request);
  }

  $async.Future<$0.FetchProductDetails_Response> fetchProductDetails_Pre($grpc.ServiceCall call, $async.Future<$0.FetchProductDetails_Request> request) async {
    return fetchProductDetails(call, await request);
  }

  $async.Future<$0.LogPurchase_Response> logPurchase_Pre($grpc.ServiceCall call, $async.Future<$0.LogPurchase_Request> request) async {
    return logPurchase(call, await request);
  }

  $async.Future<$0.FetchPurchases_Response> fetchPurchases_Pre($grpc.ServiceCall call, $async.Future<$0.FetchPurchases_Request> request) async {
    return fetchPurchases(call, await request);
  }

  $async.Future<$0.FetchPurchaseDetails_Response> fetchPurchaseDetails_Pre($grpc.ServiceCall call, $async.Future<$0.FetchPurchaseDetails_Request> request) async {
    return fetchPurchaseDetails(call, await request);
  }

  $async.Future<$0.TestSum_Response> testSum_Pre($grpc.ServiceCall call, $async.Future<$0.TestSum_Request> request) async {
    return testSum(call, await request);
  }

  $async.Future<$0.AuthenticateUser_Response> authenticateUser($grpc.ServiceCall call, $0.AuthenticateUser_Request request);

  $async.Future<$0.DeactivateUser_Response> deactivateUser($grpc.ServiceCall call, $0.DeactivateUser_Request request);

  $async.Future<$0.UpdateUserDetails_Response> updateUserDetails($grpc.ServiceCall call, $0.UpdateUserDetails_Request request);

  $async.Future<$0.FetchUserDetails_Response> fetchUserDetails($grpc.ServiceCall call, $0.FetchUserDetails_Request request);

  $async.Future<$0.CreateVacancy_Response> createVacancy($grpc.ServiceCall call, $0.CreateVacancy_Request request);

  $async.Future<$0.UpdateVacancyDetails_Response> updateVacancyDetails($grpc.ServiceCall call, $0.UpdateVacancyDetails_Request request);

  $async.Future<$0.UncreateVacancy_Response> uncreateVacancy($grpc.ServiceCall call, $0.UncreateVacancy_Request request);

  $async.Future<$0.FetchVacancies_Response> fetchVacancies($grpc.ServiceCall call, $0.FetchVacancies_Request request);

  $async.Future<$0.FetchVacancyDetails_Response> fetchVacancyDetails($grpc.ServiceCall call, $0.FetchVacancyDetails_Request request);

  $async.Future<$0.CreateVacancyApplication_Response> createVacancyApplication($grpc.ServiceCall call, $0.CreateVacancyApplication_Request request);

  $async.Future<$0.UpdateVacancyApplicationDetails_Response> updateVacancyApplicationDetails($grpc.ServiceCall call, $0.UpdateVacancyApplicationDetails_Request request);

  $async.Future<$0.UncreateVacancyApplication_Response> uncreateVacancyApplication($grpc.ServiceCall call, $0.UncreateVacancyApplication_Request request);

  $async.Future<$0.FetchMyVacancyApplications_Response> fetchMyVacancyApplications($grpc.ServiceCall call, $0.FetchMyVacancyApplications_Request request);

  $async.Future<$0.FetchVacancyApplicationDetails_Response> fetchVacancyApplicationDetails($grpc.ServiceCall call, $0.FetchVacancyApplicationDetails_Request request);

  $async.Future<$0.CreateBusinessPage_Response> createBusinessPage($grpc.ServiceCall call, $0.CreateBusinessPage_Request request);

  $async.Future<$0.UpdateBusinessPageDetails_Response> updateBusinessPageDetails($grpc.ServiceCall call, $0.UpdateBusinessPageDetails_Request request);

  $async.Future<$0.UncreateBusinessPage_Response> uncreateBusinessPage($grpc.ServiceCall call, $0.UncreateBusinessPage_Request request);

  $async.Future<$0.FetchBusinessPages_Response> fetchBusinessPages($grpc.ServiceCall call, $0.FetchBusinessPages_Request request);

  $async.Future<$0.FetchBusinessPageDetails_Response> fetchBusinessPageDetails($grpc.ServiceCall call, $0.FetchBusinessPageDetails_Request request);

  $async.Future<$0.CreateProduct_Response> createProduct($grpc.ServiceCall call, $0.CreateProduct_Request request);

  $async.Future<$0.UpdateProductDetails_Response> updateProductDetails($grpc.ServiceCall call, $0.UpdateProductDetails_Request request);

  $async.Future<$0.PublishProduct_Response> publishProduct($grpc.ServiceCall call, $0.PublishProduct_Request request);

  $async.Future<$0.UnpublishProduct_Response> unpublishProduct($grpc.ServiceCall call, $0.UnpublishProduct_Request request);

  $async.Future<$0.UncreateProduct_Response> uncreateProduct($grpc.ServiceCall call, $0.UncreateProduct_Request request);

  $async.Future<$0.FetchProducts_Response> fetchProducts($grpc.ServiceCall call, $0.FetchProducts_Request request);

  $async.Future<$0.FetchProductDetails_Response> fetchProductDetails($grpc.ServiceCall call, $0.FetchProductDetails_Request request);

  $async.Future<$0.LogPurchase_Response> logPurchase($grpc.ServiceCall call, $0.LogPurchase_Request request);

  $async.Future<$0.FetchPurchases_Response> fetchPurchases($grpc.ServiceCall call, $0.FetchPurchases_Request request);

  $async.Future<$0.FetchPurchaseDetails_Response> fetchPurchaseDetails($grpc.ServiceCall call, $0.FetchPurchaseDetails_Request request);

  $async.Future<$0.TestSum_Response> testSum($grpc.ServiceCall call, $0.TestSum_Request request);
}
