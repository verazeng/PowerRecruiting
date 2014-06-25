//
//  PRGroupInfo.m
//  PowerRecruiting
//
//  Created by Heng Zeng on 6/23/14.
//  Copyright (c) 2014 twzengheng. All rights reserved.
//

#import "PRGroupInfo.h"

@implementation PRGroupInfo

- (NSString *)description
{
    NSMutableString *desc = [NSMutableString stringWithFormat:@"name:%@", _name];
    [desc appendFormat:@",progress:%ld", _progress];
    [desc appendFormat:@",members:%@", _members];
    
    return desc;
}

- (NSString *)getProgressDescription
{
    NSString *progressStr = nil;
    switch (_progress) {
        case InterviewProgressNotBegin:
            progressStr = @"面试未开始";
            break;
        case InterviewProgressGoing:
            progressStr = @"面试进行中";
            break;
        case InterviewProgressEnded:
            progressStr = @"面试结束";
            break;
        default:
            break;
    }
    return progressStr;
}
@end
