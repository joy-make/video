
#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@import AVFoundation;
@interface ViewController ()
@property (nonatomic,strong)AVPlayer *player;
@property (nonatomic,strong)AVPlayer *avNetPlayer;

@end

static NSString *playMp4 = @"http://wvideo.spriteapp.cn/video/2016/0328/56f8ec01d9bfe_wpd.mp4";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *resource = [[NSBundle mainBundle]URLForResource:@"Worth" withExtension:@"mp4"];
    _player = [AVPlayer playerWithURL:resource];
    
    AVPlayerItem *playItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:playMp4]];
    //初始化AVPlayer
    _avNetPlayer = [[AVPlayer alloc] initWithPlayerItem:playItem];
    //设置AVPlayer关联
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avNetPlayer];
    //设置视频模式
    playerLayer.videoGravity = AVLayerVideoGravityResize;
    playerLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 9.0 / 16.0);
    [self.view.layer addSublayer:playerLayer];

}


- (IBAction)segmentAction:(UISegmentedControl *)sender {
    [_player.currentItem cancelPendingSeeks];
    [_player.currentItem.asset cancelLoading];
    [_player pause];
    [_avNetPlayer pause];
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self avplayerVCplayLocalVideo];
            break;
        case 1:
            [self avplayerNetVideo];
            break;
        default:
            [self avplayerVCplayNetVideo];
            break;
    }
}

- (void)avplayerVCplayLocalVideo{
    AVPlayerViewController *avPlayer = [[AVPlayerViewController alloc]init];
    avPlayer.player = _player;
    [self presentViewController:avPlayer animated:YES completion:^{
    }];
}

- (void)avplayerNetVideo{
    [_avNetPlayer play];
}

- (void)avplayerVCplayNetVideo{
    AVPlayerViewController *avPlayer = [[AVPlayerViewController alloc]init];
    avPlayer.player = _avNetPlayer;
    [self presentViewController:avPlayer animated:YES completion:^{
    }];
}


@end
