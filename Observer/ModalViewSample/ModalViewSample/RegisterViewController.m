//
//  RegisterViewController.m
//  ModalViewSample
//


#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtUsername;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end

@implementation RegisterViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)save:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"点击Save按钮，关闭模态视图");
        
        NSDictionary *dataDict = [NSDictionary dictionaryWithObject:self.txtUsername.text
                                                             forKey:@"username"];
        [[NSNotificationCenter defaultCenter]
                postNotificationName:@"RegisterCompletionNotification"
                object:nil
                userInfo:dataDict];
        
    }];
    
}

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{        
        NSLog(@"点击Cancel按钮，关闭模态视图");
    }];
    
}

@end
