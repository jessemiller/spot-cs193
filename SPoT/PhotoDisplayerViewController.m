//
//  PhotoDisplayerViewController.m
//  SPoT
//
//  Created by Jesse Miller on 9/29/13.
//  Copyright (c) 2013 Jesse Miller. All rights reserved.
//

#import "PhotoDisplayerViewController.h"

@interface PhotoDisplayerViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PhotoDisplayerViewController

- (void)setPhotoUrl:(NSString *)photoUrl
{
    _photoUrl = photoUrl;
    [self setupPhoto];
}

- (void)setupPhoto
{
    self.title = self.photoUrl;
    if (self.scrollView) {
        UIImage *image = [UIImage imageNamed:@"2013-09-28 07.56.48.jpg"];
        self.scrollView.contentSize = image.size;
        self.imageView.image = image;
        self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView];
    self.scrollView.delegate = self;
	[self setupPhoto];
    
}

- (UIImageView *)imageView
{
    if (!_imageView) _imageView = [[UIImageView alloc] initWithFrame: CGRectZero];
    return _imageView;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
