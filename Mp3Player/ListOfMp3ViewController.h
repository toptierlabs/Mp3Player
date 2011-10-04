//
//  ListOfMp3ViewController.h
//  Mp3Player
//
//  Created by TopTier on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mp3PlayerViewController.h"

@interface ListOfMp3ViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UITableView *mp3TableView;
    Mp3PlayerViewController * mp3Controller;
}

@property (nonatomic,retain) NSDictionary *mp3s;
@property (nonatomic,retain) NSArray   *keys;
@property (nonatomic,retain) Mp3PlayerViewController * mp3Controller;

@end

@end
