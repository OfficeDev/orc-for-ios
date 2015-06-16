//
//  core_testsTests.m
//  core_testsTests
//
//  Created by Anahi Hojnadel on 6/12/15.
//  Copyright (c) 2015 MSOpenTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface core_testsTests : XCTestCase

@end

@implementation core_testsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testGetNavigationList {
    XCTAssertEqual(1, 1);
}

@end
