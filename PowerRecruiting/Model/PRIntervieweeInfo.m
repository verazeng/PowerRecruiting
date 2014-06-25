//
//  PRIntervieweeInfo.m
//  PowerRecruiting
//
//  Created by Heng Zeng on 6/23/14.
//  Copyright (c) 2014 twzengheng. All rights reserved.
//

#import "PRIntervieweeInfo.h"

@implementation PRIntervieweeInfo

- (NSString *)description
{
    NSMutableString *desc = [NSMutableString stringWithFormat:@"id:%@", _ID];
    [desc appendFormat:@",name%@", _name];
    [desc appendFormat:@",name:%ld", _gender];
    [desc appendFormat:@",age:%@", _age];
    [desc appendFormat:@",comment:%@", _comment];
    
    return desc;
}

@end
