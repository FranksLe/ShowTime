//
//  MessageMacro.h
//  Story
//
//  Created by lawrence on 4/30/15.
//  Copyright (c) 2015 lienbao. All rights reserved.
//

#ifndef Story_MessageMacro_h
#define Story_MessageMacro_h

#define kPlaceHolderFont 16


//第三方登录接口
#define kTheThirdLoginPath @"api/Account/ThirdLogin"

//导航栏右边按钮
#define kRightBtnFrame CGRectMake(0,0,60,24)
#define kRightBtnEdgeInsets UIEdgeInsetsMake(0, 20, 0, 0)
#define krightBtnFont [UIFont systemFontOfSize:16]

//手机号长度
#define kPhoneNumLength 11
#define kActivityViewSize 40
//设置自定义TabBar的高度
#define kTabbarHeight 44
//状态栏高度
#define kStatusHeight 20
//导航栏高度
#define kNavigationBarHeight 44
//当前设备系统版本
#define kDeviceCurrentVersion [[UIDevice currentDevice].systemVersion floatValue]
//设备屏幕的宽度尺寸
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//设备屏幕的高度尺寸
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//登陆页面输入框的左边距
#define kLoginBoderLeftWidth 30
//登陆页面输入框的上边距
#define kLoginBoderTopWidth 100
//登陆页面输入框的高度
#define kLoginHeight 40
//第三方登陆（微博，微信)按钮宽度
#define kOtherLoginBtnWidth 60
//基地址
//#define kBaseUrl @"http://121.40.179.113:8000"
#define kBaseUrl @"http://api.yirenjiadao.com"
//#define kBaseUrl @"http://api.yirenjingji.com"

//输入框中输入数字
#define kNum @"0123456789"
//表视图尾部视图字体
#define kTableViewFooterLblFont 12
//表视图尾部视图高度
#define kTableViewFooterLblHeight 60
//输入文字字体颜色343434
#define kInputTextColor [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0]
//占位图片
#define kPlaceHoderImageStr @"bj.png"
//用户头像占位图片
#define kUserPlaceHolderImageStr @"user-icon.png"
//图片压缩比例
#define kImageCompressRatio 0.8


/*--------------轻量级数据存储----------------*/
//用户cookie存入NSUserDefaults中得key
#define kUserDefaultsCookie  @"myCookie"
//请求返回值
#define kCookieCode @"requestimeout"
//当前登陆用户ID
#define kTheUserID @"UserId"
//上次登录时间
#define kLastLoginTime @"TheLastLoginTime"
//当前登录用户的昵称
#define kLoginUserName @"NickName"


/*--------------------动态（status）（cell）页面------------------------*/
#define kStatusCellBoder 10   //边缘距离
#define kStatusPortraitWidth 40   //头像高度
#define kStatusTextFont 12
#define kStatusCellZanReplyIcon 38*0.4  //点赞与评论图标的大小
#define kStatusCellZanReplyFont 15 //点赞与回复数量字体

/*-----------------StatusDetailCell--------------------*/
//头像尺寸
#define kStatusDetailCellPortraitWidth 37
//VIP图标尺寸
#define kStatusDetailCellVip 12
//星星图标尺寸
#define kStatusDetailCellStar 15
//昵称字体大小
#define kStatusdetailCellNameFont 17
//配图宽度
#define kStatusDetailCellPicWidth kScreenWidth - 2*10
//配图高度
#define kStatusDetailCellPicHeight   300   //2*(kScreenWidth - 2*10)


/* --------------MineViewController------------------*/
//头像边距
#define kMineViewBoderWidth 10
//头像长宽
#define kMineViewPortraitWidth 50
//金币控件宽度
#define kMineMoneyControlWidth 80
//金币控件高度
#define kMineMoneyControlHeight 13


/*----------------------“工作”----------------------------*/
//单元格高度
#define kWorkCellRowHeight 110
//单元格的边距
#define kWorkCellBoder 10
//标题字体
#define kWorkCellTitleFont 15
//城市字体
#define kWorkCellCityFont 14

/*----------------------“广告”----------------------------*/
//广告高度
#define kAdScrollViewH (80 + 16)

//页码颜色
#define kSelectedPageColor [UIColor redColor]
#define kUnSelectedPageColor [UIColor lightGrayColor]

/*----------------------“广场”----------------------------*/
//配图下文字字体
#define kBodyFont [UIFont systemFontOfSize:14]

//图片间距
#define kSquareImageSpace 2.0

// 图片显示的宽度
#define kTheSquareImageWidth (kScreenWidth - 4 * kSquareImageSpace)/3

//随机颜色
//#define kSquareImageRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]
#define kSquareImageRandomColor [UIColor colorWithRed:219/255.0 green:220/255.0 blue:221/255.0 alpha:1]

/*-------------------------Message---------------------------*/
#define kMessageCellHeight 60
#define kMessageZanCellHeight 65



/*--------------------------发送请求的路径--------------------------*/

//分享baseurl
//#define kShareBaseUrl @"http://121.40.179.113:8000"//
#define kShareBaseUrl @"http://api.yirenjiadao.com"
//#define kShareBaseUrl @"http://api.yirenjingji.com"

/*-------------点赞、支持---------------*/
//点赞
#define kPraiseStatusPath @"api/Attitude/Support"
//点赞的用户
#define kSupportUserPath @"api/Attitude/GetSupportUsers"
//当前用户收到的赞
#define kTheUserGetSupportPath @"api/Comments/MyReceivedSupports"


/*-----------------------------支付充值接口-------------------------------------*/
//金币充值列表
#define kCoinRechargeListPath @"api/Pay/GetCoinRechargeList"
//提交购买金币的订单
#define kSubmitCoinOrderPath @"api/Pay/SubmitCoinRechargeOrder"
//VIP支付列表
#define kVIPpayListPath @"api/Pay/GetVipPayList"
#define kPayForVip @"api/Pay/PayForVip"
//上传票据接口
#define kPurchaseReceipt @"api/Pay/IOSInAppPurchase"
//金币收支
#define kGetTradePointRecords @"api/Common/GetTradePointRecords"

/*-------------会话、私信---------------*/
//获取会话私信列表
#define kGetSessionListPath @"api/Message/ListMessages"
//当前用户私信路径
#define kTheUserSessionPath @"api/Message/GetSessions"
//发送私信
#define kSendSessionPath @"api/Message/CreateMessage"
//判断是否有新信息
#define kCheckHasNewMessage @"api/Message/NewMessages"


/*-------------用户登录、退出、修改密码---------------*/

//登录路径
#define kLoginPath @"api/Account/Login"
//注册路径
#define kRegisterPath @"api/Account/Register"
//编辑用户资料
#define kEditUserProfile @"api/Account/EditUserProfile"
//修改密码
#define kChangeUserPsd @"api/Account/ChangePassword"
//重置密码的验证码路径
#define kResetPsdPath @"api/Account/GetResetVerificationCode"
//重置密码
#define kToResetPsdPath @"api/Account/ResetPassword"
//验证码校验
#define kCheckVerfication @"api/Account/CheckVerificationCode"
//身份认证
#define kTheUserIdentifyPath @"api/Account/CreateIdentification"
//获取手机绑定验证码
#define kBindingPhoneVerficationPath @"api/Account/GetBindingVerificationCode"
//绑定手机号
#define kBindedPhonePath @"api/Account/MobileBinding"
//检查身份认证状态
#define kCheckIdentification @"api/Account/CheckIdentificationStatus"
//申请注册验证码
#define kGetRegisterVerificationCode @"api/Account/GetRegisterVerificationCode"
//第三方用户注册
#define kThirdRegister @"api/Account/ThirdRegister"

/*-------------广场---------------*/
//广场推荐路径
#define kTheSquareActivitiesPath @"api/Square/Activities"
//广场朋友圈路径
#define kTheSquareFriendsActivitiesPath @"api/Square/FriendsActivities"




/*-------------评论---------------*/
//当前用户收到的评论
#define kTheUserReceiveCommentsPath @"api/Comments/MyReceivedComments"
//获取动态评论
#define kGetCommentsPath @"api/Comments/GetComments"
//发表评论
#define kSendCommentsPath @"api/Comments/PostComment"
//获取动态最新评论
#define kGetLatestComments @"api/Comments/GetLastComments"
//删除评论
#define kDeleteTheLoginUserComment @"api/Comments/DeleteComment"

/*-------------普通接口---------------*/
//广场广告路径
#define kTheGetAdvertisingPath @"api/Common/GetAdvertising"
//注册城市路径
#define kCityPath @"api/Common/GetCities"
//检测更新
#define kCheckUpdate @"api/Common/CheckVersion"
//获取职业分类列表
#define kGetProfessionList @"api/Common/GetProfessionCategories"

/*-------------工作---------------*/
//获取工作详情
#define kTheJobDetailPath @"api/Job/JobDetail"
//申请工作
#define kApplyWorkPath @"api/Job/Apply"
//发布工作
#define kPublishTaskPath @"api/Job/PublishJob"
//检查用户发布工作的金币
#define kCheckMoneyPath @"api/Job/CheckPublishJob"
//删除工作
#define kDeleteWork @"api/Job/DeleteJob"
//申请工作的用户
#define kGetAppliedUsers @"api/Attitude/GetAppliedUsers"

/*-------------用户信息查询、操作---------------*/
//查询当前登录的用户信息的路径
#define kTheLoginUserInfoPath @"api/User/Get"
//设置用户头像
#define kTheUserAvatarPath @"api/User/SetAvatar"
//删除黑名单
#define kRemoveBlackListPath @"api/User/DeleteStopedUser"
//分页查询用户数据
#define kFindUserInfoPath @"api/User/Gets"
//关键字搜索用户信息
#define kFindUserInfokeyWordPath @"api/User/Search"
//查询当前登录用户的黑名单的路径
#define kTheLoginUserBlackListPath @"api/User/GetStopedUsers"

/*-------------用户关注---------------*/
//用户关注列表路径
#define kUserFollowedPath @"api/Follow/ListFollowedUsers"
//用户粉丝列表路径
#define kUserFollowerPath @"api/Follow/ListFollowers"
//当前用户添加关注操作的路径
#define kTheUserAddFollowPath @"api/Follow/AddFollowedUser"
//当前用户取消关注路径
#define kTheUserCancelFollowPath @"api/Follow/CancelFollow"


/*-------------明星动态（微博）---------------*/
//动态详情路径
#define kStatusDetailPath @"api/Microblog/GetMicroblog"
//发布动态
#define kPublishStatusPath @"api/Microblog/CreateMicroblog"
//动态路径
#define kTheUserStatusPath @"api/Microblog/UserMicroblogs"
//删除动态
#define kDeleteTheUserStatus @"api/Microblog/Delete"


/*-------------PopMenuView--------------*/
#define kMenuHeight 230    //kScreenHeight * 0.4
#define kMenuHeightWork  150 //kScreenHeight * 0.26











//判断iphone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iphone6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iphone6+
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#define TEXT_VIEW_HEIGHT 40

#define TRAN_VIEW_WITH 30


#define TRAN_VIEW_HEIGHT 15


#endif
