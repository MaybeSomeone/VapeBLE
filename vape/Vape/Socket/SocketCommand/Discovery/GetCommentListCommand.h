//
//  GetCommentListCommand.h
//  Vape
//
//  Created by Zhoucy on 2017/3/2.
//  Copyright © 2017年 YZH. All rights reserved.
//

#import "OperationCommand.h"

@interface GetCommentListCommand : OperationCommand

- (instancetype)initGetCommentListCommandWithSession:(NSString *)session BlogId:(long long)blogId PageIndex:(NSInteger)pageIndex;

@end
