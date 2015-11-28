//
//  SlideViewController.m
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 10/09/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import "SlideViewController.h"

@interface SlideViewController ()

@end

@implementation SlideViewController{
    
    __weak IBOutlet UILabel *mytitleLabel;
    NSTimer *myTimer;
    int photoCount;
    __weak IBOutlet UIImageView *imageViewSlide;
    __weak IBOutlet UIButton *closebutton;
    NSArray *imageArray;
    NSArray *textArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    photoCount =0 ;
    imageArray =[[ NSArray alloc] initWithObjects:[UIImage imageNamed:@"s1"],[UIImage imageNamed:@"s2"],[UIImage imageNamed:@"s3"],[UIImage imageNamed:@"s4"],[UIImage imageNamed:@"s5"],[UIImage imageNamed:@"s6"], nil];
    textArray = [[NSArray alloc] initWithObjects:@"View pictures from the long list of categories available.",@"View high quality pictures.",@"Find all the details related to current the picture with a tap.",@"Get to know the photographer",@"Get fine details of the camera settings for the pictures like ISO, Lens, Shutter Speed, etc",@"Use force touch to access different available 500px streams.", nil];
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    
    myTimer =[NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(slideShow) userInfo:nil repeats:YES];

    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [myTimer invalidate];
    
}

- (IBAction)closeButtonAction:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) slideShow{
    
    if (photoCount < [imageArray count] - 1){
        photoCount ++;
    }else{
        photoCount = 0;
    }
    
    
    
    [UIView transitionWithView:imageViewSlide
                      duration:2.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        
                        
                        mytitleLabel.text = [textArray objectAtIndex:photoCount];
                        imageViewSlide.image = [imageArray objectAtIndex:photoCount];
                    
                    
                    
                    }
                    completion:NULL];
    
 
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
