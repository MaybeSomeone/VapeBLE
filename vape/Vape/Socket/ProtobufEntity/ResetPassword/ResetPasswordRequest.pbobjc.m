// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: ResetPasswordRequest.proto

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

 #import "ResetPasswordRequest.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - ResetPasswordRequestRoot

@implementation ResetPasswordRequestRoot

@end

#pragma mark - ResetPasswordRequestRoot_FileDescriptor

static GPBFileDescriptor *ResetPasswordRequestRoot_FileDescriptor(void) {
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

#pragma mark - ResetPasswordRequestMessage

@implementation ResetPasswordRequestMessage

@dynamic phone;
@dynamic password;

typedef struct ResetPasswordRequestMessage__storage_ {
  uint32_t _has_storage_[1];
  NSString *phone;
  NSString *password;
} ResetPasswordRequestMessage__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "phone",
        .dataTypeSpecific.className = NULL,
        .number = ResetPasswordRequestMessage_FieldNumber_Phone,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ResetPasswordRequestMessage__storage_, phone),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "password",
        .dataTypeSpecific.className = NULL,
        .number = ResetPasswordRequestMessage_FieldNumber_Password,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(ResetPasswordRequestMessage__storage_, password),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ResetPasswordRequestMessage class]
                                     rootClass:[ResetPasswordRequestRoot class]
                                          file:ResetPasswordRequestRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ResetPasswordRequestMessage__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
