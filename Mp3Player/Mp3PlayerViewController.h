//
//  Mp3PlayerViewController.h
//  Mp3Player
//
//  Created by TopTier on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>


@interface Mp3PlayerViewController : UIViewController <AVAudioPlayerDelegate> {
    NSString *path;
    AVAudioPlayer *audioPlayer;
    UISlider *aSlider;
    NSTimer *sliderTimer;
    UIButton *playPause;
}

@property (nonatomic,retain) NSString *path; 
@property (nonatomic,retain) IBOutlet UISlider *aSlider; 
@property (nonatomic,retain) IBOutlet UIButton *playPause; 
@end
