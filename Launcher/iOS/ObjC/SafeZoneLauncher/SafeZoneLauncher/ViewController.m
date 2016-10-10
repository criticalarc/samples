//
//  ViewController.m
//  SafeZoneLauncher
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLaunchButtonTouchUpInside:(id)sender {
    
    NSURL *launchUrl = [NSURL URLWithString: @"com.criticalarc.safezoneapp://launch"];
    NSString *storeUrlFormat = @"http://itunes.apple.com/%@/app/id533054756";
    
    if ([[UIApplication sharedApplication] canOpenURL: launchUrl]) {
        [[UIApplication sharedApplication] openURL: launchUrl];
    } else {
        NSString *storeUrlString = [NSString stringWithFormat: storeUrlFormat, [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]];
        NSURL *storeUrl = [NSURL URLWithString:storeUrlString];
        [[UIApplication sharedApplication] openURL: storeUrl];
    }
}

@end
