//
//  TcpCommandHelper.m
//  Vape
//
//  Created by Zhoucy on 2017/3/2.
//  Copyright © 2017年 YZH. All rights reserved.
//

#import "TcpCommandHelper.h"
#import "GCDAsyncSocket.h"
#import "Utility.h"


//===================================服务器地址与端口========================================
NSString   *const    SERVER_IP   = @"172.16.5.184";
const      int       SERVER_PORT = 9988;

//NSString   *const    SERVER_IP   = @"112.74.23.119";
//const      int       SERVER_PORT = 9989; //新测试端口
//========================================================================================


//=====================================超时常量值===========================================
const int SOCKET_WAIT_DATA_TIMEOUT = 80;        //等待超时时间，单位秒
const int SOCKET_READ_DATA_TIMEOUT = 95;        //读取超时时间, 单位秒
//========================================================================================

static TcpCommandHelper *shareTcpCommandHelper = nil;

@interface TcpCommandHelper ()<GCDAsyncSocketDelegate> {
    
    GCDAsyncSocket      *asyncSocket;
    
    NSMutableData       *bufferData;
    int                 needReceiveDataLength;
    int                 receivedDataLength;
    
    OperationCode       operationCode;
    NSData              *commandData;
}

@end

@implementation TcpCommandHelper

//=================================================================================================
#pragma mark - 获取对象
//=================================================================================================
/**
 * 获取公共的实例对象
 **/
+ (TcpCommandHelper *)shareTcpCommandHelperWithDelegate:(id<TcpCommandHelperDelegate>)delegate {
    
    static dispatch_once_t  predicate;
    if (shareTcpCommandHelper == nil) {
        dispatch_once(&predicate, ^{
            shareTcpCommandHelper = [[TcpCommandHelper alloc] init];
        });
    }
    
    [shareTcpCommandHelper setDelegate:delegate];
    return shareTcpCommandHelper;
}

/**
 * 获取一个新的实例对象
 **/
+ (TcpCommandHelper *)tcpCommandHelperWithDelegate:(id<TcpCommandHelperDelegate>)delegate {
    TcpCommandHelper *tcpCommandHelper = [[TcpCommandHelper alloc] init];
    [tcpCommandHelper setDelegate:delegate];
    return tcpCommandHelper;
}

- (instancetype)init {
    if (self =[super init]) {
        asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    return self;
}



//=================================================================================================
#pragma mark - 发送命令
//=================================================================================================
/**
 * 发送命令
 **/
- (void)sendCommand:(OperationCommand *)operationCommand {
    if ([AFNetworkReachabilityManager sharedManager].isReachable) {
        operationCode   = [operationCommand getOperationCode];
        commandData     = [operationCommand getCommandData];
//        DebugLog(@"%@", commandData);
        
        [asyncSocket disconnect];
        [self resetBuffer];
        
        NSError *error = nil;
        [asyncSocket connectToHost:SERVER_IP onPort:SERVER_PORT withTimeout:SOCKET_WAIT_DATA_TIMEOUT error:&error];
        if (error != nil) {
            
        }
    }
    else { //网络不可达
        if ([self.delegate respondsToSelector:@selector(didCommandFailWithErrorCode:andErrorMsg:andOpCode:)]) {
            [self.delegate didCommandFailWithErrorCode:ReturnErrorCodeNotNetwork andErrorMsg:@"没有网络，请检查您的网络" andOpCode:[operationCommand getOperationCode]];
        }
        
    }
}

- (void)sendCommandWithNoCheckNetworkStatus:(OperationCommand *)operationCommand {
    operationCode   = [operationCommand getOperationCode];
    commandData     = [operationCommand getCommandData];
//    DebugLog(@"%@", commandData);
    
    [asyncSocket disconnect];
    [self resetBuffer];
        
    NSError *error = nil;
    [asyncSocket connectToHost:SERVER_IP onPort:SERVER_PORT withTimeout:SOCKET_WAIT_DATA_TIMEOUT error:&error];
    if (error != nil) {
            
    }
}

/**
 * 关闭Socket连接
 **/
- (void)disConnect {
    if (asyncSocket.isConnected) {
        [self resetBuffer];
        [asyncSocket disconnect];
    }
}



//=================================================================================================
#pragma mark - GCDAsyncSocketDelegate
//=================================================================================================

/**
 * Called when a socket connects and is ready for reading and writing.
 **/
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    if (commandData != nil) {
        [asyncSocket writeData:commandData withTimeout:SOCKET_WAIT_DATA_TIMEOUT tag:operationCode];
        commandData = nil;
        [asyncSocket readDataToLength:(START_CODE_LENGTH + DATA_SIZE_VALUE_LENGTH + OPERATION_CODE_LENGTH) withTimeout:SOCKET_WAIT_DATA_TIMEOUT tag:operationCode];
    }
}

/**
 * Called when a socket has completed writing the requested data. Not called if there is an error.
 **/
- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    
}

/**
 * Called when a socket has written some data, but has not yet completed the entire write.
 * It may be used to for things such as updating progress bars.
 **/
- (void)socket:(GCDAsyncSocket *)sock didWritePartialDataOfLength:(NSUInteger)partialLength tag:(long)tag {
    
}

/**
 * Called when a socket has completed reading the requested data into memory. Not called if there is an error.
 **/
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    if (needReceiveDataLength == 0) {
        needReceiveDataLength = [self getDataLength:data];
        receivedDataLength =  DATA_SIZE_VALUE_LENGTH + OPERATION_CODE_LENGTH;
        bufferData = [NSMutableData new];
        
        [bufferData appendData:data];
        [asyncSocket readDataToLength:needReceiveDataLength - receivedDataLength withTimeout:SOCKET_READ_DATA_TIMEOUT tag:operationCode];
        return;
    }
    else {
        receivedDataLength = receivedDataLength + (int)data.length;
        [bufferData appendData:data];
        
        if (receivedDataLength < needReceiveDataLength) {
            [asyncSocket readDataToLength:needReceiveDataLength - receivedDataLength withTimeout:SOCKET_READ_DATA_TIMEOUT tag:operationCode];
            return;
        }
    }
    
    NSData *messageData = [self getMessageData:bufferData];
    OperationCode receivedOp = [self getOperationCode:bufferData];
    if (messageData != nil && [OperationCommand isOperationCode:receivedOp]) {
        if ([self.delegate respondsToSelector:@selector(didCommandSuccessWithResult:andOpCode:)]) {
            [self.delegate didCommandSuccessWithResult:messageData andOpCode:receivedOp];
        }
    }
    else {
        if ([self.delegate respondsToSelector:@selector(didCommandFailWithErrorCode:andErrorMsg:andOpCode:)]) {
            [self.delegate didCommandFailWithErrorCode:ReturnErrorCodeUserDataError andErrorMsg:@"" andOpCode:[OperationCommand isOperationCode:receivedOp]?operationCode:receivedOp];
        }
    }
    
}

/**
 * Called when a socket has read in data, but has not yet completed the read.
 * This would occur if using readToData: or readToLength: methods.
 * It may be used to for things such as updating progress bars.
 **/
- (void)socket:(GCDAsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag {
    //    [asyncSocket readDataToLength:2 withTimeout:SOCKET_READ_DATA_TIMEOUT tag:operationCode];
}

/**
 * Called when a socket disconnects with or without error.
 **/
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    if (err) {
        if ([err.description rangeOfString:@"Socket closed by remote peer" options:NSCaseInsensitiveSearch].length > 0) {
            
        }
        else {
            [self.delegate didCommandFailWithErrorCode:err.code andErrorMsg:err.localizedDescription andOpCode:operationCode];
        }
    }
}


/**
 * 重置消息缓冲区
 **/
- (void)resetBuffer {
    bufferData              = [NSMutableData new];
    needReceiveDataLength   = 0;
    receivedDataLength      = 0;
}

/**
 * 从消息头部中获取消息长度
 **/
- (int)getDataLength:(NSData *)receivedData {
    int dataLength = 0;
    [receivedData getBytes:&dataLength range:NSMakeRange(START_CODE_LENGTH, DATA_SIZE_VALUE_LENGTH)];
    return NSSwapBigIntToHost(dataLength);
}

/**
 * 从消息头部中获取操作码
 **/
- (OperationCode)getOperationCode:(NSData *)receivedData {
    int opCodeValue = 0;
    [receivedData getBytes:&opCodeValue range:NSMakeRange(START_CODE_LENGTH + DATA_SIZE_VALUE_LENGTH, OPERATION_CODE_LENGTH)];
    return NSSwapBigIntToHost(opCodeValue);
}

/**
 * 从收到的数据中取出消息正文部分
 **/
- (NSData *)getMessageData:(NSData *)receivedData {
    int dataLength = [self getDataLength:receivedData];
    if (dataLength + START_CODE_LENGTH <= receivedData.length) {
        NSData *messageData = [receivedData subdataWithRange:NSMakeRange((START_CODE_LENGTH + DATA_SIZE_VALUE_LENGTH + OPERATION_CODE_LENGTH), (dataLength - (DATA_SIZE_VALUE_LENGTH + OPERATION_CODE_LENGTH)))];
        return messageData;
    }
    else {
        return nil;
    }
}

/**
 * 对消息正文内容进行解码
 **/
- (id)deCodeMessageData:(NSData *)messageData {
    
    return nil;
}


@end
