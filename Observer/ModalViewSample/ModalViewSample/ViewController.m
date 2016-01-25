//
//  ViewController.m
//  ModalViewSample
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(registerCompletion:)
                                                 name:@"RegisterCompletionNotification"
                                               object:nil];
    //监听系统通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//针对Map接口的注册
-(void)registerCompletion:(NSNotification*)notification {
    
    NSDictionary *theData = [notification userInfo];
    NSString *username = [theData objectForKey:@"username"];
    
    NSLog(@"username = %@",username);
}

-(void)handleEnterBackground:(NSNotification*)notification {
    NSLog(@"进入到后台");
}

-(void)handleEnterForeground:(NSNotification*)notification {
    NSLog(@"回到前台");
}

@end
