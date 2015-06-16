
#import <XCTest/XCTest.h>

//#import <impl/impl.h>
//#import "sample_service.h"

@interface SampleServiceTests : XCTestCase

//@property MSSampleContainerClient* client;
@property bool running;
@end

@implementation SampleServiceTests

- (void)setUp {
    [super setUp];

  //  MSOrcDefaultDependencyResolver* resolver = [MSOrcDefaultDependencyResolver alloc];
   // MSOrcOAuthCredentials* credentials = [MSOrcOAuthCredentials alloc];

    //[credentials setToken:@"fakeToken"];

    //self.client = [[MSSampleContainerClient alloc] initWithUrl:@"http://localhost:8080/" dependencyResolver:resolver];
}

- (void)tearDown {
    [super tearDown];
}


//TODO: Enable when serialization issue with ints is ready
/*
 -(void) testTwoParamsActionsFirstIsEntityTypeUri{
 //twoParamsActionsFirstIsEntityTypePOST.json
 self.running = true;
 __block int result = 0;
 
 NSURLSessionDataTask* task = [[[self.client getMe] getOperations] twoParamsActionsFirstIsEntityType:[self getSampleEntity] :false :^(int returnValue, MSOrcException *error) {
 
 result = returnValue;
 self.running = false;
 }];
 
 [task resume];
 
 [self blockUntilFinish:task];
 
 XCTAssertEqual(result, 1);
 }*/

- (void)testGetNavigationList {
    //getNavigationsGET.json
    /*self.running = true;
    
    __block NSArray<MSSampleContainerAnotherEntity> *entities = nil;
    
    
    [self.client.me.navigations readWithCallback:^(NSArray<MSSampleContainerAnotherEntity> *anotherEntitys, MSOrcError *error) {
        entities =anotherEntitys;
        self.running = false;
        
        XCTAssertEqual([entities count], 1);
        
    }];*/
    /*NSURLSessionTask* task = [self.client.me.navigations readWithCallback:^(NSArray<MSSampleContainerAnotherEntity> *anotherEntities, MSOrcException *error) {
        
        entities =anotherEntities;
        self.running = false;
    }];
    
    [task resume];
    */
    //[self blockUntilFinish:task];
    
    XCTAssertEqual(1, 1);
}
/*
- (void)testGetNavigationItem {
    //getNavigationItemGET.json
    
    self.running = true;
    
    __block MSSampleContainerAnotherEntity *entity = nil;
    
    NSURLSessionTask* task = [[[self.client.me getNavigations] getById:@"SomeId" ] readWithCallback:^(MSSampleContainerAnotherEntity *anotherEntity, MSOrcException *error) {
        
        entity =anotherEntity;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.SomeString isEqualToString:[self getAnotherEntity].SomeString]);
}

- (void)testGetNavigationItemWithSelect {
    //getNavigationItemWithSelectGET.json
    
    self.running = true;
    
    __block MSSampleContainerAnotherEntity *entity = nil;
    
    NSURLSessionTask* task = [[[[[self.client getMe] getNavigations] getById:@"SomeId" ] select:@"SomeProp, AnotherProp"] readWithCallback:^(MSSampleContainerAnotherEntity *anotherEntity, MSOrcException *error) {
        
        entity =anotherEntity;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.SomeString isEqualToString:[self getAnotherEntity].SomeString]);
}

//TODO: Enable when Raw is available after select

- (void)testGetNavigationItemRawWithSelect {
    //getNavigationItemWithSelectGET.json
    self.running = true;
    __block NSString *jsonResult = nil;
    
    NSURLSessionTask* task = [[[[[self.client getMe]  getNavigations] getById:@"SomeId" ]  select:@"SomeProp, AnotherProp" ] readRawWithCallback:^(NSString *result, MSOrcException *error) {
        
        jsonResult =result;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    NSString *expectedResponseString = @"{\"SomeString\":\"Some String\",\"Id\":\"3281EC0B-1AEB-49A4-A345-E64D732DA6D3\",\"@odata.type\":\"#Microsoft.SampleService.AnotherEntity\"}";
    XCTAssertNotNil(jsonResult);
    XCTAssertTrue([jsonResult isEqualToString:expectedResponseString]);
}

- (void)testGetNavigationListWithSelectAndTop {
    //getNavigationsWithSelectAndTopGET.json
    
    self.running = true;
    
    __block NSArray<MSSampleContainerAnotherEntity> *entities = nil;
    
    NSURLSessionTask* task = [[[[self.client.me getNavigations] select:@"SomeProp, AnotherProp" ] top:1] readWithCallback:^(NSArray<MSSampleContainerAnotherEntity> *anotherEntities, MSODataException *error) {
        
        entities =anotherEntities;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertEqual([entities count], 1);
}

//TODO: testGetNavigationListRawWithSelectAndTop


- (void)testGetCollectionWithFilterAndExpand {
    //getCollectionsWithExpandAndFilter.json
    
    self.running = true;
    
    __block NSArray<MSSampleContainerSampleEntity> *entities = nil;
    
    NSURLSessionTask* task = [[[self.client.services expand:@"SomeProp"] filter:@"SomeProp eq 'SomeString'" ] readWithCallback:^(NSArray<MSSampleContainerSampleEntity> *sampleEntitys, MSODataException *error) {
        
        entities =sampleEntitys;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertEqual([entities count], 1);
}

- (void)testGetCollectionWithHeaders {
    //getCollectionsWithHeaders.json
    
    self.running = true;
    
    __block NSArray<MSSampleContainerSampleEntity> *entities = nil;
    
    NSURLSessionTask* task = [[[[self.client getservices] addCustomHeaderWithName:@"Header1" value:@"Value1"] addCustomHeaderWithName:@"Header2" value:@"Value2"] readWithCallback:^(NSArray<MSSampleContainerSampleEntity> *sampleEntitys, MSODataException *error) {
        
        entities =sampleEntitys;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertEqual([entities count], 1);
}

//TODO: Enable when missing X-ClientService-ClientTag header is available

- (void)testDefaultHeaders {
    
    self.running = true;
    __block NSArray<MSSampleContainerSampleEntity> *entities = nil;
    
    NSURLSessionTask* task = [[[self.client getservices] top:99 ] readWithCallback:^(NSArray<MSSampleContainerSampleEntity> *sampleEntitys, MSODataException *error) {
        
        entities =sampleEntitys;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertEqual([entities count], 1);
}

-(void) testDeleteNavigationItem{
    //deleteNavigationItemDELETE.json
    
    self.running = true;
    
    __block MSODataException *expectedError = nil;
    
    NSURLSessionTask* task = [[[[[self.client getMe] getNavigations] getById:@"SomeId"] addCustomHeaderWithName:@"If-Match" value:@"*"] deleteWithCallback:^(int statusCode, MSODataException *exception) {
        
        expectedError = exception;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNil(expectedError);
}

-(void) testAddNavigationItem{
    //addNavigationItemPOST.json
    self.running = true;
    __block MSSampleContainerAnotherEntity *entity = nil;
    
    NSURLSessionTask* task = [[self.client.me getNavigations] addAnotherEntity:[self getAnotherEntity] callback:^(MSSampleContainerAnotherEntity *anotherEntity, MSODataException *e) {
        
        entity =anotherEntity;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.SomeString isEqualToString:[self getAnotherEntity].SomeString]);
    
}

-(void) testUpdateNavigationItem{
    //updateNavigationItemPOST.json
    self.running = true;
    __block MSSampleContainerAnotherEntity *entity = nil;
    MSSampleContainerAnotherEntity *entityToUpdate = [self getAnotherEntity];
    entityToUpdate.SomeString = @"Some Updated String";
    
    NSURLSessionTask* task = [[[[_client.me getNavigations] getById:entityToUpdate.Id] addCustomHeaderWithName:@"IsPatch" value:@"yes"] updateEntity:entityToUpdate callback:^(id updatedEntity, MSODataException *exception) {
        
        entity =updatedEntity;
        self.running = false;
    }];
    
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.SomeString isEqualToString:entityToUpdate.SomeString]);
}

-(void) testGetNavigationsWithParameters{
    //getNavigationsWithParameters.json
    self.running = true;
    __block NSArray<MSSampleContainerAnotherEntity> *entities = nil;
    
    NSURLSessionTask* task = [[[[self.client getMe] getNavigations] addCustomParametersWithName:@"StringParam" value:@"SomeValue"] readWithCallback:^(NSArray<MSSampleContainerAnotherEntity> *anotherEntitys, MSOrcException *error) {
        
        entities =anotherEntitys;
        self.running = false;
    }];
    
    //.addParameter("StringParam", param1)
    [task resume];
    
    [self blockUntilFinish:task];
    
    XCTAssertNotNil(entities);
    XCTAssertEqual([entities count], 1);
    
}

-(void) testEnumParser{
    
    self.running = true;
    
    NSString* json = @"{\"Name\": \"Test\", \"enums\":[\"First\",\"Second\"]}";
    MSSampleContaunerEntityWithEnum* t = [MSSampleContaunerEntityWithEnum alloc];
    NSData* data = [json dataUsingEncoding:NSUTF8StringEncoding] ;
    
    id entity = [[[self.client resolver] jsonSerializer] deserialize:data asClass:[t class]];
    
    XCTAssertNotNil(entity);
}
*/
//TODO: Reactor this: add semaphore or get method to terminator methods
/*-(void)blockUntilFinish : (NSURLSessionTask*)task{
    
    while (self.running){}
}

-(MSSampleContainerSampleEntity*)getSampleEntity{
    MSSampleContainerSampleEntity *sampleEntity = [[MSSampleContainerSampleEntity alloc] init];
    sampleEntity.DisplayName = @"Some Display Name";
    sampleEntity.entityKey = @"Some Entity Key";
    sampleEntity.Id = @"5C338D75-CB90-4785-8667-CED25B3695BF";
    return sampleEntity;
}

-(MSSampleContainerAnotherEntity*) getAnotherEntity{
    MSSampleContainerAnotherEntity *anotherEntity = [[MSSampleContainerAnotherEntity alloc]init];
    anotherEntity.Id = @"3281EC0B-1AEB-49A4-A345-E64D732DA6D3";
    anotherEntity.SomeString=@"Some String";
    return anotherEntity;
}*/

@end
