//
//  ComposeViewController.m
//  twitter
//
//  Created by Olalekan Abdurazaq Adisa on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
//#import "Tweet.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *composeTweetLabel;


@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 // [self dismissViewControllerAnimated:true completion:nil];
    
    // Do any additional setup after loading the view
}


- (IBAction)cancelTweetButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


- (IBAction)postTweetButton:(id)sender {
    [[APIManager shared] postStatusWithText:self.composeTweetLabel.text completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
            [self cancelTweetButton: sender];
        }
    }];
    
    
}
    
    
//    [[APIManager shared] postStatusWithText:self.composeTweetLabel.text completion:^(Tweet *tweet, NSError *error) {         if(error){             NSLog(@"Error composing Tweet: %@", error.localizedDescription);         }         else{       [self.delegate didTweet:tweet];
//        NSLog(@"Tweet successful");
//    }
        
//        [self closeView: sender];         }     }];
    
//    [self.delegate didTweet:tweet];
//    NSLog(@"Compose Tweet Suuccess");

    //[APIManager postStatusWith: self.composeTweetLabel.textCompletion:nil];
        

//[self.delegate didTweet:tweet];             NSLog(@"Compose Tweet Success!");
//



//-(IBAction)tweet:(id)sender{
//    [APIManager postStatusWithText:self.composeTweetLabel.textcompletion:nil];
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
