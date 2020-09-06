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
  static final _$authenticateUser = $grpc.ClientMethod<
          $0.AuthenticateUser_Request, $0.AuthenticateUser_Response>(
      '/GlobensService/authenticateUser',
      ($0.AuthenticateUser_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.AuthenticateUser_Response.fromBuffer(value));
  static final _$deactivateUser =
      $grpc.ClientMethod<$0.DeactivateUser_Request, $0.DeactivateUser_Response>(
          '/GlobensService/deactivateUser',
          ($0.DeactivateUser_Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeactivateUser_Response.fromBuffer(value));
  static final _$updateUserDetails = $grpc.ClientMethod<
          $0.UpdateUserDetails_Request, $0.UpdateUserDetails_Response>(
      '/GlobensService/updateUserDetails',
      ($0.UpdateUserDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdateUserDetails_Response.fromBuffer(value));
  static final _$fetchUserDetails = $grpc.ClientMethod<
          $0.FetchUserDetails_Request, $0.FetchUserDetails_Response>(
      '/GlobensService/fetchUserDetails',
      ($0.FetchUserDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchUserDetails_Response.fromBuffer(value));
  static final _$createVacantJob = $grpc.ClientMethod<
          $0.CreateVacantJob_Request, $0.CreateVacantJob_Response>(
      '/GlobensService/createVacantJob',
      ($0.CreateVacantJob_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CreateVacantJob_Response.fromBuffer(value));
  static final _$updateJobDetails = $grpc.ClientMethod<
          $0.UpdateJobDetails_Request, $0.UpdateJobDetails_Response>(
      '/GlobensService/updateJobDetails',
      ($0.UpdateJobDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdateJobDetails_Response.fromBuffer(value));
  static final _$uncreateJob =
      $grpc.ClientMethod<$0.UncreateJob_Request, $0.UncreateJob_Response>(
          '/GlobensService/uncreateJob',
          ($0.UncreateJob_Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UncreateJob_Response.fromBuffer(value));
  static final _$fetchBusinessPageJobIds = $grpc.ClientMethod<
          $0.FetchBusinessPageJobIds_Request,
          $0.FetchBusinessPageJobIds_Response>(
      '/GlobensService/fetchBusinessPageJobIds',
      ($0.FetchBusinessPageJobIds_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchBusinessPageJobIds_Response.fromBuffer(value));
  static final _$fetchNextKVacantJobIds = $grpc.ClientMethod<
          $0.FetchNextKVacantJobIds_Request,
          $0.FetchNextKVacantJobIds_Response>(
      '/GlobensService/fetchNextKVacantJobIds',
      ($0.FetchNextKVacantJobIds_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchNextKVacantJobIds_Response.fromBuffer(value));
  static final _$fetchJobDetails = $grpc.ClientMethod<
          $0.FetchJobDetails_Request, $0.FetchJobDetails_Response>(
      '/GlobensService/fetchJobDetails',
      ($0.FetchJobDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchJobDetails_Response.fromBuffer(value));
  static final _$createVacancyApplication = $grpc.ClientMethod<
          $0.CreateVacancyApplication_Request,
          $0.CreateVacancyApplication_Response>(
      '/GlobensService/createVacancyApplication',
      ($0.CreateVacancyApplication_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CreateVacancyApplication_Response.fromBuffer(value));
  static final _$updateVacancyApplicationDetails = $grpc.ClientMethod<
          $0.UpdateVacancyApplicationDetails_Request,
          $0.UpdateVacancyApplicationDetails_Response>(
      '/GlobensService/updateVacancyApplicationDetails',
      ($0.UpdateVacancyApplicationDetails_Request value) =>
          value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdateVacancyApplicationDetails_Response.fromBuffer(value));
  static final _$uncreateVacancyApplication = $grpc.ClientMethod<
          $0.UncreateVacancyApplication_Request,
          $0.UncreateVacancyApplication_Response>(
      '/GlobensService/uncreateVacancyApplication',
      ($0.UncreateVacancyApplication_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UncreateVacancyApplication_Response.fromBuffer(value));
  static final _$fetchMyVacancyApplicationIds = $grpc.ClientMethod<
          $0.FetchMyVacancyApplicationIds_Request,
          $0.FetchMyVacancyApplicationIds_Response>(
      '/GlobensService/fetchMyVacancyApplicationIds',
      ($0.FetchMyVacancyApplicationIds_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchMyVacancyApplicationIds_Response.fromBuffer(value));
  static final _$fetchVacancyApplicationDetails = $grpc.ClientMethod<
          $0.FetchVacancyApplicationDetails_Request,
          $0.FetchVacancyApplicationDetails_Response>(
      '/GlobensService/fetchVacancyApplicationDetails',
      ($0.FetchVacancyApplicationDetails_Request value) =>
          value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchVacancyApplicationDetails_Response.fromBuffer(value));
  static final _$createBusinessPage = $grpc.ClientMethod<
          $0.CreateBusinessPage_Request, $0.CreateBusinessPage_Response>(
      '/GlobensService/createBusinessPage',
      ($0.CreateBusinessPage_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CreateBusinessPage_Response.fromBuffer(value));
  static final _$updateBusinessPageDetails = $grpc.ClientMethod<
          $0.UpdateBusinessPageDetails_Request,
          $0.UpdateBusinessPageDetails_Response>(
      '/GlobensService/updateBusinessPageDetails',
      ($0.UpdateBusinessPageDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdateBusinessPageDetails_Response.fromBuffer(value));
  static final _$uncreateBusinessPage = $grpc.ClientMethod<
          $0.UncreateBusinessPage_Request, $0.UncreateBusinessPage_Response>(
      '/GlobensService/uncreateBusinessPage',
      ($0.UncreateBusinessPage_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UncreateBusinessPage_Response.fromBuffer(value));
  static final _$fetchMyBusinessPageIds = $grpc.ClientMethod<
          $0.FetchMyBusinessPageIds_Request,
          $0.FetchMyBusinessPageIds_Response>(
      '/GlobensService/fetchMyBusinessPageIds',
      ($0.FetchMyBusinessPageIds_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchMyBusinessPageIds_Response.fromBuffer(value));
  static final _$fetchBusinessPageDetails = $grpc.ClientMethod<
          $0.FetchBusinessPageDetails_Request,
          $0.FetchBusinessPageDetails_Response>(
      '/GlobensService/fetchBusinessPageDetails',
      ($0.FetchBusinessPageDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchBusinessPageDetails_Response.fromBuffer(value));
  static final _$createProduct =
      $grpc.ClientMethod<$0.CreateProduct_Request, $0.CreateProduct_Response>(
          '/GlobensService/createProduct',
          ($0.CreateProduct_Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateProduct_Response.fromBuffer(value));
  static final _$updateProductDetails = $grpc.ClientMethod<
          $0.UpdateProductDetails_Request, $0.UpdateProductDetails_Response>(
      '/GlobensService/updateProductDetails',
      ($0.UpdateProductDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdateProductDetails_Response.fromBuffer(value));
  static final _$publishProduct =
      $grpc.ClientMethod<$0.PublishProduct_Request, $0.PublishProduct_Response>(
          '/GlobensService/publishProduct',
          ($0.PublishProduct_Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.PublishProduct_Response.fromBuffer(value));
  static final _$unpublishProduct = $grpc.ClientMethod<
          $0.UnpublishProduct_Request, $0.UnpublishProduct_Response>(
      '/GlobensService/unpublishProduct',
      ($0.UnpublishProduct_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UnpublishProduct_Response.fromBuffer(value));
  static final _$uncreateProduct = $grpc.ClientMethod<
          $0.UncreateProduct_Request, $0.UncreateProduct_Response>(
      '/GlobensService/uncreateProduct',
      ($0.UncreateProduct_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UncreateProduct_Response.fromBuffer(value));
  static final _$fetchBusinessPageProductIds = $grpc.ClientMethod<
          $0.FetchBusinessPageProductIds_Request,
          $0.FetchBusinessPageProductIds_Response>(
      '/GlobensService/fetchBusinessPageProductIds',
      ($0.FetchBusinessPageProductIds_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchBusinessPageProductIds_Response.fromBuffer(value));
  static final _$fetchProductDetails = $grpc.ClientMethod<
          $0.FetchProductDetails_Request, $0.FetchProductDetails_Response>(
      '/GlobensService/fetchProductDetails',
      ($0.FetchProductDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchProductDetails_Response.fromBuffer(value));
  static final _$logPurchase =
      $grpc.ClientMethod<$0.LogPurchase_Request, $0.LogPurchase_Response>(
          '/GlobensService/logPurchase',
          ($0.LogPurchase_Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LogPurchase_Response.fromBuffer(value));
  static final _$fetchPurchases =
      $grpc.ClientMethod<$0.FetchPurchases_Request, $0.FetchPurchases_Response>(
          '/GlobensService/fetchPurchases',
          ($0.FetchPurchases_Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.FetchPurchases_Response.fromBuffer(value));
  static final _$fetchPurchaseDetails = $grpc.ClientMethod<
          $0.FetchPurchaseDetails_Request, $0.FetchPurchaseDetails_Response>(
      '/GlobensService/fetchPurchaseDetails',
      ($0.FetchPurchaseDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchPurchaseDetails_Response.fromBuffer(value));

  GlobensServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.AuthenticateUser_Response> authenticateUser(
      $0.AuthenticateUser_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$authenticateUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.DeactivateUser_Response> deactivateUser(
      $0.DeactivateUser_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$deactivateUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateUserDetails_Response> updateUserDetails(
      $0.UpdateUserDetails_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateUserDetails, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchUserDetails_Response> fetchUserDetails(
      $0.FetchUserDetails_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchUserDetails, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.CreateVacantJob_Response> createVacantJob(
      $0.CreateVacantJob_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createVacantJob, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateJobDetails_Response> updateJobDetails(
      $0.UpdateJobDetails_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateJobDetails, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UncreateJob_Response> uncreateJob(
      $0.UncreateJob_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$uncreateJob, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchBusinessPageJobIds_Response>
      fetchBusinessPageJobIds($0.FetchBusinessPageJobIds_Request request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchBusinessPageJobIds, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchNextKVacantJobIds_Response>
      fetchNextKVacantJobIds($0.FetchNextKVacantJobIds_Request request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchNextKVacantJobIds, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchJobDetails_Response> fetchJobDetails(
      $0.FetchJobDetails_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchJobDetails, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.CreateVacancyApplication_Response>
      createVacancyApplication($0.CreateVacancyApplication_Request request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createVacancyApplication, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateVacancyApplicationDetails_Response>
      updateVacancyApplicationDetails(
          $0.UpdateVacancyApplicationDetails_Request request,
          {$grpc.CallOptions options}) {
    final call = $createCall(_$updateVacancyApplicationDetails,
        $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UncreateVacancyApplication_Response>
      uncreateVacancyApplication($0.UncreateVacancyApplication_Request request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$uncreateVacancyApplication, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchMyVacancyApplicationIds_Response>
      fetchMyVacancyApplicationIds(
          $0.FetchMyVacancyApplicationIds_Request request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchMyVacancyApplicationIds, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchVacancyApplicationDetails_Response>
      fetchVacancyApplicationDetails(
          $0.FetchVacancyApplicationDetails_Request request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchVacancyApplicationDetails, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.CreateBusinessPage_Response> createBusinessPage(
      $0.CreateBusinessPage_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createBusinessPage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateBusinessPageDetails_Response>
      updateBusinessPageDetails($0.UpdateBusinessPageDetails_Request request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateBusinessPageDetails, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UncreateBusinessPage_Response> uncreateBusinessPage(
      $0.UncreateBusinessPage_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$uncreateBusinessPage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchMyBusinessPageIds_Response>
      fetchMyBusinessPageIds($0.FetchMyBusinessPageIds_Request request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchMyBusinessPageIds, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchBusinessPageDetails_Response>
      fetchBusinessPageDetails($0.FetchBusinessPageDetails_Request request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchBusinessPageDetails, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.CreateProduct_Response> createProduct(
      $0.CreateProduct_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createProduct, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateProductDetails_Response> updateProductDetails(
      $0.UpdateProductDetails_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateProductDetails, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.PublishProduct_Response> publishProduct(
      $0.PublishProduct_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$publishProduct, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UnpublishProduct_Response> unpublishProduct(
      $0.UnpublishProduct_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$unpublishProduct, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UncreateProduct_Response> uncreateProduct(
      $0.UncreateProduct_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$uncreateProduct, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchBusinessPageProductIds_Response>
      fetchBusinessPageProductIds(
          $0.FetchBusinessPageProductIds_Request request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchBusinessPageProductIds, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchProductDetails_Response> fetchProductDetails(
      $0.FetchProductDetails_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchProductDetails, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.LogPurchase_Response> logPurchase(
      $0.LogPurchase_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$logPurchase, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchPurchases_Response> fetchPurchases(
      $0.FetchPurchases_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchPurchases, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FetchPurchaseDetails_Response> fetchPurchaseDetails(
      $0.FetchPurchaseDetails_Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$fetchPurchaseDetails, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class GlobensServiceBase extends $grpc.Service {
  $core.String get $name => 'GlobensService';

  GlobensServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AuthenticateUser_Request,
            $0.AuthenticateUser_Response>(
        'authenticateUser',
        authenticateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AuthenticateUser_Request.fromBuffer(value),
        ($0.AuthenticateUser_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeactivateUser_Request,
            $0.DeactivateUser_Response>(
        'deactivateUser',
        deactivateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeactivateUser_Request.fromBuffer(value),
        ($0.DeactivateUser_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateUserDetails_Request,
            $0.UpdateUserDetails_Response>(
        'updateUserDetails',
        updateUserDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateUserDetails_Request.fromBuffer(value),
        ($0.UpdateUserDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchUserDetails_Request,
            $0.FetchUserDetails_Response>(
        'fetchUserDetails',
        fetchUserDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchUserDetails_Request.fromBuffer(value),
        ($0.FetchUserDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateVacantJob_Request,
            $0.CreateVacantJob_Response>(
        'createVacantJob',
        createVacantJob_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateVacantJob_Request.fromBuffer(value),
        ($0.CreateVacantJob_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateJobDetails_Request,
            $0.UpdateJobDetails_Response>(
        'updateJobDetails',
        updateJobDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateJobDetails_Request.fromBuffer(value),
        ($0.UpdateJobDetails_Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UncreateJob_Request, $0.UncreateJob_Response>(
            'uncreateJob',
            uncreateJob_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UncreateJob_Request.fromBuffer(value),
            ($0.UncreateJob_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchBusinessPageJobIds_Request,
            $0.FetchBusinessPageJobIds_Response>(
        'fetchBusinessPageJobIds',
        fetchBusinessPageJobIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchBusinessPageJobIds_Request.fromBuffer(value),
        ($0.FetchBusinessPageJobIds_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchNextKVacantJobIds_Request,
            $0.FetchNextKVacantJobIds_Response>(
        'fetchNextKVacantJobIds',
        fetchNextKVacantJobIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchNextKVacantJobIds_Request.fromBuffer(value),
        ($0.FetchNextKVacantJobIds_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchJobDetails_Request,
            $0.FetchJobDetails_Response>(
        'fetchJobDetails',
        fetchJobDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchJobDetails_Request.fromBuffer(value),
        ($0.FetchJobDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateVacancyApplication_Request,
            $0.CreateVacancyApplication_Response>(
        'createVacancyApplication',
        createVacancyApplication_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateVacancyApplication_Request.fromBuffer(value),
        ($0.CreateVacancyApplication_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateVacancyApplicationDetails_Request,
            $0.UpdateVacancyApplicationDetails_Response>(
        'updateVacancyApplicationDetails',
        updateVacancyApplicationDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateVacancyApplicationDetails_Request.fromBuffer(value),
        ($0.UpdateVacancyApplicationDetails_Response value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UncreateVacancyApplication_Request,
            $0.UncreateVacancyApplication_Response>(
        'uncreateVacancyApplication',
        uncreateVacancyApplication_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UncreateVacancyApplication_Request.fromBuffer(value),
        ($0.UncreateVacancyApplication_Response value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchMyVacancyApplicationIds_Request,
            $0.FetchMyVacancyApplicationIds_Response>(
        'fetchMyVacancyApplicationIds',
        fetchMyVacancyApplicationIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchMyVacancyApplicationIds_Request.fromBuffer(value),
        ($0.FetchMyVacancyApplicationIds_Response value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchVacancyApplicationDetails_Request,
            $0.FetchVacancyApplicationDetails_Response>(
        'fetchVacancyApplicationDetails',
        fetchVacancyApplicationDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchVacancyApplicationDetails_Request.fromBuffer(value),
        ($0.FetchVacancyApplicationDetails_Response value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateBusinessPage_Request,
            $0.CreateBusinessPage_Response>(
        'createBusinessPage',
        createBusinessPage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateBusinessPage_Request.fromBuffer(value),
        ($0.CreateBusinessPage_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateBusinessPageDetails_Request,
            $0.UpdateBusinessPageDetails_Response>(
        'updateBusinessPageDetails',
        updateBusinessPageDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateBusinessPageDetails_Request.fromBuffer(value),
        ($0.UpdateBusinessPageDetails_Response value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UncreateBusinessPage_Request,
            $0.UncreateBusinessPage_Response>(
        'uncreateBusinessPage',
        uncreateBusinessPage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UncreateBusinessPage_Request.fromBuffer(value),
        ($0.UncreateBusinessPage_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchMyBusinessPageIds_Request,
            $0.FetchMyBusinessPageIds_Response>(
        'fetchMyBusinessPageIds',
        fetchMyBusinessPageIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchMyBusinessPageIds_Request.fromBuffer(value),
        ($0.FetchMyBusinessPageIds_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchBusinessPageDetails_Request,
            $0.FetchBusinessPageDetails_Response>(
        'fetchBusinessPageDetails',
        fetchBusinessPageDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchBusinessPageDetails_Request.fromBuffer(value),
        ($0.FetchBusinessPageDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateProduct_Request,
            $0.CreateProduct_Response>(
        'createProduct',
        createProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateProduct_Request.fromBuffer(value),
        ($0.CreateProduct_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateProductDetails_Request,
            $0.UpdateProductDetails_Response>(
        'updateProductDetails',
        updateProductDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateProductDetails_Request.fromBuffer(value),
        ($0.UpdateProductDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PublishProduct_Request,
            $0.PublishProduct_Response>(
        'publishProduct',
        publishProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.PublishProduct_Request.fromBuffer(value),
        ($0.PublishProduct_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UnpublishProduct_Request,
            $0.UnpublishProduct_Response>(
        'unpublishProduct',
        unpublishProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UnpublishProduct_Request.fromBuffer(value),
        ($0.UnpublishProduct_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UncreateProduct_Request,
            $0.UncreateProduct_Response>(
        'uncreateProduct',
        uncreateProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UncreateProduct_Request.fromBuffer(value),
        ($0.UncreateProduct_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchBusinessPageProductIds_Request,
            $0.FetchBusinessPageProductIds_Response>(
        'fetchBusinessPageProductIds',
        fetchBusinessPageProductIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchBusinessPageProductIds_Request.fromBuffer(value),
        ($0.FetchBusinessPageProductIds_Response value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchProductDetails_Request,
            $0.FetchProductDetails_Response>(
        'fetchProductDetails',
        fetchProductDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchProductDetails_Request.fromBuffer(value),
        ($0.FetchProductDetails_Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.LogPurchase_Request, $0.LogPurchase_Response>(
            'logPurchase',
            logPurchase_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.LogPurchase_Request.fromBuffer(value),
            ($0.LogPurchase_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchPurchases_Request,
            $0.FetchPurchases_Response>(
        'fetchPurchases',
        fetchPurchases_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchPurchases_Request.fromBuffer(value),
        ($0.FetchPurchases_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchPurchaseDetails_Request,
            $0.FetchPurchaseDetails_Response>(
        'fetchPurchaseDetails',
        fetchPurchaseDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchPurchaseDetails_Request.fromBuffer(value),
        ($0.FetchPurchaseDetails_Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthenticateUser_Response> authenticateUser_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.AuthenticateUser_Request> request) async {
    return authenticateUser(call, await request);
  }

  $async.Future<$0.DeactivateUser_Response> deactivateUser_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeactivateUser_Request> request) async {
    return deactivateUser(call, await request);
  }

  $async.Future<$0.UpdateUserDetails_Response> updateUserDetails_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateUserDetails_Request> request) async {
    return updateUserDetails(call, await request);
  }

  $async.Future<$0.FetchUserDetails_Response> fetchUserDetails_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchUserDetails_Request> request) async {
    return fetchUserDetails(call, await request);
  }

  $async.Future<$0.CreateVacantJob_Response> createVacantJob_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateVacantJob_Request> request) async {
    return createVacantJob(call, await request);
  }

  $async.Future<$0.UpdateJobDetails_Response> updateJobDetails_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateJobDetails_Request> request) async {
    return updateJobDetails(call, await request);
  }

  $async.Future<$0.UncreateJob_Response> uncreateJob_Pre($grpc.ServiceCall call,
      $async.Future<$0.UncreateJob_Request> request) async {
    return uncreateJob(call, await request);
  }

  $async.Future<$0.FetchBusinessPageJobIds_Response>
      fetchBusinessPageJobIds_Pre($grpc.ServiceCall call,
          $async.Future<$0.FetchBusinessPageJobIds_Request> request) async {
    return fetchBusinessPageJobIds(call, await request);
  }

  $async.Future<$0.FetchNextKVacantJobIds_Response> fetchNextKVacantJobIds_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchNextKVacantJobIds_Request> request) async {
    return fetchNextKVacantJobIds(call, await request);
  }

  $async.Future<$0.FetchJobDetails_Response> fetchJobDetails_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchJobDetails_Request> request) async {
    return fetchJobDetails(call, await request);
  }

  $async.Future<$0.CreateVacancyApplication_Response>
      createVacancyApplication_Pre($grpc.ServiceCall call,
          $async.Future<$0.CreateVacancyApplication_Request> request) async {
    return createVacancyApplication(call, await request);
  }

  $async.Future<$0.UpdateVacancyApplicationDetails_Response>
      updateVacancyApplicationDetails_Pre(
          $grpc.ServiceCall call,
          $async.Future<$0.UpdateVacancyApplicationDetails_Request>
              request) async {
    return updateVacancyApplicationDetails(call, await request);
  }

  $async.Future<$0.UncreateVacancyApplication_Response>
      uncreateVacancyApplication_Pre($grpc.ServiceCall call,
          $async.Future<$0.UncreateVacancyApplication_Request> request) async {
    return uncreateVacancyApplication(call, await request);
  }

  $async.Future<$0.FetchMyVacancyApplicationIds_Response>
      fetchMyVacancyApplicationIds_Pre(
          $grpc.ServiceCall call,
          $async.Future<$0.FetchMyVacancyApplicationIds_Request>
              request) async {
    return fetchMyVacancyApplicationIds(call, await request);
  }

  $async.Future<$0.FetchVacancyApplicationDetails_Response>
      fetchVacancyApplicationDetails_Pre(
          $grpc.ServiceCall call,
          $async.Future<$0.FetchVacancyApplicationDetails_Request>
              request) async {
    return fetchVacancyApplicationDetails(call, await request);
  }

  $async.Future<$0.CreateBusinessPage_Response> createBusinessPage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateBusinessPage_Request> request) async {
    return createBusinessPage(call, await request);
  }

  $async.Future<$0.UpdateBusinessPageDetails_Response>
      updateBusinessPageDetails_Pre($grpc.ServiceCall call,
          $async.Future<$0.UpdateBusinessPageDetails_Request> request) async {
    return updateBusinessPageDetails(call, await request);
  }

  $async.Future<$0.UncreateBusinessPage_Response> uncreateBusinessPage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UncreateBusinessPage_Request> request) async {
    return uncreateBusinessPage(call, await request);
  }

  $async.Future<$0.FetchMyBusinessPageIds_Response> fetchMyBusinessPageIds_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchMyBusinessPageIds_Request> request) async {
    return fetchMyBusinessPageIds(call, await request);
  }

  $async.Future<$0.FetchBusinessPageDetails_Response>
      fetchBusinessPageDetails_Pre($grpc.ServiceCall call,
          $async.Future<$0.FetchBusinessPageDetails_Request> request) async {
    return fetchBusinessPageDetails(call, await request);
  }

  $async.Future<$0.CreateProduct_Response> createProduct_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateProduct_Request> request) async {
    return createProduct(call, await request);
  }

  $async.Future<$0.UpdateProductDetails_Response> updateProductDetails_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateProductDetails_Request> request) async {
    return updateProductDetails(call, await request);
  }

  $async.Future<$0.PublishProduct_Response> publishProduct_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.PublishProduct_Request> request) async {
    return publishProduct(call, await request);
  }

  $async.Future<$0.UnpublishProduct_Response> unpublishProduct_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UnpublishProduct_Request> request) async {
    return unpublishProduct(call, await request);
  }

  $async.Future<$0.UncreateProduct_Response> uncreateProduct_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UncreateProduct_Request> request) async {
    return uncreateProduct(call, await request);
  }

  $async.Future<$0.FetchBusinessPageProductIds_Response>
      fetchBusinessPageProductIds_Pre($grpc.ServiceCall call,
          $async.Future<$0.FetchBusinessPageProductIds_Request> request) async {
    return fetchBusinessPageProductIds(call, await request);
  }

  $async.Future<$0.FetchProductDetails_Response> fetchProductDetails_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchProductDetails_Request> request) async {
    return fetchProductDetails(call, await request);
  }

  $async.Future<$0.LogPurchase_Response> logPurchase_Pre($grpc.ServiceCall call,
      $async.Future<$0.LogPurchase_Request> request) async {
    return logPurchase(call, await request);
  }

  $async.Future<$0.FetchPurchases_Response> fetchPurchases_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchPurchases_Request> request) async {
    return fetchPurchases(call, await request);
  }

  $async.Future<$0.FetchPurchaseDetails_Response> fetchPurchaseDetails_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchPurchaseDetails_Request> request) async {
    return fetchPurchaseDetails(call, await request);
  }

  $async.Future<$0.AuthenticateUser_Response> authenticateUser(
      $grpc.ServiceCall call, $0.AuthenticateUser_Request request);
  $async.Future<$0.DeactivateUser_Response> deactivateUser(
      $grpc.ServiceCall call, $0.DeactivateUser_Request request);
  $async.Future<$0.UpdateUserDetails_Response> updateUserDetails(
      $grpc.ServiceCall call, $0.UpdateUserDetails_Request request);
  $async.Future<$0.FetchUserDetails_Response> fetchUserDetails(
      $grpc.ServiceCall call, $0.FetchUserDetails_Request request);
  $async.Future<$0.CreateVacantJob_Response> createVacantJob(
      $grpc.ServiceCall call, $0.CreateVacantJob_Request request);
  $async.Future<$0.UpdateJobDetails_Response> updateJobDetails(
      $grpc.ServiceCall call, $0.UpdateJobDetails_Request request);
  $async.Future<$0.UncreateJob_Response> uncreateJob(
      $grpc.ServiceCall call, $0.UncreateJob_Request request);
  $async.Future<$0.FetchBusinessPageJobIds_Response> fetchBusinessPageJobIds(
      $grpc.ServiceCall call, $0.FetchBusinessPageJobIds_Request request);
  $async.Future<$0.FetchNextKVacantJobIds_Response> fetchNextKVacantJobIds(
      $grpc.ServiceCall call, $0.FetchNextKVacantJobIds_Request request);
  $async.Future<$0.FetchJobDetails_Response> fetchJobDetails(
      $grpc.ServiceCall call, $0.FetchJobDetails_Request request);
  $async.Future<$0.CreateVacancyApplication_Response> createVacancyApplication(
      $grpc.ServiceCall call, $0.CreateVacancyApplication_Request request);
  $async.Future<$0.UpdateVacancyApplicationDetails_Response>
      updateVacancyApplicationDetails($grpc.ServiceCall call,
          $0.UpdateVacancyApplicationDetails_Request request);
  $async.Future<$0.UncreateVacancyApplication_Response>
      uncreateVacancyApplication($grpc.ServiceCall call,
          $0.UncreateVacancyApplication_Request request);
  $async.Future<$0.FetchMyVacancyApplicationIds_Response>
      fetchMyVacancyApplicationIds($grpc.ServiceCall call,
          $0.FetchMyVacancyApplicationIds_Request request);
  $async.Future<$0.FetchVacancyApplicationDetails_Response>
      fetchVacancyApplicationDetails($grpc.ServiceCall call,
          $0.FetchVacancyApplicationDetails_Request request);
  $async.Future<$0.CreateBusinessPage_Response> createBusinessPage(
      $grpc.ServiceCall call, $0.CreateBusinessPage_Request request);
  $async.Future<$0.UpdateBusinessPageDetails_Response>
      updateBusinessPageDetails(
          $grpc.ServiceCall call, $0.UpdateBusinessPageDetails_Request request);
  $async.Future<$0.UncreateBusinessPage_Response> uncreateBusinessPage(
      $grpc.ServiceCall call, $0.UncreateBusinessPage_Request request);
  $async.Future<$0.FetchMyBusinessPageIds_Response> fetchMyBusinessPageIds(
      $grpc.ServiceCall call, $0.FetchMyBusinessPageIds_Request request);
  $async.Future<$0.FetchBusinessPageDetails_Response> fetchBusinessPageDetails(
      $grpc.ServiceCall call, $0.FetchBusinessPageDetails_Request request);
  $async.Future<$0.CreateProduct_Response> createProduct(
      $grpc.ServiceCall call, $0.CreateProduct_Request request);
  $async.Future<$0.UpdateProductDetails_Response> updateProductDetails(
      $grpc.ServiceCall call, $0.UpdateProductDetails_Request request);
  $async.Future<$0.PublishProduct_Response> publishProduct(
      $grpc.ServiceCall call, $0.PublishProduct_Request request);
  $async.Future<$0.UnpublishProduct_Response> unpublishProduct(
      $grpc.ServiceCall call, $0.UnpublishProduct_Request request);
  $async.Future<$0.UncreateProduct_Response> uncreateProduct(
      $grpc.ServiceCall call, $0.UncreateProduct_Request request);
  $async.Future<$0.FetchBusinessPageProductIds_Response>
      fetchBusinessPageProductIds($grpc.ServiceCall call,
          $0.FetchBusinessPageProductIds_Request request);
  $async.Future<$0.FetchProductDetails_Response> fetchProductDetails(
      $grpc.ServiceCall call, $0.FetchProductDetails_Request request);
  $async.Future<$0.LogPurchase_Response> logPurchase(
      $grpc.ServiceCall call, $0.LogPurchase_Request request);
  $async.Future<$0.FetchPurchases_Response> fetchPurchases(
      $grpc.ServiceCall call, $0.FetchPurchases_Request request);
  $async.Future<$0.FetchPurchaseDetails_Response> fetchPurchaseDetails(
      $grpc.ServiceCall call, $0.FetchPurchaseDetails_Request request);
}
