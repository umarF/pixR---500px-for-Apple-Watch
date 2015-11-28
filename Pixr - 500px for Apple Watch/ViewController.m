//
//  ViewController.m
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 13/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import "ViewController.h"
#import "SlideViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UITextView *textfield;
@property (weak, nonatomic) IBOutlet UITextView *textfield2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textfield2.text = @"pixR is an extension of the 500px right on your wrist.\n\npixR is 500px images viewer and more for your Apple Watch. It not only lets you browse all the available categories of 500px but also see inside details of the pictures and the photographers too. pixR has a very easy and free flowing UI that lets you browse 500px with a breeze on your Apple Watch. \n\nNote: that this app requires Apple watchOS2. It is a stand alone app for your Apple watch and requires a working internet connection on the watch, regardless of the fact that your iPhone is in vicinity or not.\nDeveloped by Umar Farooque.\n\nPowered by 500px.\n\n";
    self.navigationController.navigationBarHidden = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}



-(void)viewWillAppear:(BOOL)animated{
    
    
    
    [self.segmentControl setSelectedSegmentIndex:0];
    
    
    
}




- (IBAction)segmentControllerAction:(UISegmentedControl*)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        
        //about
        self.textfield.hidden=YES;
        self.textfield2.hidden=NO;
        self.textfield2.text = @"pixR is an extension of the 500px right on your wrist.\n\npixR is 500px images viewer for your Apple Watch and more. It not only lets you browse all the available categories of 500px but also see inside details of the pictures and the photographers too. pixR has a very easy and free flowing UI that lets you browse 500px with a breeze on your Apple Watch. \n\nNote: that this app requires Apple watchOS2. It is a stand alone app for your Apple watch and requires a working internet connection on the watch, regardless of the fact that your iPhone is in vicinity or not.\nDeveloped by Umar Farooque.\n\nPowered by 500px.\n\n";
        
    }
    
    if (sender.selectedSegmentIndex == 1) {
        
        self.textfield.hidden=NO;
        self.textfield2.hidden=YES;
        
    }
    
    if (sender.selectedSegmentIndex == 2) {
        
        SlideViewController *slide = (SlideViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"slide"];
        [self.navigationController presentViewController:slide animated:YES completion:^{
            
        }];
    }
    
    
    
    
}

@end
