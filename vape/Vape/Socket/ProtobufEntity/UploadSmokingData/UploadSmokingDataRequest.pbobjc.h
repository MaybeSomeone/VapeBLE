// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: UploadSmokingDataRequest.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_GEN_VERSION != 30001
#error This file was generated by a different version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class SmokingDataMessage;
GPB_ENUM_FWD_DECLARE(PhoneType);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - UploadSmokingDataRequestRoot

/// Exposes the extension registry for this file.
///
/// The base class provides:
/// @code
///   + (GPBExtensionRegistry *)extensionRegistry;
/// @endcode
/// which is a @c GPBExtensionRegistry that includes all the extensions defined by
/// this file and all files that it depends on.
@interface UploadSmokingDataRequestRoot : GPBRootObject
@end

#pragma mark - UploadSmokingDataRequestMessage

typedef GPB_ENUM(UploadSmokingDataRequestMessage_FieldNumber) {
  UploadSmokingDataRequestMessage_FieldNumber_Session = 1,
  UploadSmokingDataRequestMessage_FieldNumber_PhoneType = 2,
  UploadSmokingDataRequestMessage_FieldNumber_SmokingDatasArray = 3,
};

@interface UploadSmokingDataRequestMessage : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *session;

@property(nonatomic, readwrite) enum PhoneType phoneType;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<SmokingDataMessage*> *smokingDatasArray;
/// The number of items in @c smokingDatasArray without causing the array to be created.
@property(nonatomic, readonly) NSUInteger smokingDatasArray_Count;

@end

/// Fetches the raw value of a @c UploadSmokingDataRequestMessage's @c phoneType property, even
/// if the value was not defined by the enum at the time the code was generated.
int32_t UploadSmokingDataRequestMessage_PhoneType_RawValue(UploadSmokingDataRequestMessage *message);
/// Sets the raw value of an @c UploadSmokingDataRequestMessage's @c phoneType property, allowing
/// it to be set to a value that was not defined by the enum at the time the code
/// was generated.
void SetUploadSmokingDataRequestMessage_PhoneType_RawValue(UploadSmokingDataRequestMessage *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
