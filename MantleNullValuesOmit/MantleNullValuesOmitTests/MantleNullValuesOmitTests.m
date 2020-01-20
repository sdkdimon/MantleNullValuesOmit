//
//  MantleNullValuesOmitTests.m
//  MantleNullValuesOmitTests
//
//  Created by dimon on 13/12/2018.
//  Copyright © 2018 dimon. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Model/Model.h"
#import <MantleNullValuesOmit/MantleNullValuesOmit.h>

@interface MantleNullValuesOmitTests : XCTestCase

@property (strong, nonatomic, readwrite) NSMutableArray <NSNumber *> *testArray;

@end

@implementation MantleNullValuesOmitTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.testArray = [NSMutableArray array];
    for (int i = 0; i < 1000000; i++)
    {
        [self.testArray addObject:@(i)];
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testOmitByDefaultEnabled {
    Model *model = [[Model alloc] init];
    XCTAssertEqual(model.isOmitNullValues, YES, "MTL model omit default value NO");
}

- (void)testNullOmittingSingleModel
{
    NSString *modelInfo = @"Model info";
    Model *model = [[Model alloc] init];
    model.info = modelInfo;
    model.enabled = YES;
    
    NSDictionary *JSONModel = [MTLJSONAdapter JSONDictionaryFromModel:model error:nil];
    
    XCTAssertEqual([JSONModel objectForKey:@"modelId"], nil, "Model modelId property must be nil");
    XCTAssertEqual([JSONModel objectForKey:@"name"], nil, "Model name property must be nil");
    XCTAssertEqual([JSONModel objectForKey:@"info"], modelInfo, "Model name property must be equal to modelInfo");
    XCTAssertEqual([[JSONModel objectForKey:@"enabled"] boolValue], YES, "Model enabled property must be equal to YES");
}

- (void)testNullOmittingArrayModel
{
    NSString *modelInfo = @"Model info";
    NSMutableArray <Model *> *models = [[NSMutableArray alloc] init];
    for (NSUInteger idx = 0; idx < 5; idx ++)
    {
        
        Model *model = [[Model alloc] init];
        model.info = modelInfo;
        model.enabled = YES;
        [models addObject:model];
    }
    
    NSArray *JSONArray = [MTLJSONAdapter JSONArrayFromModels:models error:nil];
    
    for (NSDictionary *JSONModel in JSONArray)
    {
        XCTAssertEqual([JSONModel objectForKey:@"modelId"], nil, "Model modelId property must be nil");
        XCTAssertEqual([JSONModel objectForKey:@"name"], nil, "Model name property must be nil");
        XCTAssertEqual([JSONModel objectForKey:@"info"], modelInfo, "Model name property must be equal to modelInfo");
        XCTAssertEqual([[JSONModel objectForKey:@"enabled"] boolValue], YES, "Model enabled property must be equal to YES");
    }
    
}

- (void)testNullOmittingFromJSONDictionaryToModel
{
    NSDictionary *JSON = @{@"modelId" : NSNull.null,
                           @"name" : @"Carl",
                           @"info" : @"Test model",
                           @"enabled" : NSNull.null,
                           @"innerModel" : @{@"modelId" : NSNull.null,
                                             @"name" : NSNull.null,
                                             @"info" : NSNull.null,
                                             @"enabled" : NSNull.null,
                                             @"innerModel" : NSNull.null}
    };
    
    Model *model = [MTLJSONAdapter modelOfClass:Model.class fromJSONDictionary:JSON error:nil];
    XCTAssertNil(model.modelId);
    XCTAssertFalse(model.enabled);
    XCTAssertEqualObjects(model.name, @"Carl");
    XCTAssertEqualObjects(model.info, @"Test model");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
