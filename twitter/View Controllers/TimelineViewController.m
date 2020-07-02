//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "ComposeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
@interface TimelineViewController ()<ComposeViewControllerDelegate, UITableViewDataSource,  UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *tweets;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *tweetButton;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *logoutButton;





@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tweets = [[NSMutableArray alloc]init];
    [self fetchTweets];
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget: self action: @selector(fetchTweets) forControlEvents: UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    
    self.tableView.rowHeight = 205;
    
    
//    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
//
//    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    //[self.tableView insertSubview:refreshControl atIndex:0]
   
}
-(void)fetchTweets{
    
     // Get timeline
        [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
            if (tweets) {
                
                [self.tweets addObjectsFromArray:tweets];
                [self.tableView reloadData];
                NSLog(@"😎😎😎 Successfully loaded home timeline");
                
    //            for (NSDictionary *dictionary in tweets) {
    //                NSString *text = dictionary[@"text"];
    //                NSLog(@"%@", text);
    //

                    
                
        } else {
                NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
            }
            [self.refreshControl endRefreshing];
            //[self.tableview reloadData]
        }];
        
    
}


//-(IBAction)didTapFavorite:(id)sender{
//    
//}


//
// - (void) beginRefresh:(UIRefreshControl *)refreshControl {
//
//     NSURL *url = [NSURL URLWithString:@"https://api.twitter.com"];
//
//     //https://api.twitter.com
//         // Create NSURL and NSURLRequest
//     NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
//
//         NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
//                                                               delegate:nil
//                                                          delegateQueue:[NSOperationQueue mainQueue]];
//         session.configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
//
//        NSURLSessionDataTask *task = [session dataTaskWithRequest: request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//            // ... Use the new data to update the data source ...
//
//            // Reload the tableView now that there is new data
//             [self.tableView reloadData];
//
//            // Tell the refreshControl to stop spinning
//             [refreshControl endRefreshing];
//
//         }];
//
//         [task resume];
// }
 



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    cell.tweet = self.tweets[indexPath.row];
     //Tweet *tweet = self.tweets[indexPath.row];
    //cell.tweet = tweet;
    [cell updateCell];
    
//     
   // cell.retweetButton.text = tweet.user.screenName;
    //change to tweet count.
    return cell;
}


//    screenName
    //cell.tweetprofilename.text = tweet
    
//    cell.tweetprofilename.text = tweet.text;
//
//    cell.username.text = tweet.text;
//    cell.date.text = tweet.text;
    //cell.replycout = tweet.text;
    
//    cell.tweetprofilename = tweet.text;

//    cell.textLabel.text = [NSString stringWithFormat:@"row: %d, section %d", indexPath.row, indexPath.section];
//
//    NSLog(@"%@", [NSString stringWithFormat:@"row: %d, section %d", indexPath.row, indexPath.section]);



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass: [UIBarButtonItem class]]){
           UIBarButtonItem *pressedButton = (UIBarButtonItem*) sender;
           if ( [pressedButton.title isEqualToString: @"Compose"]){
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
    
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
//    UIBarButtonItem *tweetButton = sender;
//    ComposeViewController *composeViewController = [segue destinationViewController];
 //edgfhdudvtvb   composeViewController.tweet = tweet;
    //NSIndexPath *indexPath = [self.// ];
           }
    }}




- (void)didTweet:(nonnull Tweet *)tweet {
    [self.tweets insertObject:tweet atIndex:0];
    [self.tableView reloadData];
}











- (IBAction)logoutPressed:(id)sender {
//    (UIBarButtonItem *)logoutButton{
    //    [[UIApplication sharedApplication].delegate]
        //[UIApplication sharedApplication].delegate;
    [[APIManager shared]logout];
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        appDelegate.window.rootViewController = loginViewController;
        
        
    
}




@end
