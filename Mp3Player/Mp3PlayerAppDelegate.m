//
//  Mp3PlayerAppDelegate.m
//  Mp3Player
//
//  Created by TopTier on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Mp3PlayerAppDelegate.h"

#import "Mp3PlayerViewController.h"
#import "NavController.h"
#import "ListOfMp3ViewController.h"

@implementation Mp3PlayerAppDelegate


@synthesize tabBarController=_tabBarController;
@synthesize window=_window;
@synthesize navController;
@synthesize listOfMp3ViewController=_listOfMp3ViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    tabBarController = [[UITabBarController alloc] init];  
    
    //    // Override point for customization after application launch.
    self.listOfMp3ViewController = [[ListOfMp3ViewController alloc] init];
    self.navController = [[[NavController alloc] initWithRootViewController:self.listOfMp3ViewController] autorelease];
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:self.navController, nil];
    self.navController.title = @"Musica";
    
    //    self.window.rootViewController = self.tabBarController;
    
    [self.window addSubview:_tabBarController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_listOfMp3ViewController release];
    [_tabBarController release];
    [navController release];
    [super dealloc];
    [super dealloc];
}

@end
