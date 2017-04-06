// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: UpdateProfileRequest.proto

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

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum UpdateProfileRequestMessage_SettingField

typedef GPB_ENUM(UpdateProfileRequestMessage_SettingField) {
  /// Value used if any message's field encounters a value that is not defined
  /// by this enum. The message will also have C functions to get/set the rawValue
  /// of the field.
  UpdateProfileRequestMessage_SettingField_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  UpdateProfileRequestMessage_SettingField_UserPhoto = 0,
  UpdateProfileRequestMessage_SettingField_UserName = 1,
  UpdateProfileRequestMessage_SettingField_UserGender = 2,
  UpdateProfileRequestMessage_SettingField_UserAge = 3,
  UpdateProfileRequestMessage_SettingField_SmokeAge = 4,
  UpdateProfileRequestMessage_SettingField_UserHeight = 5,
  UpdateProfileRequestMessage_SettingField_UserWeight = 6,
  UpdateProfileRequestMessage_SettingField_HomeInfo = 7,
  UpdateProfileRequestMessage_SettingField_PlanCount = 8,
  UpdateProfileRequestMessage_SettingField_PlanTime = 9,
  UpdateProfileRequestMessage_SettingField_Language = 10,
};

GPBEnumDescriptor *UpdateProfileRequestMessage_SettingField_EnumDescriptor(void);

/// Checks to see if the given value is defined by the enum or was not known at
/// the time this source was generated.
BOOL UpdateProfileRequestMessage_SettingField_IsValidValue(int32_t value);

#pragma mark - UpdateProfileRequestRoot

/// Exposes the extension registry for this file.
///
/// The base class provides:
/// @code
///   + (GPBExtensionRegistry *)extensionRegistry;
/// @endcode
/// which is a @c GPBExtensionRegistry that includes all the extensions defined by
/// this file and all files that it depends on.
@interface UpdateProfileRequestRoot : GPBRootObject
@end

#pragma mark - UpdateProfileRequestMessage

typedef GPB_ENUM(UpdateProfileRequestMessage_FieldNumber) {
  UpdateProfileRequestMessage_FieldNumber_Session = 1,
  UpdateProfileRequestMessage_FieldNumber_SettingField = 2,
  UpdateProfileRequestMessage_FieldNumber_SettingValue = 3,
  UpdateProfileRequestMessage_FieldNumber_Photo = 4,
};

@interface UpdateProfileRequestMessage : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *session;

@property(nonatomic, readwrite) UpdateProfileRequestMessage_SettingField settingField;

@property(nonatomic, readwrite, copy, null_resettable) NSString *settingValue;

@property(nonatomic, readwrite, copy, null_resettable) NSData *photo;

@end

/// Fetches the raw value of a @c UpdateProfileRequestMessage's @c settingField property, even
/// if the value was not defined by the enum at the time the code was generated.
int32_t UpdateProfileRequestMessage_SettingField_RawValue(UpdateProfileRequestMessage *message);
/// Sets the raw value of an @c UpdateProfileRequestMessage's @c settingField property, allowing
/// it to be set to a value that was not defined by the enum at the time the code
/// was generated.
void SetUpdateProfileRequestMessage_SettingField_RawValue(UpdateProfileRequestMessage *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)