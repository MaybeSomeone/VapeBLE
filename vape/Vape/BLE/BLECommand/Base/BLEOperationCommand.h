//
//  BLEOperationCommand.h
//  Vape
//
//  Created by Zhoucy on 2017/3/2.
//  Copyright © 2017年 YZH. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const int   kCommandLength;
extern const int   kPayloadLength;
extern const Byte  kSTART_CODE;

/** 操作码 这是在蓝牙中需要传入的操作码*/
typedef NS_ENUM(UInt16, BLEOperationCode) {
    ///绑定设备
    BLEOperationCodeBindDevice     = 0x0A01,
    //首页会操作的命令
    BLEOperationCodeGetDeviceInfo  = 0x1F01,
    BLEOperationCodeGetPowerInfo   = 0x06C1,
    BLEOperationCodeGetVoltageInfo = 0x06C2,
    BLEOperationCodeGetCentigrade  = 0x06C3,
    BLEOperationCodeGetFahreheit   = 0x06C4,
    BLEOperationCodeGetRVW         = 0x06C5,
    BLEOperationCodeGetRVV         = 0x06C6
};

typedef NS_ENUM(NSInteger, BLEDeviceWorkMode) {
    BLEDeviceWorkModePower              = 0x01,//功率模式
    BLEDeviceWorkModeDegreesCentigrade  = 0x02,//温度：摄氏度
    BLEDeviceWorkModeDegreesFahrenheit  = 0x03//温度：华氏度
};


@interface BLEOperationCommand : NSObject {

@protected
    Byte                sessionNo; //会话标识
    BLEOperationCode    bleOpCode;
    Byte                payloadBuffer[16];
    Byte                macAddressBytes[6];    //设备的MAC地址
    
}

///get command data
- (NSData *)getCommandData;
///get command operationcode
- (BLEOperationCode)getOperationCode;

@end

/////异或加密函数
//void XOREncrypt(uint8_t *src, uint8_t *dst, uint8_t len) {
//    Uint8_t i = 0;
//    For(i = 0; i < len; i++)
//    {
//        *(dst+i) = *(src+i)^ MAC_last_3Byte [i%sizeof(MAC_last_3Byte)];
//    }
//}
/////异或解密函数
//#define XORDecrypt(src,dst,len) XOREncrypt(src,dst,len)
