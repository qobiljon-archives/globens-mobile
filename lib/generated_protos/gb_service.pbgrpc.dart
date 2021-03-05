///
//  Generated code. Do not modify.
//  source: gb_service.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

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
  static final _$fetchNextKProductIds = $grpc.ClientMethod<
          $0.FetchNextKProductIds_Request, $0.FetchNextKProductIds_Response>(
      '/GlobensService/fetchNextKProductIds',
      ($0.FetchNextKProductIds_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchNextKProductIds_Response.fromBuffer(value));
  static final _$fetchProductDetails = $grpc.ClientMethod<
          $0.FetchProductDetails_Request, $0.FetchProductDetails_Response>(
      '/GlobensService/fetchProductDetails',
      ($0.FetchProductDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchProductDetails_Response.fromBuffer(value));
  static final _$fetchProductCategoryIds = $grpc.ClientMethod<
          $0.FetchProductCategoryIds_Request,
          $0.FetchProductCategoryIds_Response>(
      '/GlobensService/fetchProductCategoryIds',
      ($0.FetchProductCategoryIds_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchProductCategoryIds_Response.fromBuffer(value));
  static final _$fetchProductCategoryDetails = $grpc.ClientMethod<
          $0.FetchProductCategoryDetails_Request,
          $0.FetchProductCategoryDetails_Response>(
      '/GlobensService/fetchProductCategoryDetails',
      ($0.FetchProductCategoryDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchProductCategoryDetails_Response.fromBuffer(value));
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
  static final _$createJobApplication = $grpc.ClientMethod<
          $0.CreateJobApplication_Request, $0.CreateJobApplication_Response>(
      '/GlobensService/createJobApplication',
      ($0.CreateJobApplication_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CreateJobApplication_Response.fromBuffer(value));
  static final _$updateJobApplicationDetails = $grpc.ClientMethod<
          $0.UpdateJobApplicationDetails_Request,
          $0.UpdateJobApplicationDetails_Response>(
      '/GlobensService/updateJobApplicationDetails',
      ($0.UpdateJobApplicationDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdateJobApplicationDetails_Response.fromBuffer(value));
  static final _$uncreateJobApplication = $grpc.ClientMethod<
          $0.UncreateJobApplication_Request,
          $0.UncreateJobApplication_Response>(
      '/GlobensService/uncreateJobApplication',
      ($0.UncreateJobApplication_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UncreateJobApplication_Response.fromBuffer(value));
  static final _$fetchJobApplicationIds = $grpc.ClientMethod<
          $0.FetchJobApplicationIds_Request,
          $0.FetchJobApplicationIds_Response>(
      '/GlobensService/fetchJobApplicationIds',
      ($0.FetchJobApplicationIds_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchJobApplicationIds_Response.fromBuffer(value));
  static final _$fetchJobApplicationDetails = $grpc.ClientMethod<
          $0.FetchJobApplicationDetails_Request,
          $0.FetchJobApplicationDetails_Response>(
      '/GlobensService/fetchJobApplicationDetails',
      ($0.FetchJobApplicationDetails_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchJobApplicationDetails_Response.fromBuffer(value));
  static final _$approveJobApplication = $grpc.ClientMethod<
          $0.ApproveJobApplication_Request, $0.ApproveJobApplication_Response>(
      '/GlobensService/approveJobApplication',
      ($0.ApproveJobApplication_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ApproveJobApplication_Response.fromBuffer(value));
  static final _$declineJobApplication = $grpc.ClientMethod<
          $0.DeclineJobApplication_Request, $0.DeclineJobApplication_Response>(
      '/GlobensService/declineJobApplication',
      ($0.DeclineJobApplication_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.DeclineJobApplication_Response.fromBuffer(value));
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
  static final _$submitProductReview = $grpc.ClientMethod<
          $0.SubmitProductReview_Request, $0.SubmitProductReview_Response>(
      '/GlobensService/submitProductReview',
      ($0.SubmitProductReview_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.SubmitProductReview_Response.fromBuffer(value));
  static final _$retrieveProductReviews = $grpc.ClientMethod<
          $0.RetrieveProductReviews_Request,
          $0.RetrieveProductReviews_Response>(
      '/GlobensService/retrieveProductReviews',
      ($0.RetrieveProductReviews_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RetrieveProductReviews_Response.fromBuffer(value));
  static final _$deleteProductReview = $grpc.ClientMethod<
          $0.DeleteProductReview_Request, $0.DeleteProductReview_Response>(
      '/GlobensService/deleteProductReview',
      ($0.DeleteProductReview_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.DeleteProductReview_Response.fromBuffer(value));
  static final _$submitEmployeeReview = $grpc.ClientMethod<
          $0.SubmitEmployeeReview_Request, $0.SubmitEmployeeReview_Response>(
      '/GlobensService/submitEmployeeReview',
      ($0.SubmitEmployeeReview_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.SubmitEmployeeReview_Response.fromBuffer(value));
  static final _$retrieveEmployeeReviews = $grpc.ClientMethod<
          $0.RetrieveEmployeeReviews_Request,
          $0.RetrieveEmployeeReviews_Response>(
      '/GlobensService/retrieveEmployeeReviews',
      ($0.RetrieveEmployeeReviews_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RetrieveEmployeeReviews_Response.fromBuffer(value));
  static final _$deleteEmployeeReview = $grpc.ClientMethod<
          $0.DeleteEmployeeReview_Request, $0.DeleteEmployeeReview_Response>(
      '/GlobensService/deleteEmployeeReview',
      ($0.DeleteEmployeeReview_Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.DeleteEmployeeReview_Response.fromBuffer(value));

  GlobensServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.AuthenticateUser_Response> authenticateUser(
      $0.AuthenticateUser_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$authenticateUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeactivateUser_Response> deactivateUser(
      $0.DeactivateUser_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deactivateUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateUserDetails_Response> updateUserDetails(
      $0.UpdateUserDetails_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateUserDetails, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchUserDetails_Response> fetchUserDetails(
      $0.FetchUserDetails_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchUserDetails, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateBusinessPage_Response> createBusinessPage(
      $0.CreateBusinessPage_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createBusinessPage, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateBusinessPageDetails_Response>
      updateBusinessPageDetails($0.UpdateBusinessPageDetails_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateBusinessPageDetails, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.UncreateBusinessPage_Response> uncreateBusinessPage(
      $0.UncreateBusinessPage_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$uncreateBusinessPage, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchMyBusinessPageIds_Response>
      fetchMyBusinessPageIds($0.FetchMyBusinessPageIds_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchMyBusinessPageIds, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FetchBusinessPageDetails_Response>
      fetchBusinessPageDetails($0.FetchBusinessPageDetails_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchBusinessPageDetails, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.CreateProduct_Response> createProduct(
      $0.CreateProduct_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateProductDetails_Response> updateProductDetails(
      $0.UpdateProductDetails_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateProductDetails, request, options: options);
  }

  $grpc.ResponseFuture<$0.PublishProduct_Response> publishProduct(
      $0.PublishProduct_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$publishProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.UnpublishProduct_Response> unpublishProduct(
      $0.UnpublishProduct_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$unpublishProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.UncreateProduct_Response> uncreateProduct(
      $0.UncreateProduct_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$uncreateProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchNextKProductIds_Response> fetchNextKProductIds(
      $0.FetchNextKProductIds_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchNextKProductIds, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchProductDetails_Response> fetchProductDetails(
      $0.FetchProductDetails_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchProductDetails, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchProductCategoryIds_Response>
      fetchProductCategoryIds($0.FetchProductCategoryIds_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchProductCategoryIds, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FetchProductCategoryDetails_Response>
      fetchProductCategoryDetails(
          $0.FetchProductCategoryDetails_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchProductCategoryDetails, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.CreateVacantJob_Response> createVacantJob(
      $0.CreateVacantJob_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createVacantJob, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateJobDetails_Response> updateJobDetails(
      $0.UpdateJobDetails_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateJobDetails, request, options: options);
  }

  $grpc.ResponseFuture<$0.UncreateJob_Response> uncreateJob(
      $0.UncreateJob_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$uncreateJob, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchBusinessPageJobIds_Response>
      fetchBusinessPageJobIds($0.FetchBusinessPageJobIds_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchBusinessPageJobIds, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FetchNextKVacantJobIds_Response>
      fetchNextKVacantJobIds($0.FetchNextKVacantJobIds_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchNextKVacantJobIds, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FetchJobDetails_Response> fetchJobDetails(
      $0.FetchJobDetails_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchJobDetails, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateJobApplication_Response> createJobApplication(
      $0.CreateJobApplication_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createJobApplication, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateJobApplicationDetails_Response>
      updateJobApplicationDetails(
          $0.UpdateJobApplicationDetails_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateJobApplicationDetails, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.UncreateJobApplication_Response>
      uncreateJobApplication($0.UncreateJobApplication_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$uncreateJobApplication, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FetchJobApplicationIds_Response>
      fetchJobApplicationIds($0.FetchJobApplicationIds_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchJobApplicationIds, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FetchJobApplicationDetails_Response>
      fetchJobApplicationDetails($0.FetchJobApplicationDetails_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchJobApplicationDetails, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ApproveJobApplication_Response> approveJobApplication(
      $0.ApproveJobApplication_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$approveJobApplication, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeclineJobApplication_Response> declineJobApplication(
      $0.DeclineJobApplication_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$declineJobApplication, request, options: options);
  }

  $grpc.ResponseFuture<$0.LogPurchase_Response> logPurchase(
      $0.LogPurchase_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$logPurchase, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchPurchases_Response> fetchPurchases(
      $0.FetchPurchases_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchPurchases, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchPurchaseDetails_Response> fetchPurchaseDetails(
      $0.FetchPurchaseDetails_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchPurchaseDetails, request, options: options);
  }

  $grpc.ResponseFuture<$0.SubmitProductReview_Response> submitProductReview(
      $0.SubmitProductReview_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$submitProductReview, request, options: options);
  }

  $grpc.ResponseFuture<$0.RetrieveProductReviews_Response>
      retrieveProductReviews($0.RetrieveProductReviews_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$retrieveProductReviews, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.DeleteProductReview_Response> deleteProductReview(
      $0.DeleteProductReview_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteProductReview, request, options: options);
  }

  $grpc.ResponseFuture<$0.SubmitEmployeeReview_Response> submitEmployeeReview(
      $0.SubmitEmployeeReview_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$submitEmployeeReview, request, options: options);
  }

  $grpc.ResponseFuture<$0.RetrieveEmployeeReviews_Response>
      retrieveEmployeeReviews($0.RetrieveEmployeeReviews_Request request,
          {$grpc.CallOptions options}) {
    return $createUnaryCall(_$retrieveEmployeeReviews, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.DeleteEmployeeReview_Response> deleteEmployeeReview(
      $0.DeleteEmployeeReview_Request request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteEmployeeReview, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.FetchNextKProductIds_Request,
            $0.FetchNextKProductIds_Response>(
        'fetchNextKProductIds',
        fetchNextKProductIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchNextKProductIds_Request.fromBuffer(value),
        ($0.FetchNextKProductIds_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchProductDetails_Request,
            $0.FetchProductDetails_Response>(
        'fetchProductDetails',
        fetchProductDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchProductDetails_Request.fromBuffer(value),
        ($0.FetchProductDetails_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchProductCategoryIds_Request,
            $0.FetchProductCategoryIds_Response>(
        'fetchProductCategoryIds',
        fetchProductCategoryIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchProductCategoryIds_Request.fromBuffer(value),
        ($0.FetchProductCategoryIds_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchProductCategoryDetails_Request,
            $0.FetchProductCategoryDetails_Response>(
        'fetchProductCategoryDetails',
        fetchProductCategoryDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchProductCategoryDetails_Request.fromBuffer(value),
        ($0.FetchProductCategoryDetails_Response value) =>
            value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.CreateJobApplication_Request,
            $0.CreateJobApplication_Response>(
        'createJobApplication',
        createJobApplication_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateJobApplication_Request.fromBuffer(value),
        ($0.CreateJobApplication_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateJobApplicationDetails_Request,
            $0.UpdateJobApplicationDetails_Response>(
        'updateJobApplicationDetails',
        updateJobApplicationDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateJobApplicationDetails_Request.fromBuffer(value),
        ($0.UpdateJobApplicationDetails_Response value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UncreateJobApplication_Request,
            $0.UncreateJobApplication_Response>(
        'uncreateJobApplication',
        uncreateJobApplication_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UncreateJobApplication_Request.fromBuffer(value),
        ($0.UncreateJobApplication_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchJobApplicationIds_Request,
            $0.FetchJobApplicationIds_Response>(
        'fetchJobApplicationIds',
        fetchJobApplicationIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchJobApplicationIds_Request.fromBuffer(value),
        ($0.FetchJobApplicationIds_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchJobApplicationDetails_Request,
            $0.FetchJobApplicationDetails_Response>(
        'fetchJobApplicationDetails',
        fetchJobApplicationDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchJobApplicationDetails_Request.fromBuffer(value),
        ($0.FetchJobApplicationDetails_Response value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ApproveJobApplication_Request,
            $0.ApproveJobApplication_Response>(
        'approveJobApplication',
        approveJobApplication_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ApproveJobApplication_Request.fromBuffer(value),
        ($0.ApproveJobApplication_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeclineJobApplication_Request,
            $0.DeclineJobApplication_Response>(
        'declineJobApplication',
        declineJobApplication_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeclineJobApplication_Request.fromBuffer(value),
        ($0.DeclineJobApplication_Response value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.SubmitProductReview_Request,
            $0.SubmitProductReview_Response>(
        'submitProductReview',
        submitProductReview_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SubmitProductReview_Request.fromBuffer(value),
        ($0.SubmitProductReview_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RetrieveProductReviews_Request,
            $0.RetrieveProductReviews_Response>(
        'retrieveProductReviews',
        retrieveProductReviews_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RetrieveProductReviews_Request.fromBuffer(value),
        ($0.RetrieveProductReviews_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteProductReview_Request,
            $0.DeleteProductReview_Response>(
        'deleteProductReview',
        deleteProductReview_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteProductReview_Request.fromBuffer(value),
        ($0.DeleteProductReview_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SubmitEmployeeReview_Request,
            $0.SubmitEmployeeReview_Response>(
        'submitEmployeeReview',
        submitEmployeeReview_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SubmitEmployeeReview_Request.fromBuffer(value),
        ($0.SubmitEmployeeReview_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RetrieveEmployeeReviews_Request,
            $0.RetrieveEmployeeReviews_Response>(
        'retrieveEmployeeReviews',
        retrieveEmployeeReviews_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RetrieveEmployeeReviews_Request.fromBuffer(value),
        ($0.RetrieveEmployeeReviews_Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteEmployeeReview_Request,
            $0.DeleteEmployeeReview_Response>(
        'deleteEmployeeReview',
        deleteEmployeeReview_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteEmployeeReview_Request.fromBuffer(value),
        ($0.DeleteEmployeeReview_Response value) => value.writeToBuffer()));
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

  $async.Future<$0.FetchNextKProductIds_Response> fetchNextKProductIds_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchNextKProductIds_Request> request) async {
    return fetchNextKProductIds(call, await request);
  }

  $async.Future<$0.FetchProductDetails_Response> fetchProductDetails_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchProductDetails_Request> request) async {
    return fetchProductDetails(call, await request);
  }

  $async.Future<$0.FetchProductCategoryIds_Response>
      fetchProductCategoryIds_Pre($grpc.ServiceCall call,
          $async.Future<$0.FetchProductCategoryIds_Request> request) async {
    return fetchProductCategoryIds(call, await request);
  }

  $async.Future<$0.FetchProductCategoryDetails_Response>
      fetchProductCategoryDetails_Pre($grpc.ServiceCall call,
          $async.Future<$0.FetchProductCategoryDetails_Request> request) async {
    return fetchProductCategoryDetails(call, await request);
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

  $async.Future<$0.CreateJobApplication_Response> createJobApplication_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateJobApplication_Request> request) async {
    return createJobApplication(call, await request);
  }

  $async.Future<$0.UpdateJobApplicationDetails_Response>
      updateJobApplicationDetails_Pre($grpc.ServiceCall call,
          $async.Future<$0.UpdateJobApplicationDetails_Request> request) async {
    return updateJobApplicationDetails(call, await request);
  }

  $async.Future<$0.UncreateJobApplication_Response> uncreateJobApplication_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UncreateJobApplication_Request> request) async {
    return uncreateJobApplication(call, await request);
  }

  $async.Future<$0.FetchJobApplicationIds_Response> fetchJobApplicationIds_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchJobApplicationIds_Request> request) async {
    return fetchJobApplicationIds(call, await request);
  }

  $async.Future<$0.FetchJobApplicationDetails_Response>
      fetchJobApplicationDetails_Pre($grpc.ServiceCall call,
          $async.Future<$0.FetchJobApplicationDetails_Request> request) async {
    return fetchJobApplicationDetails(call, await request);
  }

  $async.Future<$0.ApproveJobApplication_Response> approveJobApplication_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ApproveJobApplication_Request> request) async {
    return approveJobApplication(call, await request);
  }

  $async.Future<$0.DeclineJobApplication_Response> declineJobApplication_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeclineJobApplication_Request> request) async {
    return declineJobApplication(call, await request);
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

  $async.Future<$0.SubmitProductReview_Response> submitProductReview_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SubmitProductReview_Request> request) async {
    return submitProductReview(call, await request);
  }

  $async.Future<$0.RetrieveProductReviews_Response> retrieveProductReviews_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RetrieveProductReviews_Request> request) async {
    return retrieveProductReviews(call, await request);
  }

  $async.Future<$0.DeleteProductReview_Response> deleteProductReview_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeleteProductReview_Request> request) async {
    return deleteProductReview(call, await request);
  }

  $async.Future<$0.SubmitEmployeeReview_Response> submitEmployeeReview_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SubmitEmployeeReview_Request> request) async {
    return submitEmployeeReview(call, await request);
  }

  $async.Future<$0.RetrieveEmployeeReviews_Response>
      retrieveEmployeeReviews_Pre($grpc.ServiceCall call,
          $async.Future<$0.RetrieveEmployeeReviews_Request> request) async {
    return retrieveEmployeeReviews(call, await request);
  }

  $async.Future<$0.DeleteEmployeeReview_Response> deleteEmployeeReview_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeleteEmployeeReview_Request> request) async {
    return deleteEmployeeReview(call, await request);
  }

  $async.Future<$0.AuthenticateUser_Response> authenticateUser(
      $grpc.ServiceCall call, $0.AuthenticateUser_Request request);
  $async.Future<$0.DeactivateUser_Response> deactivateUser(
      $grpc.ServiceCall call, $0.DeactivateUser_Request request);
  $async.Future<$0.UpdateUserDetails_Response> updateUserDetails(
      $grpc.ServiceCall call, $0.UpdateUserDetails_Request request);
  $async.Future<$0.FetchUserDetails_Response> fetchUserDetails(
      $grpc.ServiceCall call, $0.FetchUserDetails_Request request);
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
  $async.Future<$0.FetchNextKProductIds_Response> fetchNextKProductIds(
      $grpc.ServiceCall call, $0.FetchNextKProductIds_Request request);
  $async.Future<$0.FetchProductDetails_Response> fetchProductDetails(
      $grpc.ServiceCall call, $0.FetchProductDetails_Request request);
  $async.Future<$0.FetchProductCategoryIds_Response> fetchProductCategoryIds(
      $grpc.ServiceCall call, $0.FetchProductCategoryIds_Request request);
  $async.Future<$0.FetchProductCategoryDetails_Response>
      fetchProductCategoryDetails($grpc.ServiceCall call,
          $0.FetchProductCategoryDetails_Request request);
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
  $async.Future<$0.CreateJobApplication_Response> createJobApplication(
      $grpc.ServiceCall call, $0.CreateJobApplication_Request request);
  $async.Future<$0.UpdateJobApplicationDetails_Response>
      updateJobApplicationDetails($grpc.ServiceCall call,
          $0.UpdateJobApplicationDetails_Request request);
  $async.Future<$0.UncreateJobApplication_Response> uncreateJobApplication(
      $grpc.ServiceCall call, $0.UncreateJobApplication_Request request);
  $async.Future<$0.FetchJobApplicationIds_Response> fetchJobApplicationIds(
      $grpc.ServiceCall call, $0.FetchJobApplicationIds_Request request);
  $async.Future<$0.FetchJobApplicationDetails_Response>
      fetchJobApplicationDetails($grpc.ServiceCall call,
          $0.FetchJobApplicationDetails_Request request);
  $async.Future<$0.ApproveJobApplication_Response> approveJobApplication(
      $grpc.ServiceCall call, $0.ApproveJobApplication_Request request);
  $async.Future<$0.DeclineJobApplication_Response> declineJobApplication(
      $grpc.ServiceCall call, $0.DeclineJobApplication_Request request);
  $async.Future<$0.LogPurchase_Response> logPurchase(
      $grpc.ServiceCall call, $0.LogPurchase_Request request);
  $async.Future<$0.FetchPurchases_Response> fetchPurchases(
      $grpc.ServiceCall call, $0.FetchPurchases_Request request);
  $async.Future<$0.FetchPurchaseDetails_Response> fetchPurchaseDetails(
      $grpc.ServiceCall call, $0.FetchPurchaseDetails_Request request);
  $async.Future<$0.SubmitProductReview_Response> submitProductReview(
      $grpc.ServiceCall call, $0.SubmitProductReview_Request request);
  $async.Future<$0.RetrieveProductReviews_Response> retrieveProductReviews(
      $grpc.ServiceCall call, $0.RetrieveProductReviews_Request request);
  $async.Future<$0.DeleteProductReview_Response> deleteProductReview(
      $grpc.ServiceCall call, $0.DeleteProductReview_Request request);
  $async.Future<$0.SubmitEmployeeReview_Response> submitEmployeeReview(
      $grpc.ServiceCall call, $0.SubmitEmployeeReview_Request request);
  $async.Future<$0.RetrieveEmployeeReviews_Response> retrieveEmployeeReviews(
      $grpc.ServiceCall call, $0.RetrieveEmployeeReviews_Request request);
  $async.Future<$0.DeleteEmployeeReview_Response> deleteEmployeeReview(
      $grpc.ServiceCall call, $0.DeleteEmployeeReview_Request request);
}
