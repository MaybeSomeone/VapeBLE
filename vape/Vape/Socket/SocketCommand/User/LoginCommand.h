//
//  LoginCommand.h
//  Vape
//
//  Created by Zhoucy on 2017/3/2.
//  Copyright © 2017年 YZH. All rights reserved.
//

#import "OperationCommand.h"

@interface LoginCommand : OperationCommand

- (instancetype)initLoginCommandWithPhone:(NSString *)phone Password:(NSString *)password;

@end
