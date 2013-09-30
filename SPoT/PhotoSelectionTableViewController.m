//
//  PhotoSelectionTableViewController.m
//  SPoT
//
//  Created by Jesse Miller on 9/29/13.
//  Copyright (c) 2013 Jesse Miller. All rights reserved.
//

#import "PhotoSelectionTableViewController.h"
#import "PhotoDisplayerViewController.h"

@interface PhotoSelectionTableViewController ()

@property (nonatomic, strong) NSArray *photos;

@end

@implementation PhotoSelectionTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadPhotos];
}

- (void)loadPhotos
{
    self.photos = @[@"Test", @"Hello", @"Banana", @"Grandpa"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.photos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Photo Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.photos[indexPath.item];
    
    return cell;
}

- (NSArray *)photos
{
    if (!_photos) _photos = @[];
    return _photos;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Display Photo"]) {
        PhotoDisplayerViewController *photoDisplayerViewController = (PhotoDisplayerViewController *)[segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        photoDisplayerViewController.photoUrl = self.photos[indexPath.item];
    }
}

@end
