//
//  TweetCell.m
//  twitter
//
//  Created by Olalekan Abdurazaq Adisa on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"
//#import "Tweet.h"
@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)updateCell{
    self.tweet = _tweet;
    
    self.date.text = self.tweet.createdAtString;
    //self.tweetImage.image = self.tweet.
    self.TweetInfo.text = self.tweet.text;
    NSLog(@"This is the body of a tweet %@",  self.tweet.text );
    self.tweetprofilename.text = self.tweet.user.name;
    self.username.text = self.tweet.user.screenName;
    int retweet_count = self.tweet.retweetCount;
    NSString *rtCount = [NSString stringWithFormat:@"%i", retweet_count];
    self.retweetLabel.text = rtCount;
    self.retweetLabel.textColor = [UIColor orangeColor];
    int like_count = self.tweet.favoriteCount;
    NSString *lkCount = [NSString stringWithFormat:@"%i",like_count];
    NSLog(@"%i", like_count);
    self.likeLabel.text = lkCount;
     self.likeLabel.textColor = [UIColor orangeColor];
    //self.tweetImage.image = self.tweet
   // self.tweetImage.image = self.tweet.profileImage;
    
    // self.retweetLabel.text = self.tweet.retweetCount;
   // self.likeLabel. = self.tweet.favoriteCount;
    [self.likeButton setTitle:[@(self.tweet.favoriteCount) stringValue] forState:UIControlStateNormal];
    [self.retweetButton setTitle:[@(self.tweet.retweetCount) stringValue] forState:UIControlStateNormal];
    if (self.tweet.favorited) {
          [self.likeButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
    }
    else{
        [self.likeButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    }
    if (self.tweet.retweeted) {
        //self.favorited = YES;
        //self.favoriteCount +=1;
                [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal ];
    }
         else{
             [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
        }
  
}

- (IBAction)didTapFavorite:(id)sender {
    if (self.tweet.favorited){
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet * tweet, NSError * error) {
        if (!error){
            self.tweet.favorited =NO;
            self.tweet.favoriteCount  -=1;
            //[self updateCell];
            self.tweet = tweet;
     [self updateCell];
        }
    }];
            
    }
    else{
    [[APIManager shared] favorite:self.tweet completion:^(Tweet * tweet, NSError * error) {
        if (!error){
            self.tweet.favorited = YES;
            self.tweet.favoriteCount  +=1;
           // [self updateCell];
        self.tweet = tweet;
        [self updateCell];
            NSLog(@"Like success");
        }
    }];
    }
    
    
//    //if(self.tweet)
//    if (self.tweet.favorited) {
//        //[[APIManager shared]unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error){
////            if (!error) {
////                self.tweet = tweet;
////                [self updateCell];
////            }
////        }];
//    }
//    else{
//        [[APIManager shared]favorite: self.tweet completion:^(Tweet *tweet,NSError *error){
//            self.tweet = tweet;
//            [self updateCell];
//
//        }];
//    }
    
}

- (IBAction)retweetPressed:(id)sender {
    
    if (self.tweet.retweeted){
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet * tweet, NSError * error) {
            if (!error){
                self.tweet = tweet;
                
                self.tweet.retweeted = NO;
                self.tweet.retweetCount  -=1;
               [self updateCell];
            }
        }];
    }
    else{
    [[APIManager shared] retweet:self.tweet completion:^(Tweet * tweet, NSError * error) {
        if (!error){
        self.tweet.retweeted = YES;
        self.tweet.retweetCount  +=1;

        self.tweet = tweet;
        [self updateCell];
        }
    }];
    
    }
    
    
//    if (self.tweet.retweeted) {
//         [[APIManager shared] unretweet:self.tweet completion:^(Tweet * tweet, NSError * error) {
//                   if (!error){
//                       self.tweet = tweet;
//                       [self updateCell];
//                   }
//         }];
//    }
//    else{
//        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error){
//            if (!error) {
//                self.tweet = tweet;
//                [self updateCell];
//            }
//        }]
//    }
}






@end
