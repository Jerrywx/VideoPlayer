//
//  ViewController.m
//  Player-Demo
//
//  Created by 王潇 on 16/3/4.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
@property (atomic, strong) NSURL					*url;
@property (nonatomic, strong) id <IJKMediaPlayback>	player;
@property (weak, nonatomic) UIView					*PlayerView;
@property (weak, nonatomic) UIButton				*playButton;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

//	self.url = [NSURL URLWithString:@"http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8"];
//	self.url = [NSURL URLWithString:@"http://dv.spriteapp.cn/video/2016/0302/56d641df4ca8f_wpd.mp4"];
//	self.url = [NSURL URLWithString:@"http://rtmp.wslive.miaopai.com/miaopai/56da607210138546b7028151/playlist.m3u8"];
	self.url = [NSURL URLWithString:@"http://rtmp.wslive.miaopai.com/miaopai/56da9772d409d287dc02b20a/playlist.m3u8"];
	_player = [[IJKFFMoviePlayerController alloc] initWithContentURL:self.url withOptions:nil];
	UIView *playerView = [_player view];
	playerView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
	playerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//
	[IJKFFMoviePlayerController setLogReport:YES];
	[self.view addSubview:playerView];
	[self.PlayerView insertSubview:playerView atIndex:1];
	[_player setPauseInBackground:YES];
	[_player setScalingMode:MPMovieScalingModeAspectFit];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	if (![_player isPlaying]) {
		[self.player prepareToPlay];
	}
}

//@property(nonatomic)            NSTimeInterval	currentPlaybackTime;		// 当前播放时间
//@property(nonatomic, readonly)  NSTimeInterval	duration;					// 时长
//@property(nonatomic, readonly)  NSTimeInterval	playableDuration;			// 时间
//@property(nonatomic, readonly)  NSInteger			bufferingProgress;			// 缓存
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	NSLog(@"=== %@ %f - %f - %f - %zd = %f", NSStringFromCGSize(_player.naturalSize),
									  _player.duration,
									  _player.playableDuration,
									  _player.currentPlaybackTime,
									  _player.bufferingProgress,
									  _player.playbackRate);
}


@end
