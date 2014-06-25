//
//  PRGroupManager.m
//  PowerRecruiting
//
//  Created by Heng Zeng on 6/24/14.
//  Copyright (c) 2014 twzengheng. All rights reserved.
//

#import "PRGroupManager.h"
#import "PRGroupInfo.h"
#import "PRIntervieweeInfo.h"

@interface PRGroupManager()

@end

@implementation PRGroupManager

+ (PRGroupManager *)shareIntance
{
    static PRGroupManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[PRGroupManager alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self fetchGroupListData];
    }
    return self;
}

- (NSArray *)fetchGroupListData
{
    if (!_groupListArray) {
        self.groupListArray = [self parseGroupListData];
    }
    
    return _groupListArray;
}

- (NSData *)getDefaultGroupListData
{
    NSError *error;
    NSStringEncoding endcode = NSUTF8StringEncoding;
    NSString *groupListStr = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testData" ofType:@"txt"] usedEncoding:&endcode error:&error];
    return [groupListStr dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSArray *)parseGroupListData
{
    NSMutableArray *groupListArray = nil;
    NSData *groupListData = [self getDefaultGroupListData];
    
    NSError *jsonErr;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:groupListData options:NSJSONReadingMutableContainers error:&jsonErr];
    if (!jsonErr) {
        if ([jsonObj isKindOfClass:[NSArray class]]) {
            NSArray *jsonArray = jsonObj;
            groupListArray = [NSMutableArray arrayWithCapacity:[jsonArray count]];
            for (NSDictionary *groupDic in jsonArray) {
                if ([groupDic isKindOfClass:[NSDictionary class]]) {
                    PRGroupInfo *groupInfo = [[PRGroupInfo alloc] init];
                    groupInfo.name = (NSString *)[groupDic objectForKey:@"groupName"];
                    groupInfo.progress = [(NSNumber *)[groupDic objectForKey:@"progress"] integerValue];
                    
                    NSMutableArray *intervieweeArray = nil;
                    NSArray *jsonIntervieweeArray = (NSArray *)[groupDic objectForKey:@"members"];
                    if ([jsonIntervieweeArray isKindOfClass:[NSArray class]]) {
                        intervieweeArray = [NSMutableArray arrayWithCapacity:[jsonIntervieweeArray count]];
                        for (NSDictionary *jsonIntervieweeDic in jsonIntervieweeArray) {
                            if ([jsonIntervieweeDic isKindOfClass:[NSDictionary class]]) {
                                PRIntervieweeInfo *intervieweeInfo = [[PRIntervieweeInfo alloc] init];
                                intervieweeInfo.ID = (NSString *)[jsonIntervieweeDic objectForKey:@"id"];
                                intervieweeInfo.name = (NSString *)[jsonIntervieweeDic objectForKey:@"name"];
                                intervieweeInfo.age = (NSString *)[jsonIntervieweeDic objectForKey:@"age"];
                                intervieweeInfo.gender = [(NSNumber *)[jsonIntervieweeDic objectForKey:@"gender"] integerValue];
                                
                                [intervieweeArray addObject:intervieweeInfo];
                            }
                        }
                        groupInfo.members = intervieweeArray;
                    }
                    
                    [groupListArray addObject:groupInfo];
                }
            }
        }
    }

    return groupListArray;
}

@end
