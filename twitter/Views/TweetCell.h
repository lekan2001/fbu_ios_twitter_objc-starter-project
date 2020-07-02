//
//  TweetCell.h
//  twitter
//
//  Created by Olalekan Abdurazaq Adisa on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *tweetImage;
@property (weak, nonatomic) IBOutlet UILabel *tweetprofilename;

@property (weak, nonatomic) IBOutlet UIImageView *tweetVerify;

@property (weak, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *date;

@property (weak, nonatomic) IBOutlet UIButton *likeButton;

@property (weak, nonatomic) IBOutlet UIButton *retweetButton;

@property (weak, nonatomic) IBOutlet UILabel *retweetLabel;



@property (weak, nonatomic) IBOutlet UILabel *likeLabel;


@property (weak, nonatomic) IBOutlet UILabel *TweetInfo;



@property (weak, nonatomic) IBOutlet UIButton *dmButton;
@property (strong,nonatomic) Tweet *tweet;


-(void)updateCell;
    


@end


NS_ASSUME_NONNULL_END
