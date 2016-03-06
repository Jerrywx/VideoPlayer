# VideoPlayer
[ffmpeg](http://ffmpeg.org)、AVPlayer、ijkplayer、kxmovie、ffmpeg-avplayer-for-ios-tvos

一、视频播放

  1. iOS 中主要的视频开发框架。
  
    在iOS 视频开发时，可以使用系统自带框架 AVPlayer 和 AVKit(MPMoviePlayerController&MPMoviePlayerViewController) 框架.或者第三框架。

    必将常用的第三方开源的多媒体处理框架有：gstreamer，vlc，ffmpeg 等，这里先介绍一些基于 ffmpeg 开发的视频播放框架。
    
    (在iOS9 中 AVKit 框架已被放弃)
  
  2. AVPlayer

    AV Foundation 是 iOS 系统自带的播放框架 其主要围绕 AVPlayer 类展开。
    
    VAPlayer 非常强大。可以播放本地 或者 网络流媒体视频。但不支持直播。
  
  3. 基于 ffmpeg 的第三方播放器
  
    基于ffmpeg 的第三方播放器比较多.

    [bilibili](https://github.com/Bilibili/ijkplayer) 的 ijkplayer   功能一般，但已经很多年不更新了。
    
    [kxmovie](https://github.com/kolyvan/kxmovie)               功能简单，
    
    [ffmpeg-avplayer-for-ios-tvos](https://github.com/iMoreApps/ffmpeg-avplayer-for-ios-tvos) 功能比较强大 支持iOS 和 TVOC 但不开源
    
  4. ffmpeg 编译方法
	[ffmpeg源码](https://github.com/FFmpeg/FFmpeg)
	[ffmpeg编译](http://www.cocoachina.com/ios/20150514/11827.html)
	1. 编译时需要先安装 yasm
		安装方式：
		终端命令如下：
		curl http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz >yasm.tar.gz
		tar xzvf yasm.tar.gz
		cd yasm-1.2.0
		./configure	
		make
		sudo make install
	2. 在操作过程中需要将 文件复制到 /usr/bin 目录下
		此时会出现 “Operation not permitted” 错误
		这是由于 El Capitan 加入了Rootless机制，不再能够随心所欲的读写很多路径了。
		于是尝试关闭 Rootless。重启按住 Command+R，进入恢复模式，打开Terminal。
		csrutil disable
		重启即可。如果要恢复默认，那么
		csrutil enable

	ffmpeg 编译完成 
  
