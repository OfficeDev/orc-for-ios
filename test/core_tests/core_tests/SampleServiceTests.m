
#import <XCTest/XCTest.h>

#import <impl/impl.h>
#import "MSSampleService.h"

@interface SampleServiceTests : XCTestCase

@property MSSampleServiceClient *client;
@property bool running;

@end

@implementation SampleServiceTests

- (void)setUp {
    [super setUp];
    
    MSOrcDefaultDependencyResolver* resolver = [MSOrcDefaultDependencyResolver alloc];
    MSOrcOAuthCredentials* credentials = [MSOrcOAuthCredentials alloc];
    
    [credentials setToken:@"fakeToken"];
    
    self.client = [[MSSampleServiceClient alloc] initWithUrl:@"http://localhost:8080/" dependencyResolver:resolver];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testTwoParamsActionsFirstIsEntityTypeUri {
    //twoParamsActionsFirstIsEntityTypePOST.json
    self.running = true;
    
    __block int result = 0;
     
    [self.client.me.operations twoParamsActionsFirstIsEntityTypeWithAnEntity:[self getSampleEntity] booleanParams:false callback:^(int returnValue, MSOrcError *error) {
        
        result = error == nil ? 1 :0;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertEqual(result, 1);
}

- (void)testGetNavigationList {
    //getNavigationsGET.json
    self.running = true;
    
    __block NSArray *entities = nil;
    
    [self.client.me.navigations readWithCallback:^(NSArray *anotherEntitys, MSOrcError *error) {
        
        entities =anotherEntitys;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertEqual([entities count], 1);
}

- (void)testGetNavigationItem {
    //getNavigationItemGET.json
    
    self.running = true;
    
    __block MSSampleServiceAnotherEntity *entity = nil;
    
    [[self.client.me.navigations getById:@"SomeId"] readWithCallback:^(MSSampleServiceAnotherEntity *anotherEntity, MSOrcError *error) {
        
        entity =anotherEntity;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.someString isEqualToString:[self getAnotherEntity].someString]);
}

- (void)testGetNavigationItemWithSelect {
    //getNavigationItemWithSelectGET.json
    
    self.running = true;
    
    __block MSSampleServiceAnotherEntity *entity = nil;
    
    [[[self.client.me.navigations getById:@"SomeId"] select:@"SomeProp, AnotherProp"] readWithCallback:^(MSSampleServiceAnotherEntity *anotherEntity, MSOrcError *error) {
        
        entity =anotherEntity;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.someString isEqualToString:[self getAnotherEntity].someString]);
}

//TODO: Enable when Raw is available after select

- (void)testGetNavigationItemRawWithSelect {
    //getNavigationItemWithSelectGET.json
    
    self.running = true;
    __block NSString *jsonResult = nil;
    
    [[[self.client.me.navigations getById:@"SomeId"]  select:@"SomeProp, AnotherProp" ] readRawWithCallback:^(NSString *result, MSOrcError *error) {
        
        jsonResult =result;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    NSString *expectedResponseString = @"{\"SomeString\":\"Some String\",\"Id\":\"3281EC0B-1AEB-49A4-A345-E64D732DA6D3\",\"@odata.type\":\"#Microsoft.SampleService.AnotherEntity\"}";
    
    XCTAssertNotNil(jsonResult);
    XCTAssertTrue([jsonResult isEqualToString:expectedResponseString]);
}

- (void)testGetNavigationListWithSelectAndTop {
    //getNavigationsWithSelectAndTopGET.json
    
    self.running = true;
    
    __block NSArray *entities = nil;
    
    [[[self.client.me.navigations select:@"SomeProp, AnotherProp"] top:1] readWithCallback:^(NSArray *anotherEntities, MSOrcError *error) {
        
        entities =anotherEntities;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertEqual([entities count], 1);
}

//TODO: testGetNavigationListRawWithSelectAndTop


- (void)testGetCollectionWithFilterAndExpand {
    //getCollectionsWithExpandAndFilter.json
    
    self.running = true;
    
    __block NSArray *entities = nil;
    
    [[[self.client.services expand:@"SomeProp"] filter:@"SomeProp eq 'SomeString'"] readWithCallback:^(NSArray *sampleEntitys, MSOrcError *error) {
        
        entities =sampleEntitys;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertEqual([entities count], 1);
}

- (void)testGetCollectionWithHeaders {
    //getCollectionsWithHeaders.json
    
    self.running = true;
    
    __block NSArray *entities = nil;
    
    [[[self.client.services addCustomHeaderWithName:@"Header1" value:@"Value1"]
                            addCustomHeaderWithName:@"Header2" value:@"Value2"]
                                   readWithCallback:^(NSArray *sampleEntitys, MSOrcError *error) {
        
        entities =sampleEntitys;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertEqual([entities count], 1);
}

//TODO: Enable when missing X-ClientService-ClientTag header is available

- (void)testDefaultHeaders {
    
    self.running = true;
    __block NSArray *entities = nil;
    
    [[self.client.services top:99] readWithCallback:^(NSArray *sampleEntitys, MSOrcError *error) {
        
        entities =sampleEntitys;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertEqual([entities count], 1);
}

-(void) testDeleteNavigationItem{
    //deleteNavigationItemDELETE.json
    
    self.running = true;
    
    __block MSOrcError *expectedError = nil;
    
    [[[self.client.me.navigations getById:@"SomeId"] addCustomHeaderWithName:@"If-Match" value:@"*"] deleteWithCallback:^(int statusCode, MSOrcError *error) {
        
        expectedError = error;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertNil(expectedError);
}

-(void) testAddNavigationItem{
    //addNavigationItemPOST.json
    self.running = true;
    __block MSSampleServiceAnotherEntity *entity = nil;
    __weak SampleServiceTests *weakS = self;
    [self.client.me.navigations add:[self getAnotherEntity] callback:^(MSSampleServiceAnotherEntity *anotherEntity, MSOrcError *e) {
        
        entity =anotherEntity;
        weakS.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.someString isEqualToString:[self getAnotherEntity].someString]);
    
}

-(void) testUpdateNavigationItem{
    //updateNavigationItemPOST.json
    self.running = true;
    __block MSSampleServiceAnotherEntity *entity = nil;
    MSSampleServiceAnotherEntity *entityToUpdate = [self getAnotherEntity];
    entityToUpdate.SomeString = @"Some Updated String";
    
    [[[_client.me.navigations getById:entityToUpdate._id]
      addCustomHeaderWithName:@"IsPatch" value:@"yes"]
                       update:entityToUpdate callback:^(id updatedEntity, MSOrcError *error) {
        
        entity =updatedEntity;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertNotNil(entity);
    XCTAssertTrue([entity.someString isEqualToString:entityToUpdate.someString]);
}

-(void) testGetNavigationsWithParameters{
    //getNavigationsWithParameters.json
    self.running = true;
    __block NSArray *entities = nil;
    
    [[self.client.me.navigations addCustomParametersWithName:@"StringParam" value:@"SomeValue"] readWithCallback:^(NSArray *anotherEntitys, MSOrcError *error) {
        
        entities =anotherEntitys;
        self.running = false;
    }];
    
    [self blockUntilFinish];
    
    XCTAssertNotNil(entities);
    XCTAssertEqual([entities count], 1);
    
}

-(void) testGetAndUpdateNestedEntity{
    //getSampleEntity.json
    //updateSampleEntityPATCH.json
    
    self.running = true;
    __block MSSampleServiceSampleEntity *sampleEntity = nil;
    __block MSSampleServiceSampleEntity *updatedSampleEntity = nil;
    
    [[self.client.me addCustomHeaderWithName:@"WithNested" value:@"no"] readWithCallback:^(MSSampleServiceSampleEntity *entity, MSOrcError *error) {
        sampleEntity = entity;
        //sampleEntity.Id = @"TestId";
        [sampleEntity setNestedSampleEntity:[self getSampleEntity]];
        
        [[self.client.me addCustomHeaderWithName:@"UpdateNested" value:@"no" ] update:sampleEntity callback:^(MSSampleServiceSampleEntity *updated, MSOrcError *error) {
            updatedSampleEntity = updated;
            self.running = false;
        }];
        
    }];
    
    [self blockUntilFinish];
    
    XCTAssertNotNil(sampleEntity);
    XCTAssertNotNil(updatedSampleEntity);
}

-(void) testGetAndUpdatePropertyInNestedEntity{
    //getSampleEntityWithNestedGET.json
    //updateSampleEntityNestedPropertyChangedPATCH.json
    
    self.running = true;
    __block MSSampleServiceSampleEntity *sampleEntity = nil;
    __block MSSampleServiceSampleEntity *updatedSampleEntity = nil;
    
    [[self.client.me addCustomHeaderWithName:@"WithNested" value:@"yes"] readWithCallback:^(MSSampleServiceSampleEntity *entity, MSOrcError *error) {
        sampleEntity = entity;
        entity.nestedSampleEntity.DisplayName = @"New Name";
        
        [[self.client.me addCustomHeaderWithName:@"UpdateNested" value:@"yes" ] update:entity callback:^(MSSampleServiceSampleEntity *updated, MSOrcError *error) {
            updatedSampleEntity = updated;
            self.running = false;
        }];
        
    }];
    
    [self blockUntilFinish];
    
    XCTAssertNotNil(sampleEntity);
    XCTAssertNotNil(updatedSampleEntity);
}

-(void) testGetAndUpdatePropertyInList{
    //getSampleEntityWithNavigationsGET.json
    //updateSampleEntityListPropertyChangedPATCH.json
    
    self.running = true;
    __block MSSampleServiceSampleEntity *sampleEntity = nil;
    __block MSSampleServiceSampleEntity *updatedSampleEntity = nil;
    
    [[self.client.me addCustomHeaderWithName:@"WithNavigations" value:@"yes"] readWithCallback:^(MSSampleServiceSampleEntity *entity, MSOrcError *error) {
        sampleEntity = entity;
        [[entity.navigations objectAtIndex:0] setSomeString: @"Some New String"];
        
        [[self.client.me addCustomHeaderWithName:@"UpdateNavigations" value:@"yes" ] update:entity callback:^(MSSampleServiceSampleEntity *updated, MSOrcError *error) {
            updatedSampleEntity = updated;
            self.running = false;
        }];
        
    }];
    
    [self blockUntilFinish];
    
    XCTAssertNotNil(sampleEntity);
    XCTAssertNotNil(updatedSampleEntity);
}


-(void) testGetAndUpdatePropertyInListOf3elements{
    //getSampleEntityWith3NavigationsGET.json
    //updateSampleEntityListWith3ElementsPropertyChangedPATCH.json
    
    self.running = true;
    __block MSSampleServiceSampleEntity *sampleEntity = nil;
    __block MSSampleServiceSampleEntity *updatedSampleEntity = nil;
    
    [[self.client.me addCustomHeaderWithName:@"With3Navigations" value:@"yes"] readWithCallback:^(MSSampleServiceSampleEntity *entity, MSOrcError *error) {
        sampleEntity = entity;
        [[entity.navigations objectAtIndex:0] setSomeString: @"Some New String"];
        
        [[self.client.me addCustomHeaderWithName:@"WithNavigations3" value:@"yes" ] update:entity callback:^(MSSampleServiceSampleEntity *updated, MSOrcError *error) {
            updatedSampleEntity = updated;
            self.running = false;
        }];
        
    }];
    
    [self blockUntilFinish];
    
    XCTAssertNotNil(sampleEntity);
    XCTAssertNotNil(updatedSampleEntity);
}

/*
-(void) testEnumParser{
 
    self.running = true;
 
    NSString* json = @"{\"Name\": \"Test\", \"enums\":[\"First\",\"Second\"]}";
    MSSampleContaunerEntityWithEnum* t = [MSSampleContaunerEntityWithEnum alloc];
    NSData* data = [json dataUsingEncoding:NSUTF8StringEncoding] ;
    
    id entity = [[[self.client resolver] jsonSerializer] deserialize:data asClass:[t class]];
    
    XCTAssertNotNil(entity);
}*/

//TODO: Reactor this: add semaphore or get method to terminator methods
-(void)blockUntilFinish {
    
    while (self.running){}
}

-(MSSampleServiceSampleEntity*)getSampleEntity{
    MSSampleServiceSampleEntity *sampleEntity = [[MSSampleServiceSampleEntity alloc] init];
    sampleEntity.displayName = @"Some Display Name";
    sampleEntity.entityKey = @"Some Entity Key";
    sampleEntity._id = @"5C338D75-CB90-4785-8667-CED25B3695BF";
    return sampleEntity;
}

-(MSSampleServiceAnotherEntity*) getAnotherEntity{
    MSSampleServiceAnotherEntity *anotherEntity = [[MSSampleServiceAnotherEntity alloc]init];
    anotherEntity._id = @"3281EC0B-1AEB-49A4-A345-E64D732DA6D3";
    anotherEntity.someString=@"Some String";
    return anotherEntity;
}

@end
