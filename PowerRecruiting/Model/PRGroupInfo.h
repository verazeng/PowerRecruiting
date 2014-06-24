//
//  PRGroupInfo.h
//  PowerRecruiting
//
//  Created by Heng Zeng on 6/23/14.
//  Copyright (c) 2014 twzengheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    InterviewProgressNotBegin = 0,
    InterviewProgressGoing,
    InterviewProgressEnded
} InterviewProgress;

@interface PRGroupInfo : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSArray *members;
@property (nonatomic) InterviewProgress *progress;

@end
