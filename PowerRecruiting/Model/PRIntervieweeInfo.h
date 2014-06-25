//
//  PRIntervieweeInfo.h
//  PowerRecruiting
//
//  Created by Heng Zeng on 6/23/14.
//  Copyright (c) 2014 twzengheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    male = 0,
    female
} Gender;

@class PRCommentInfo;

@interface PRIntervieweeInfo : NSObject

@property (nonatomic) NSString *ID;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *age;
@property (nonatomic) Gender gender;
@property (nonatomic) PRCommentInfo *comment;

@end
