//
//  MenuController.m
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 20/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import "MenuController.h"
#import "InterfaceController.h"
//#import "Constants.h"

@interface MenuController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *popularButton;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *trendingButton;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *editorButton;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *freshButton;

@end

@implementation MenuController{
    
    
    NSMutableDictionary *paramDict;
    NSString *category;

}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    category = [context valueForKey:@"category"];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    paramDict = [[NSMutableDictionary alloc] init];
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


#pragma mark - BUTTON ACTIONS



- (IBAction)popularButtonAction {
    
    [paramDict removeAllObjects];
    [paramDict setObject:@"popular" forKey:@"reqType"];
    [paramDict setObject:category forKey:@"category"];
    [self pushControllerWithName:@"imageTable" context:paramDict];
}

- (IBAction)trendingButtonAction {
    
    [paramDict removeAllObjects];
    [paramDict setObject:@"upcoming" forKey:@"reqType"];
    [paramDict setObject:category forKey:@"category"];;
    [self pushControllerWithName:@"imageTable" context:paramDict];

}

- (IBAction)editorButtonAction {
    
    [paramDict removeAllObjects];
    [paramDict setObject:@"editors" forKey:@"reqType"];
    [paramDict setObject:@"upcoming" forKey:@"reqType"];
    [self pushControllerWithName:@"imageTable" context:paramDict];
    
}

- (IBAction)freshButtonAction {
    
    [paramDict removeAllObjects];
    [paramDict setObject:@"fresh_today" forKey:@"reqType"];
    [paramDict setObject:@"upcoming" forKey:@"reqType"];
    [self pushControllerWithName:@"imageTable" context:paramDict];

}



@end



