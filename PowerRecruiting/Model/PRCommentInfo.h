//
//  PRCommentInfo.h
//  PowerRecruiting
//
//  Created by Heng Zeng on 6/23/14.
//  Copyright (c) 2014 twzengheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    CommentRankFail = 1,
    CommentRankCommon,
    CommentRankPast,
} CommentRank;

@interface PRCommentInfo : NSObject

@property (assign) float grade;
@property (assign) CommentRank rank;
@property (nonatomic) NSString *commenKeywords;

@end
