//
//  PRGroupManager.h
//  PowerRecruiting
//
//  Created by Heng Zeng on 6/24/14.
//  Copyright (c) 2014 twzengheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRGroupManager : NSObject

@property (nonatomic) NSArray *groupListArray;

+ (PRGroupManager *)shareIntance;

@end
