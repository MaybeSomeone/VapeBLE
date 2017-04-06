// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: UploadHeartRateDataResponse.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

 #import "UploadHeartRateDataResponse.pbobjc.h"
 #import "ErrorMessageResponse.pbobjc.h"
 #import "UploadFailData.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - UploadHeartRateDataResponseRoot

@implementation UploadHeartRateDataResponseRoot

+ (GPBExtensionRegistry*)extensionRegistry {
  // This is called by +initialize so there is no need to worry
  // about thread safety and initialization of registry.
  static GPBExtensionRegistry* registry = nil;
  if (!registry) {
    GPBDebugCheckRuntimeVersion();
    registry = [[GPBExtensionRegistry alloc] init];
    [registry addExtensions:[ErrorMessageResponseRoot extensionRegistry]];
    [registry addExtensions:[UploadFailDataRoot extensionRegistry]];
  }
  return registry;
}

@end

#pragma mark - UploadHeartRateDataResponseRoot_FileDescriptor

static GPBFileDescriptor *UploadHeartRateDataResponseRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPBDebugCheckRuntimeVersion();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@""
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - UploadHeartRateDataResponseMessage

@implementation UploadHeartRateDataResponseMessage

@dynamic hasErrorMsg, errorMsg;
@dynamic successCount;
@dynamic failCount;
@dynamic failListArray, failListArray_Count;

typedef struct UploadHeartRateDataResponseMessage__storage_ {
  uint32_t _has_storage_[1];
  int32_t successCount;
  int32_t failCount;
  ErrorMessage *errorMsg;
  NSMutableArray *failListArray;
} UploadHeartRateDataResponseMessage__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "errorMsg",
        .dataTypeSpecific.className = GPBStringifySymbol(ErrorMessage),
        .number = UploadHeartRateDataResponseMessage_FieldNumber_ErrorMsg,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(UploadHeartRateDataResponseMessage__storage_, errorMsg),
        .flags = GPBFieldOptional | GPBFieldTextFormatNameCustom,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "successCount",
        .dataTypeSpecific.className = NULL,
        .number = UploadHeartRateDataResponseMessage_FieldNumber_SuccessCount,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(UploadHeartRateDataResponseMessage__storage_, successCount),
        .flags = GPBFieldOptional | GPBFieldTextFormatNameCustom,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "failCount",
        .dataTypeSpecific.className = NULL,
        .number = UploadHeartRateDataResponseMessage_FieldNumber_FailCount,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(UploadHeartRateDataResponseMessage__storage_, failCount),
        .flags = GPBFieldOptional | GPBFieldTextFormatNameCustom,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "failListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(UploadFailDataMessage),
        .number = UploadHeartRateDataResponseMessage_FieldNumber_FailListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(UploadHeartRateDataResponseMessage__storage_, failListArray),
        .flags = GPBFieldRepeated | GPBFieldTextFormatNameCustom,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[UploadHeartRateDataResponseMessage class]
                                     rootClass:[UploadHeartRateDataResponseRoot class]
                                          file:UploadHeartRateDataResponseRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(UploadHeartRateDataResponseMessage__storage_)
                                         flags:0];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\004\001\010\000\002\014\000\003\t\000\004\000failList\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)