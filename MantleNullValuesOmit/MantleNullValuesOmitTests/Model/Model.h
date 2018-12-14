//
//  Model.h
//  MantleNullValuesOmitTests
//
//  Created by dimon on 13/12/2018.
//  Copyright © 2018 dimon. All rights reserved.
//

#import <Mantle/Mantle.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic, readwrite) NSNumber *modelId;
@property (strong, nonatomic, readwrite) NSString *name;
@property (strong, nonatomic, readwrite) NSString *info;
@property (assign, nonatomic, readwrite) BOOL enabled;

@end

NS_ASSUME_NONNULL_END
