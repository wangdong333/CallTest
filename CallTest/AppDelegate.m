//
//  AppDelegate.m
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreTelephony/CoreTelephonyDefines.h"
#import "CoreTelephony/CTCall.h"
#import "CoreTelephony/CTCallCenter.h"
#import "CoreTelephony/CTCarrier.h"
#import "CoreTelephony/CTTelephonyNetworkInfo.h"
#import <sqlite3.h>
#import "math.h"


@implementation AppDelegate

@synthesize window = _window;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;
@synthesize dataArrey = _dataArrey;


//extern id allIncomingMessages;
//extern int incomingMessageCount;

extern NSString* const kCTSMSMessageReceivedNotification;
extern NSString* const kCTSMSMessageReplaceReceivedNotification;
extern NSString* const kCTSIMSupportSIMStatusNotInserted;
extern NSString* const kCTSIMSupportSIMStatusReady;

extern  CFNotificationCenterRef CTTelephonyCenterGetDefault(void); // 获得 TelephonyCenter (电话消息中心) 的引用
extern  void CTTelephonyCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior);
extern  void CTTelephonyCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFStringRef name, const void *object);
extern  NSString *CTCallCopyAddress(void *, CTCall *call); //获得来电号码
extern  void CTCallDisconnect(CTCall *call); // 挂断电话
extern  void CTCallAnswer(CTCall *call); // 接电话
extern  void CTCallAddressBlocked(CTCall *call);
extern  int CTCallGetStatus(CTCall *call); // 获得电话状态　拨出电话时为３，有呼入电话时为４，挂断电话时为５
extern  int CTCallGetGetRowIDOfLastInsert(void); // 获得最近一条电话记录在电话记录数据库中的位置


//typedef struct _CTCall CTCall;
extern NSString *CTCallCopyAddress(void*, CTCall *); 
void* CTSMSMessageSend(id server,id msg);
typedef struct __CTSMSMessage CTSMSMessage;
NSString *CTSMSMessageCopyAddress(void *, CTSMSMessage *);
NSString *CTSMSMessageCopyText(void *, CTSMSMessage *);

int CTSMSMessageGetRecordIdentifier(void * msg);
NSString * CTSIMSupportGetSIMStatus();
NSString * CTSIMSupportCopyMobileSubscriberIdentity();
id  CTSMSMessageCreate(void* unknow/*always 0*/,NSString* number,NSString* text);
void * CTSMSMessageCreateReply(void* unknow/*always 0*/,void * forwardTo,NSString* text);

//id CTTelephonyCenterGetDefault(void);
//void CTTelephonyCenterAddObserver(id,id,CFNotificationCallback,NSString*,void*,int);
//void CTTelephonyCenterRemoveObserver(id,id,NSString*,void*);
//int CTSMSMessageGetUnreadCount(void); 



static void callback(CFNotificationCenterRef center,void *observer,CFStringRef name,const void *object, CFDictionaryRef userInfo){
    
//    NSLog(@"%@",name);
   
    NSString *strNotficationName=(NSString*)name;
    
    
    if ([strNotficationName isEqualToString:@"kCTMessageReceivedNotification"]) {
        int a=0;    
    }
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
     @synchronized(nil)
    {
        if ([(NSString *)name isEqualToString:@"kCTCallStatusChangeNotification"])
        {
        CTCall *call = (CTCall *)[(NSDictionary *)userInfo objectForKey:@"kCTCall"];
        NSString *caller = CTCallCopyAddress(NULL, call); // caller 便是来电号码
            NSLog(@"%@",caller);
            CTCallDisconnect(call); //　挂断电话
            CTCallAnswer(call); // 接电话手机直接接电话；
            CTCallGetStatus(call); // 获得电话状态　拨出电话时为３，有呼入电话时为４，挂断电话时为５
        CTCallGetGetRowIDOfLastInsert(); // 获得最近一条电话记录在电话记录数据库（call_history.db)中的位置(ROWID)
            
        }
        if (!userInfo) return;
        if ([[(NSDictionary *)userInfo allKeys]
             containsObject:@"kCTMessageIdKey"]) // SMS Message
        {

            
            NSDictionary *info = (NSDictionary *)userInfo;
            CFNumberRef msgID = (CFNumberRef)[info objectForKey:@"kCTMessageTypeKey"];
            int result;
            CFNumberGetValue((CFNumberRef)msgID, kCFNumberSInt32Type, &result); 
            //Class CTTelephonyCenter=NSClassFromString(@"CTTelephonyCenter");
            
            Class CTMessageCenter = NSClassFromString(@"CTMessageCenter");
            id mc = [CTMessageCenter sharedMessageCenter];
            NSLog(@"%@",mc);
            int count=[mc incomingMessageCount];
            NSLog(@"%d",count);
            id mcarr=[mc allIncomingMessages];
            NSLog(@"%@",mcarr);
    //        id incMsg =[mc incomingMessageWithId:result];
    //        if (count==0) {
    //            return;
    //        }
            id incMsg = [[mc allIncomingMessages] objectAtIndex:0];
            NSLog(@"%@",incMsg);
            int msgType = (int)[incMsg messageType];
            NSLog(@"%d",msgType);
            if (msgType == 1) //experimentally detected number
            {
                id phonenumber = [incMsg sender];
                
                NSString *senderNumber = (NSString *)[phonenumber canonicalFormat];
            id incMsgPart = [[[[incMsg items] objectAtIndex:0] retain] retain];
            NSData *smsData = [[[incMsgPart data] retain] retain];
//            NSString *smsText = (NSString*)[[NSString alloc] initWithData:smsData encoding:NSASCIIStringEncoding] ;
              NSString *smsText =    [NSString stringWithUTF8String:[smsData bytes]];

                NSLog(@"senderNumber = %@,text =%@",senderNumber,smsText);
                
                
            }
        
        }
        
    }

    [pool release];
    
    

}

- (void)dealloc
{
    [_window release];
    [__managedObjectContext release];
    [__managedObjectModel release];
    [__persistentStoreCoordinator release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    id ct = CTTelephonyCenterGetDefault(); 
    CTTelephonyCenterAddObserver(ct, NULL, callback, NULL, NULL, CFNotificationSuspensionBehaviorDrop);
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *dirnum = [[NSFileManager defaultManager] enumeratorAtPath: @"/"];
    NSString *nextItem = [NSString string];
    while( (nextItem = [dirnum nextObject]))
    {
        NSRange range=[nextItem rangeOfString:@"sms"];
        if (range.location!=NSNotFound)
        {
            NSLog(@"%@", nextItem);
        }
        if ([nextItem isEqualToString:@"Library/Application Support/BTServer/pincode_defaults.db"])
        {
            int a=0;
        }
        if ([[nextItem pathExtension] isEqualToString: @"db"] ||
            [[nextItem pathExtension] isEqualToString: @"sqlitedb"]) {
            if ([fileManager isReadableFileAtPath:nextItem]) {
                NSLog(@"%@", nextItem);
            }
        }
//        if ([nextItem isEqualToString:@"Library/Application Support/BTServer/pincode_defaults.db"])
//        {
//            break;
//            
//        }
    }
    //[self readCallLogs];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)readCallLogs
{
    if (_dataArrey == nil) {
        _dataArrey = [[NSMutableArray alloc] init];
    }
    [_dataArrey removeAllObjects];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *callHisoryDatabasePath = @"private/var/wireless/Library/CallHistory/call_history.db";
    BOOL callHistoryFileExist = FALSE;
    callHistoryFileExist = [fileManager fileExistsAtPath:callHisoryDatabasePath];
    [fileManager release];
    //NSMutableArray *callHistory = [[NSMutableArray alloc] init];
    sqlite3 *database = NULL ;
    sqlite3_stmt *compiledStatement;
    NSString *sqlStatement = @"SELECT * FROM call;";
    
    int errorCode = sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1,
                                       &compiledStatement, NULL);
    NSMutableDictionary *callHistoryItem = [[NSMutableDictionary alloc] init];
    if(callHistoryFileExist) {
        if ([fileManager isReadableFileAtPath:callHisoryDatabasePath])
        {
            
            if(sqlite3_open([callHisoryDatabasePath UTF8String], &database) == SQLITE_OK) {

                //if( errorCode == SQLITE_OK)
                //{
                    int count = 1;
                    
                    while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                        // Read the data from the result row
                        
                        int numberOfColumns = sqlite3_column_count(compiledStatement);
                        NSString *data;
                        NSString *columnName;
                        
                        for (int i = 0; i < numberOfColumns; i++) {
                            columnName = [[NSString alloc] initWithUTF8String:
                                          (char *)sqlite3_column_name(compiledStatement, i)];
                            
                            data = [[NSString alloc] initWithUTF8String:
                                    (char *)sqlite3_column_text(compiledStatement, i)];
                            
                            
                        }
                        [callHistoryItem setObject:data forKey:columnName];
                        
                        [columnName release];
                        [data release];
                    //}
                    [_dataArrey addObject:callHistoryItem];
                    [callHistoryItem release];
                    count++;
                }
            }
            else
            {
                NSLog(@"Failed to retrieve table");
                NSLog(@"Error Code: %d",errorCode);
            }
            sqlite3_finalize(compiledStatement);
        }
    }
    NSLog(@"%@",_dataArrey);
}



- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil) {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil) {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CallTest" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil) {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CallTest.sqlite"];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return __persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
