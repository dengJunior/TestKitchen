//
//  Const.h
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#ifndef Const_h
#define Const_h

//屏幕宽度和高度
#define kScreenW  ([[UIScreen mainScreen] bounds].size.width)
#define kScreenH  ([[UIScreen mainScreen] bounds].size.height)

#define WS(weakSelf)  __weak __typeof(&*self) weakSelf = self;

//接口
//大部分是Post请求
#define kHostUrl  (@"http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone")


//一、食谱
//1、推荐
//首页推荐参数
//methodName=SceneHome&token=&user_id=&version=4.32

//1)广告
//详情
#define kAdDetailDayUrl  (@"http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone")
//methodName=CourseSeriesView&series_id=22&token=&user_id=&version=4.32

//分享
#define kAdDetailShareUrl  (@"http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone")
//methodName=AppShare&shareID=&shareModule=course&token=&user_id=&version=4.32

//评论
#define kAdDetailCommentListUrl (@"http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone")
//methodName=CommentList&page=1&relate_id=22&size=10&token=&type=2&user_id=&version=4.32
//methodName=CommentList&page=2&relate_id=22&size=10&token=&type=2&user_id=&version=4.32

//评论发送
#define kAdDetailCommentUrl  (@"http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone")
//content=%E5%AD%A6%E4%B9%A0%E4%BA%86&methodName=CommentInsert&parent_id=0&relate_id=23&token=8ABD36C80D1639D9E81130766BE642B7&type=2&user_id=1386387&version=4.32
//content="学习了"

//2)基本类型
//新手入门

//食材搭配
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//material_ids=45%2C47&methodName=SearchMix&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//material_ids=45%2C47&methodName=SearchMix&page=2&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//场景菜谱
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=SceneList&page=1&size=18&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=SceneList&page=2&size=18&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//点击进详情
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=AppShare&shareID=105&shareModule=scene&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=SceneInfo&scene_id=105&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//再点击列表进详情

//做法
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//dishes_id=14528&methodName=DishesView&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//食材
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//dishes_id=14528&methodName=DishesMaterial&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//相关常识
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//dishes_id=14528&methodName=DishesCommensense&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//相宜相克
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//dishes_id=14528&methodName=DishesSuitable&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//评论数
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//dishes_id=14528&methodName=DishesViewnew&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//发布
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone

//收藏
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//ids=14528&methodName=UserUpdatelikes&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32
//dishes_id=14528&methodName=DishesViewnew&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//评论
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=CommentList&page=1&relate_id=14528&size=10&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32


//发送评论
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//content=%E5%AD%A6%E4%B9%A0%E4%B8%80%E4%B8%8B&methodName=CommentInsert&parent_id=0&relate_id=14528&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32

//content=@"学习一下"

//dishes_id=14528&methodName=DishesViewnew&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//上传照片
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=ShequTopic&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//activity_id=&content=%E5%BE%88%E5%A5%BD%E5%90%83&image=1457877114055_8928429596.jpg&methodName=ShequPostadd&token=8ABD36C80D1639D9E81130766BE642B7&topics=%5B%7B%22topic_id%22%3A%226%22%2C%22topic_name%22%3A%22%E4%B8%80%E4%BA%BA%E9%A3%9F%22%2C%22locx%22%3A%22160%22%2C%22locy%22%3A%22160%22%2C%22width%22%3A%22320%22%7D%5D&user_id=1386387&version=4.32&video=

//content = @“很好吃”



//猜你喜欢
//methodName=UserLikes&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//口味有变
//methodName=LbsProvince&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//baidu_city=%E6%B7%B1%E5%9C%B3%E5%B8%82&baidu_province=%E5%B9%BF%E4%B8%9C%E7%9C%81&effect=312&like=230&methodName=UserDraw&province=3&taste=316&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//点击一个标签进入搜索列表
//cat_id=252&methodName=CategorySearch&page=1&size=6&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32


//搜索
//keyword=%E6%97%A9%E9%A4%90&methodName=SearchDishes&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//keyword=早餐


//日食记

//methodName=AppShare&shareID=&shareModule=course&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//methodName=CourseSeriesView&series_id=18&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//methodName=CommentList&page=1&relate_id=18&size=10&token=8ABD36C80D1639D9E81130766BE642B7&type=2&user_id=1386387&version=4.32

//台湾食记

//methodName=AppShare&shareID=&shareModule=course&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=CourseSeriesView&series_id=12&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=CommentList&page=1&relate_id=12&size=10&token=8ABD36C80D1639D9E81130766BE642B7&type=2&user_id=1386387&version=4.32


//3)今日食谱推荐
//进列表
//methodName=AppShare&shareID=51&shareModule=scene&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=SceneInfo&scene_id=51&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//相关场景
//methodName=SceneInfo&scene_id=112&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//4)春季养生肝为先
//methodName=AppShare&shareID=127&shareModule=scene&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=SceneInfo&scene_id=127&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//5)场景菜谱
//methodName=SceneList&page=1&size=18&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//methodName=SceneInfo&scene_id=134&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32



//6)推荐达人
//methodName=TalentRecommend&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//关注
//ids=1249795&methodName=UpdateFollow&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32
//取消关注
//ids=1249795&methodName=UpdateFollow&token=8ABD36C80D1639D9E81130766BE642B7&type=0&user_id=1386387&version=4.32

//达人详情页
//


//7)精选作品
//is_marrow=1&methodName=ShequList&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//作品详情
//methodName=CommentList&page=1&relate_id=35282&size=10&token=8ABD36C80D1639D9E81130766BE642B7&type=3&user_id=1386387&version=4.32
//methodName=AppShare&shareID=35282&shareModule=shequ&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//methodName=ShequPostview&post_id=35282&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//8)美食专题
//methodName=TopicList&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32

//专题详情
//methodName=TopicView&version=1.0&user_id=1386387&topic_id=175&_time=1457878578&_signature=0ba3640c73c17441b675a7dd968a66e8


//http://h5.izhangchu.com/topic_view/index.html?&topic_id=134&user_id=1386387&token=8ABD36C80D1639D9E81130766BE642B7&app_exitpage=

//2、食材
#define kFoodHomeUrl     (@"http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone")
//methodName=MaterialSubtype&token=&user_id=&version=4.32

//详情
//material_id=62&methodName=MaterialView&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//相关菜例
//material_id=62&methodName=MaterialDishes&page=1&size=6&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//选购要诀
//营养功效
//实用百科
//material_id=62&methodName=MaterialDishes&page=2&size=6&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32




//3、分类
#define kCategoryHomeUrl (@"http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone")
//methodName=CategoryIndex&token=&user_id=&version=4.32


//进列表
//cat_id=316&methodName=CategorySearch&page=1&size=6&token=8ABD36C80D1639D9E81130766BE642B7&type=1&user_id=1386387&version=4.32

//4、搜索


//热门搜索
//methodName=SearchHot&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32

//二、社区



//推荐
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=ShequRecommend&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.33


//最新
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//last_id=0&methodName=ShequList&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32


//关注
//http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone
//methodName=ShequFollow&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32






//三、商城
//四、食课
//五、我的

//注册
//获取验证码
#define kVerifyUrl (@"http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone")
//device_id=021fc7f7528&methodName=UserLogin&mobile=13716422377&token=&user_id=&version=4.32


#define kRegisterVerUrl (@"http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone")
//code=173907&device_id=021fc7f7528&methodName=UserAuth&mobile=13716422377&token=&user_id=&version=4.32
//

//GET   :  http://182.92.228.160:80/zhangchu/onlinezhangchu/users/1386387


//注册
#define kRegisterUrl (@"http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone")

//methodName=UserPwd&nickname=sh%E6%8E%8C%E5%8E%A8&password=9745b090734f44cdd7b2ef1d88c26b1f&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
//sh掌厨   05513867720

#endif /* Const_h */








/*
 {
 "code": "0",
 "msg": "success",
 "version": "4.02",
 "timestamp": 1458706576000,
 "data": {
 "page": "1",
 "size": "10",
 "total": "24",
 "count": "10",
 "data": [
 {
 "dishes_id": "284",
 "title": "炸蛋丝滑鸡丝",
 "description": "一满口肉的幸福",
 "video": "http://video.szzhangchu.com/zhadansihuajisiA.mp4",
 "video1": "http://video.szzhangchu.com/zhadansihuajisiB.mp4",
 "image": "http://img.szzhangchu.com/1439346842558_5336238631.jpg",
 "hard_level": "容易",
 "play": "9586",
 "cooking_time": "5分钟",
 "taste": "淡",
 "create_date": 1037940567,
 "content": "当你研制成功，满满的一口鸡肉，带来的除了丰富的味觉，还有无与伦比的满足感！",
 "tags_info": [
 {
 "id": 154,
 "text": "鸡肉",
 "type": 2
 },
 {
 "id": 149,
 "text": "蛋类",
 "type": 2
 },
 {
 "id": 289,
 "text": "增强免疫力",
 "type": 2
 },
 {
 "id": 231,
 "text": "简易午餐",
 "type": 2
 },
 {
 "id": 326,
 "text": "炒",
 "type": 2
 }
 ]
 },
 {
 "dishes_id": "373",
 "title": "荷包蛋炒肉片",
 "description": "蛋除了炒饭，还可以炒肉",
 "video": "http://video.szzhangchu.com/hebaodanchaoroupianA.mp4",
 "video1": "http://video.szzhangchu.com/hebaodanchaoroupianB.mp4",
 "image": "http://img.szzhangchu.com/1439350348982_1761849919.jpg",
 "hard_level": "容易",
 "play": "18354",
 "cooking_time": "11分钟",
 "taste": "辣",
 "create_date": 1040360066,
 "content": "湘菜里辣得最低调的菜。当然，我说的是一般情况下，如果你要让它口味重起来，辣得痛快，加辣椒就对了。",
 "tags_info": [
 {
 "id": 398,
 "text": "肉类",
 "type": 2
 },
 {
 "id": 231,
 "text": "简易午餐",
 "type": 2
 },
 {
 "id": 326,
 "text": "炒",
 "type": 2
 },
 {
 "id": 294,
 "text": "保肝护肾",
 "type": 2
 },
 {
 "id": 402,
 "text": "一人食",
 "type": 2
 }
 ]
 },
 {
 "dishes_id": "561",
 "title": "剁椒荷包蛋",
 "description": "家常小菜，省时又好吃",
 "video": "http://video.szzhangchu.com/duojiaohebaodanA.mp4",
 "video1": "http://video.szzhangchu.com/duojiaohebaodanB.mp4",
 "image": "http://img.szzhangchu.com/1439460690005_5456565609.jpg",
 "hard_level": "容易",
 "play": "8201",
 "cooking_time": "10分钟",
 "taste": "辣",
 "create_date": 1045535575,
 "content": "与西红柿炒蛋，酸辣土豆丝并称屌丝三大菜好了。",
 "tags_info": [
 {
 "id": 326,
 "text": "炒",
 "type": 2
 },
 {
 "id": 149,
 "text": "蛋类",
 "type": 2
 },
 {
 "id": 260,
 "text": "湘菜",
 "type": 2
 },
 {
 "id": 319,
 "text": "辣",
 "type": 2
 },
 {
 "id": 341,
 "text": "大叔",
 "type": 2
 }
 ]
 },
 {
 "dishes_id": "911",
 "title": "辣椒炒鸡蛋",
 "description": "每个人都吃过的菜",
 "video": "http://video.szzhangchu.com/lajiaochaojidanA.mp4",
 "video1": "http://video.szzhangchu.com/lajiaochaojidanB.mp4",
 "image": "http://img.szzhangchu.com/1439360332705_2109706358.jpg",
 "hard_level": "容易",
 "play": "7640",
 "cooking_time": "3.5分钟",
 "taste": "辣",
 "create_date": 1055470225,
 "content": "在家不知道做什么菜，那就来一盘辣椒炒鸡蛋吧。分分钟搞定，而且辣椒开胃，鸡蛋营养，还有比这更划算的事吗？",
 "tags_info": [
 {
 "id": 259,
 "text": "川菜",
 "type": 2
 },
 {
 "id": 157,
 "text": "蛋类",
 "type": 2
 },
 {
 "id": 295,
 "text": "开胃消食",
 "type": 2
 },
 {
 "id": 149,
 "text": "蛋类",
 "type": 2
 },
 {
 "id": 319,
 "text": "辣",
 "type": 2
 }
 ]
 },
 {
 "dishes_id": "1609",
 "title": "大酱焖蛋",
 "description": "荷包蛋新吃法",
 "video": "http://video.szzhangchu.com/dajiangmendanA.mp4",
 "video1": "http://video.szzhangchu.com/dajiangmendanB.mp4",
 "image": "http://img.szzhangchu.com/1439361407383_3631510094.jpg",
 "hard_level": "容易",
 "play": "1641",
 "cooking_time": "10分钟",
 "taste": "辣",
 "create_date": 1074406337,
 "content": "有着青红椒粒的油亮浓稠酱汁，浇在煎好的荷包蛋上，居然吃出了焖一般入味的感觉。",
 "tags_info": [
 {
 "id": 296,
 "text": "益气补血",
 "type": 2
 },
 {
 "id": 231,
 "text": "简易午餐",
 "type": 2
 },
 {
 "id": 149,
 "text": "蛋类",
 "type": 2
 },
 {
 "id": 157,
 "text": "蛋类",
 "type": 2
 },
 {
 "id": 319,
 "text": "辣",
 "type": 2
 }
 ]
 },
 {
 "dishes_id": "1932",
 "title": "时蔬海鲜炒饭",
 "description": "口口都是鲜香，天天都有好心情",
 "video": "http://video.szzhangchu.com/shishuhaixianchaofanA.mp4",
 "video1": "http://video.szzhangchu.com/shishuhaixianchaofanB.mp4",
 "image": "http://img.szzhangchu.com/dish_20130603181347281.jpg",
 "hard_level": "一般",
 "play": "754",
 "cooking_time": "4分钟",
 "taste": "咸",
 "create_date": 1083555269,
 "content": "多种美味食材跟米饭一起快炒，米饭炒的松散咸香，配上各种海鲜跟蔬菜，鲜香爽脆好吃加倍。",
 "tags_info": [
 {
 "id": 320,
 "text": "咸",
 "type": 2
 },
 {
 "id": 167,
 "text": "虾",
 "type": 2
 },
 {
 "id": 326,
 "text": "炒",
 "type": 2
 },
 {
 "id": 289,
 "text": "增强免疫力",
 "type": 2
 },
 {
 "id": 234,
 "text": "宵夜",
 "type": 2
 }
 ]
 },
 {
 "dishes_id": "5293",
 "title": "子龙脱袍",
 "description": "一道有故事的美味菜",
 "video": "http://video.szzhangchu.com/zilongtuopaoA.mp4",
 "video1": "http://video.szzhangchu.com/zilongtuopaoB.mp4",
 "image": "http://img.szzhangchu.com/dish_20131206172823682.jpg",
 "hard_level": "较难",
 "play": "535",
 "cooking_time": "1分30秒",
 "taste": "辣",
 "create_date": 1177472966,
 "content": "子龙脱袍是一道以鳝鱼为主料湖南菜，色泽艳丽，咸香而鲜，滑嫩适口，切简单好写，还不快来试试。",
 "tags_info": [
 {
 "id": 126,
 "text": "河鲜海鲜",
 "type": 2
 },
 {
 "id": 326,
 "text": "炒",
 "type": 2
 },
 {
 "id": 165,
 "text": "淡水鱼",
 "type": 2
 },
 {
 "id": 319,
 "text": "辣",
 "type": 2
 },
 {
 "id": 296,
 "text": "益气补血",
 "type": 2
 }
 ]
 },
 {
 "dishes_id": "7355",
 "title": "蜀香鸡",
 "description": "川菜里的经典佳肴",
 "video": "http://video.szzhangchu.com/shuxiangjiA.mp4",
 "video1": "http://video.szzhangchu.com/shuxiangjiB.mp4",
 "image": "http://img.szzhangchu.com/1439468465191_1124536063.JPG",
 "hard_level": "一般",
 "play": "4813",
 "cooking_time": "1分30秒",
 "taste": "辣",
 "create_date": 1235114996,
 "content": "蜀香鸡，顾名思义，属于川菜菜系里的菜肴。麻麻辣辣的口感，嚼着很有劲的鸡肉，给舌尖一个爽刺激。",
 "tags_info": [
 {
 "id": 157,
 "text": "蛋类",
 "type": 2
 },
 {
 "id": 306,
 "text": "益智健脑",
 "type": 2
 },
 {
 "id": 326,
 "text": "炒",
 "type": 2
 },
 {
 "id": 319,
 "text": "辣",
 "type": 2
 },
 {
 "id": 259,
 "text": "川菜",
 "type": 2
 }
 ]
 },
 {
 "dishes_id": "8157",
 "title": "青椒酿肉",
 "description": "“酿”出好胃口",
 "video": "http://video.szzhangchu.com/qingjiaoniangrouA.mp4",
 "video1": "http://video.szzhangchu.com/qingjiaoniangrouB.mp4",
 "image": "http://img.szzhangchu.com/1439971575948_3449378228.JPG",
 "hard_level": "一般",
 "play": "825",
 "cooking_time": "4分30秒",
 "taste": "鲜",
 "create_date": 1257566812,
 "content": "酿是客家人最喜欢的做菜方法，而这道菜更是其中的经典。鲜香的肉馅中渗透进丝丝的辣味，让人回味无穷，是不是想一想都觉得很有食欲？",
 "tags_info": [
 {
 "id": 295,
 "text": "开胃消食",
 "type": 2
 },
 {
 "id": 149,
 "text": "蛋类",
 "type": 2
 },
 {
 "id": 329,
 "text": "煎",
 "type": 2
 }
 ]
 },
 {
 "dishes_id": "8322",
 "title": "脆皮茄汁豆腐",
 "description": "好香，好滑，好怕吃撑",
 "video": "http://video.szzhangchu.com/cuipiqiezhidoufuA.mp4",
 "video1": "http://video.szzhangchu.com/cuipiqiezhidoufuB.mp4",
 "image": "http://img.szzhangchu.com/1439972569832_6338675840.JPG",
 "hard_level": "容易",
 "play": "2835",
 "cooking_time": "7分钟",
 "taste": "鲜",
 "create_date": 1262152327,
 "content": "一般在家烹饪豆腐，要么是红烧，要么是做豆腐鱼汤，今天教你做茄汁豆腐，它脆爽十足，不要贪吃喔。",
 "tags_info": [
 {
 "id": 149,
 "text": "蛋类",
 "type": 2
 },
 {
 "id": 146,
 "text": "豆制品",
 "type": 2
 },
 {
 "id": 295,
 "text": "开胃消食",
 "type": 2
 },
 {
 "id": 326,
 "text": "炒",
 "type": 2
 },
 {
 "id": 162,
 "text": "豆制品",
 "type": 2
 }
 ]
 }
 ]
 }
 }
 */



/*
 {
 "code": "0",
 "msg": "success",
 "version": "4.0",
 "timestamp": 1458709670000,
 "data": {
 "nutrition_analysis": "鸡肉富含蛋白质、磷、铁、铜、锌，并且含有较多的不饱和脂肪酸，能够降低对人体健康不利的低密度脂蛋白胆固醇。鸡胸肉中含有较多的B族维生素，具有恢复体力、保护皮肤的作用。",
 "production_direction": "在炸蛋丝时应掌握好火候，一边搅动蛋液，一边慢慢倒入已烧至三四成热的油锅中，这样炸出来的蛋丝口感更佳，入口即化。",
 "image": "http://img.szzhangchu.com/1439643177463_8570501229.jpg"
 }
 }
 */



/*
 {
 "code": "0",
 "msg": "success",
 "version": "4.0",
 "timestamp": 1458709670000,
 "data": {
 "material_image": "http://img.szzhangchu.com/ylzt_20130326141622920.jpg",
 "material": [
 {
 "material_name": "鸡胸肉",
 "material_weight": "200克"
 },
 {
 "material_name": "韭黄",
 "material_weight": "50克"
 },
 {
 "material_name": "鸡蛋",
 "material_weight": "1个"
 },
 {
 "material_name": "青、红椒",
 "material_weight": "各30克"
 },
 {
 "material_name": "胡萝卜",
 "material_weight": "30克"
 },
 {
 "material_name": "姜丝、蒜末",
 "material_weight": "各少许"
 },
 {
 "material_name": "盐、味精、水淀粉、料酒",
 "material_weight": "各适量"
 }
 ],
 "spices": [
 {
 "title": "料酒",
 "image": "http://img.szzhangchu.com/1439278701254_6067208209.jpg"
 },
 {
 "title": "盐",
 "image": "http://img.szzhangchu.com/1446302300109_3829074140.jpg"
 },
 {
 "title": "水淀粉",
 "image": "http://img.szzhangchu.com/1439279768833_9900185974.jpg"
 },
 {
 "title": "味精",
 "image": "http://img.szzhangchu.com/1439280540438_7294148969.jpg"
 }
 ]
 }
 }
 */


/*
 {
 "code": "0",
 "msg": "success",
 "version": "4.0",
 "timestamp": 1458709670000,
 "data": {
 "material": {
 "material_id": "488",
 "material_name": "鸡肉",
 "image": "http://img.szzhangchu.com/1439643177463_8570501229.jpg",
 "suitable_not_with": [
 {
 "material_id": "11",
 "material_name": "芥菜",
 "type": "1",
 "suitable_desc": "影响身体健康",
 "image": "http://img.szzhangchu.com/1445499190435_2475364438.jpg"
 },
 {
 "material_id": "126",
 "material_name": "兔肉",
 "type": "1",
 "suitable_desc": "引起腹泻",
 "image": "http://img.szzhangchu.com/1439709913031_9193562813.jpg"
 },
 {
 "material_id": "143",
 "material_name": "鲤鱼",
 "type": "1",
 "suitable_desc": "引起中毒",
 "image": "http://img.szzhangchu.com/1440139026476_2416522890.jpg"
 },
 {
 "material_id": "322",
 "material_name": "菊花",
 "type": "1",
 "suitable_desc": "引起痢疾",
 "image": "http://img.szzhangchu.com/1439805098171_6104840610.jpg"
 },
 {
 "material_id": "386",
 "material_name": "李子",
 "type": "1",
 "suitable_desc": "引起痢疾",
 "image": "http://img.szzhangchu.com/1439714592288_2059439641.jpg"
 }
 ],
 "suitable_with": [
 {
 "material_id": "34",
 "material_name": "花菜",
 "type": "0",
 "suitable_desc": "益气壮骨",
 "image": "http://img.szzhangchu.com/20150418105815428.jpg"
 },
 {
 "material_id": "54",
 "material_name": "冬瓜",
 "type": "0",
 "suitable_desc": "排毒养颜",
 "image": "http://img.szzhangchu.com/20141107105916743.jpg"
 },
 {
 "material_id": "63",
 "material_name": "丝瓜",
 "type": "0",
 "suitable_desc": "清热利肠",
 "image": "http://img.szzhangchu.com/20141107110435278.jpg"
 },
 {
 "material_id": "78",
 "material_name": "红豆",
 "type": "0",
 "suitable_desc": "提供丰富的营养",
 "image": "http://img.szzhangchu.com/2014110710293271.jpg"
 },
 {
 "material_id": "89",
 "material_name": "黑木耳",
 "type": "0",
 "suitable_desc": "降压降脂",
 "image": "http://img.szzhangchu.com/20141107165143482.jpg"
 },
 {
 "material_id": "94",
 "material_name": "金针菇",
 "type": "0",
 "suitable_desc": "增强记忆力",
 "image": "http://img.szzhangchu.com/20150413101613115.jpg"
 },
 {
 "material_id": "189",
 "material_name": "柠檬",
 "type": "0",
 "suitable_desc": "增强食欲",
 "image": "http://img.szzhangchu.com/2015041311022581.jpg"
 },
 {
 "material_id": "204",
 "material_name": "板栗",
 "type": "0",
 "suitable_desc": "增强造血功能",
 "image": "http://img.szzhangchu.com/20150518163238610.jpg"
 },
 {
 "material_id": "205",
 "material_name": "枸杞",
 "type": "0",
 "suitable_desc": "补五脏、益气血",
 "image": "http://img.szzhangchu.com/20150418190147278.jpg"
 },
 {
 "material_id": "313",
 "material_name": "人参",
 "type": "0",
 "suitable_desc": "止渴生津",
 "image": "http://img.szzhangchu.com/20141110102410239.jpg"
 },
 {
 "material_id": "684",
 "material_name": "青辣椒",
 "type": "0",
 "suitable_desc": "开胃消食",
 "image": "http://img.szzhangchu.com/1439643526442_5826595074.jpg"
 },
 {
 "material_id": "687",
 "material_name": "绿豆芽",
 "type": "0",
 "suitable_desc": "降低心血管疾病发病率",
 "image": "http://img.szzhangchu.com/1439717823484_6511749223.jpg"
 }
 ]
 }
 }
 }
 */


/*
 {
 "code": "0",
 "msg": "success",
 "version": "4.1",
 "timestamp": 1458709670000,
 "data": {
 "dashes_id": "284",
 "dashes_name": "炸蛋丝滑鸡丝",
 "material_video": "http://video.szzhangchu.com/zhadansihuajisiA.mp4",
 "process_video": "http://video.szzhangchu.com/zhadansihuajisiB.mp4",
 "hard_level": "容易",
 "taste": "淡",
 "cooke_time": "5分钟",
 "image": "http://img.szzhangchu.com/1439346842558_5336238631.jpg",
 "material_desc": "当你研制成功，满满的一口鸡肉，带来的除了丰富的味觉，还有无与伦比的满足感！",
 "share_amount": "0",
 "dishes_name": "炸蛋丝滑鸡丝",
 "dishes_title": "一满口肉的幸福",
 "dishes_id": "284",
 "cooking_time": "5分钟",
 "comment_count": "2",
 "agreement_amount": "562",
 "tags_info": [
 {
 "id": 154,
 "text": "鸡肉",
 "type": 2
 },
 {
 "id": 149,
 "text": "蛋类",
 "type": 2
 },
 {
 "id": 289,
 "text": "增强免疫力",
 "type": 2
 },
 {
 "id": 231,
 "text": "简易午餐",
 "type": 2
 },
 {
 "id": 326,
 "text": "炒",
 "type": 2
 }
 ],
 "share_url": "http://h5.izhangchu.com/web/dishes_view/index.html?&dishes_id=284",
 "step": [
 {
 "dishes_step_id": "1807",
 "dishes_id": "284",
 "dishes_step_order": "1",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_0.jpg",
 "dishes_step_desc": "将洗净的韭黄切段。"
 },
 {
 "dishes_step_id": "1808",
 "dishes_id": "284",
 "dishes_step_order": "2",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_1.jpg",
 "dishes_step_desc": "洗好的青椒切丝。"
 },
 {
 "dishes_step_id": "1809",
 "dishes_id": "284",
 "dishes_step_order": "3",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_2.jpg",
 "dishes_step_desc": "洗净的红椒切丝。"
 },
 {
 "dishes_step_id": "1810",
 "dishes_id": "284",
 "dishes_step_order": "4",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_3.jpg",
 "dishes_step_desc": "去皮洗净的胡萝卜切丝。"
 },
 {
 "dishes_step_id": "1811",
 "dishes_id": "284",
 "dishes_step_order": "5",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_4.jpg",
 "dishes_step_desc": "洗好的鸡胸肉切丝。"
 },
 {
 "dishes_step_id": "1812",
 "dishes_id": "284",
 "dishes_step_order": "6",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_5.jpg",
 "dishes_step_desc": "将鸡蛋打入碗中。"
 },
 {
 "dishes_step_id": "1813",
 "dishes_id": "284",
 "dishes_step_order": "7",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_6.jpg",
 "dishes_step_desc": "用打蛋器将鸡蛋打散备用。"
 },
 {
 "dishes_step_id": "1814",
 "dishes_id": "284",
 "dishes_step_order": "8",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_7.jpg",
 "dishes_step_desc": "鸡肉加盐、味精拌匀，加水淀粉拌匀，倒入食用油腌渍10分钟。"
 },
 {
 "dishes_step_id": "1815",
 "dishes_id": "284",
 "dishes_step_order": "9",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_8.jpg",
 "dishes_step_desc": "锅中加清水，放入胡萝卜。"
 },
 {
 "dishes_step_id": "1816",
 "dishes_id": "284",
 "dishes_step_order": "10",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_9.jpg",
 "dishes_step_desc": "煮沸后捞出。"
 },
 {
 "dishes_step_id": "1817",
 "dishes_id": "284",
 "dishes_step_order": "11",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_10.jpg",
 "dishes_step_desc": "用油起锅，烧至三四成热，边倒入蛋液边搅散，炸成蛋丝，捞出备用。"
 },
 {
 "dishes_step_id": "1818",
 "dishes_id": "284",
 "dishes_step_order": "12",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_11.jpg",
 "dishes_step_desc": "倒入肉丝，滑油片刻捞出。"
 },
 {
 "dishes_step_id": "1819",
 "dishes_id": "284",
 "dishes_step_order": "13",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_12.jpg",
 "dishes_step_desc": "锅留底油，放入姜丝、蒜末、青红椒丝、胡萝卜丝炒匀。"
 },
 {
 "dishes_step_id": "1820",
 "dishes_id": "284",
 "dishes_step_order": "14",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_13.jpg",
 "dishes_step_desc": "加鸡肉、盐、味精、料酒，翻炒入味。"
 },
 {
 "dishes_step_id": "1821",
 "dishes_id": "284",
 "dishes_step_order": "15",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_14.jpg",
 "dishes_step_desc": "倒入韭黄翻炒。"
 },
 {
 "dishes_step_id": "1822",
 "dishes_id": "284",
 "dishes_step_order": "16",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_15.jpg",
 "dishes_step_desc": "加水淀粉炒匀，盛入盘中。"
 },
 {
 "dishes_step_id": "1823",
 "dishes_id": "284",
 "dishes_step_order": "17",
 "dishes_step_image": "http://img.szzhangchu.com/20130326141622_16.jpg",
 "dishes_step_desc": "再将炸好的蛋丝倒入盘内即可。"
 }
 ],
 "like": 0,
 "extra": []
 }
 }
 */
