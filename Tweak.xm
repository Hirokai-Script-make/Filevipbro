
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

%hook UIApplication

- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Kai Roblox"
                                                                       message:"đăng kí kênh tui đi nười đẹp"
                                                                preferredStyle:UIAlertControllerStyleAlert];

        // Nút YouTube
        UIAlertAction *ytAction = [UIAlertAction actionWithTitle:@"YouTube" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSURL *url = [NSURL URLWithString:@"https://youtube.com/@hirokaidzso1vn?si=5wdkt8zqbWEt3idq"];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
        }];

        // Nút Discord
        UIAlertAction *discordAction = [UIAlertAction actionWithTitle:@"Discord" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSURL *url = [NSURL URLWithString:@"https://discord.gg/VaeSveZW"];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
        }];

        // Nút đóng
        UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:nil];

        [alert addAction:ytAction];
        [alert addAction:discordAction];
        [alert addAction:closeAction];

        // Thêm viền xanh lá
        UIView *subview = alert.view.subviews.firstObject;
        if (subview) {
            subview.layer.borderColor = [UIColor systemGreenColor].CGColor;
            subview.layer.borderWidth = 2.0;
        }

        [rootVC presentViewController:alert animated:YES completion:nil];
    });
}

%end
