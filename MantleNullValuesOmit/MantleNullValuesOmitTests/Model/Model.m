//
//  Model.m
//  MantleNullValuesOmitTests
//
//  Created by dimon on 13/12/2018.
//  Copyright © 2018 dimon. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"modelId" : @"modelId",
             @"name" : @"name",
             @"info" : @"info",
             @"enabled" : @"enabled",
             @"innerModel" : @"innerModel"};
}

@end
