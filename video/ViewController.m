
#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

static NSString *playMp4 = @"http://wvideo.spriteapp.cn/video/2016/0328/56f8ec01d9bfe_wpd.mp4";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)playAction:(id)sender {
//    [self avplayerVCplayLocalVideo];
    [self avplayerNetVideo];
//    [self avplayerVCplayNetVideo];
}

- (void)avplayerVCplayLocalVideo{
    NSURL *resource = [[NSBundle mainBundle]URLForResource:@"Worth" withExtension:@"mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:resource];
    AVPlayerViewController *avPlayer = [[AVPlayerViewController alloc]init];
    avPlayer.player = player;
    [self presentViewController:avPlayer animated:YES completion:^{
    }];
}

- (void)avplayerVCplayNetVideo{
    AVPlayerItem *playitem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:playMp4]];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playitem];
    AVPlayerViewController *avPlayer = [[AVPlayerViewController alloc]init];
    avPlayer.player = player;
    [self presentViewController:avPlayer animated:YES completion:^{
    }];
}

- (void)avplayerNetVideo{
    AVPlayerItem *playItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:playMp4]];
    //初始化AVPlayer
    AVPlayer *avPlayer = [[AVPlayer alloc] initWithPlayerItem:playItem];
    //设置AVPlayer关联
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:avPlayer];
    //设置视频模式
    playerLayer.videoGravity = AVLayerVideoGravityResize;
    playerLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 9.0 / 16.0);
    //创建一个UIView与AVPlayerLayer关联
    UIView *playerView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(playerLayer.frame), CGRectGetHeight(playerLayer.frame))];
    playerView.backgroundColor = [UIColor blackColor];
    [playerView.layer addSublayer:playerLayer];
    [self.view addSubview:playerView];
    [avPlayer play];
}


@end
