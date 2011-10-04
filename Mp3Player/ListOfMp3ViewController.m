//
//  ListOfMp3ViewController.m
//  Mp3Player
//
//  Created by TopTier on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ListOfMp3ViewController.h"
#import "Mp3PlayerAppDelegate.h"

@implementation ListOfMp3ViewController

@synthesize mp3s;
@synthesize keys;
@synthesize mp3Controller;



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
    [mp3TableView release];
    [mp3Controller release];
    [mp3s release];
    [keys release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


//Table delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [mp3s count];
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* CellIdentifier=@"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
    }
    
    cell.textLabel.text = [self.keys objectAtIndex:[indexPath row] ];
    //---display an image---
    //UIImage *image = [UIImage imageNamed:@"Link.png"]; cell.imageView.image = image;
    return cell;
}


- (void) tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *path;
    
    path = [self.mp3s objectForKey:[self.keys objectAtIndex:[indexPath row]]];
    self.mp3Controller.title = [self.keys objectAtIndex:[indexPath row]];
    self.mp3Controller.path = path;
    
    Mp3PlayerAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    [delegate.navController pushViewController:self.mp3Controller animated:YES];
    
    
}


#pragma mark - View lifecycle


- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}


- (void)viewDidLoad
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Mp3s" ofType:@"plist"];
    
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.mp3s = dic;
    self.keys = [dic allKeys];
    
    
    Mp3PlayerViewController *auxLink = [[Mp3PlayerViewController alloc] initWithNibName:@"Mp3PlayerView" bundle:nil];
    
    self.mp3Controller = auxLink;
    
    [dic release];
    [auxLink release];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    mp3TableView = nil;
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
