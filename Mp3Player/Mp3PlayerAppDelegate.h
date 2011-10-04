//
//  Mp3PlayerAppDelegate.h
//  Mp3Player
//
//  Created by TopTier on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListOfMp3ViewController;
@class NavController;

@interface Mp3PlayerAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    NavController *navController;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain)  IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain)  NavController *navController;
@property (nonatomic, retain)  ListOfMp3ViewController *listOfMp3ViewController;



@end
