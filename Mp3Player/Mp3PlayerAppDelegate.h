//
//  Mp3PlayerAppDelegate.h
//  Mp3Player
//
//  Created by TopTier on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Mp3PlayerViewController;

@interface Mp3PlayerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Mp3PlayerViewController *viewController;

@end
