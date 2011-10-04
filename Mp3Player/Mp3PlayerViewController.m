//
//  Mp3PlayerViewController.m
//  Mp3Player
//
//  Created by TopTier on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Mp3PlayerViewController.h"


@implementation Mp3PlayerViewController
@synthesize path;
@synthesize aSlider;
@synthesize playPause;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [sliderTimer release];
    [path release];
    [audioPlayer release];
    [aSlider release];
    [playPause release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];


}

-(void) viewWillDisappear:(BOOL)animated {
    if ([sliderTimer isValid]) {
        sliderTimer = nil;
		[sliderTimer invalidate];
		[sliderTimer release]; 
    }
    [audioPlayer stop];
    [aSlider setValue:0.0f];
    
    [audioPlayer setCurrentTime:aSlider.value];
    

    
    UIImage *img = [UIImage imageNamed:@"player_play.png"];
    [playPause setImage:img forState:UIControlStateNormal];
    [img release];
    
}

- (void)viewWillAppear:(BOOL)animated
{    

    [super viewWillAppear:animated];
    
//    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], self.path]];
//    
//	NSError *error;
//	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
//	audioPlayer.numberOfLoops = -1;
//    
//	if (audioPlayer == nil)
//		NSLog(@"%@", [error description]);
//	else
//		[audioPlayer play];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)playPauseButtonClicked:(id)sender {
    if (!audioPlayer.playing){

        // Read the file from resource folder and set it in the avAudioPlayer
        NSURL *fileUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], self.path]];
        if (audioPlayer == nil){
            audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:nil];
            [audioPlayer setDelegate:self];
            [audioPlayer setVolume:1.0];
        }
        
        // Set a timer which keep getting the current music time and update the UISlider in 1 sec interval
        if ([sliderTimer isValid]) {
            [sliderTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        }else{
            [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateSlider) userInfo:nil repeats:YES];
        }
        
       
        // Set the maximum value of the UISlider
        //subtract 0.1 because if max audio player duration selected music ends without calling didfinish event
        aSlider.maximumValue = audioPlayer.duration -0.1;
        // Set the valueChanged target
        //[aSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        
        // Play the audio
        [audioPlayer prepareToPlay];
        //[audioPlayer play];
        
        
        [audioPlayer setCurrentTime:aSlider.value];
        [audioPlayer play];
       

        UIImage *img = [UIImage imageNamed:@"player_pause.png"];
        [playPause setImage:img forState:UIControlStateNormal];
        [img release];
    }
    else
    {
        [audioPlayer pause];
        
        sliderTimer = nil;
		[sliderTimer invalidate];
		[sliderTimer release]; 

        UIImage *img = [UIImage imageNamed:@"player_play.png"];
        [playPause setImage:img forState:UIControlStateNormal];
        [img release];
    }
    
}

- (void)updateSlider {
	// Update the slider about the music time
	aSlider.value = audioPlayer.currentTime;
    
}

- (IBAction)sliderChanged:(UISlider *)sender {
	// Fast skip the music when user scroll the UISlider
    if (audioPlayer.playing){
        [audioPlayer stop];
        [audioPlayer setCurrentTime:aSlider.value];
        [audioPlayer prepareToPlay];
        [audioPlayer play];
    }
    else
    {
        [audioPlayer setCurrentTime:aSlider.value];
    }
	
}



// Stop the timer when the music is finished (Need to implement the AVAudioPlayerDelegate in the Controller header)
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
	// Music completed
	if (flag) {
        sliderTimer = nil;
		[sliderTimer invalidate];
		[sliderTimer release]; 
        
        UIImage *img = [UIImage imageNamed:@"player_play.png"];
        [playPause setImage:img forState:UIControlStateNormal];
        [img release];
	}
}



- (void)viewDidUnload
{
    self.aSlider = nil;
    self.playPause = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
