//
//  CommonEnum.h
//  EveryMeal
//
//  Created by  liwenhao on 14-3-21.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

//<<------------------------枚--------举-------------------------->>//
typedef NS_ENUM(NSInteger, TabBarImageTags){
    ContactImageUnSelectedTag = 101,
    DealMealImageUnSelectedTag,
    ReleaseDateImageUnSelectedTag,
    MessageImageUnSelectedTag,
    SetUpImageUnSelectedTag,
    ContactImageSelectedTag = 111,
    DealMealImageSelectedTag,
    ReleaseDateImageSelectedTag,
    MessageImageSelectedTag,
    SetUpImageSelectedTag,
};

//约会的对象
typedef NS_ENUM(NSInteger,DateTarget){
    WantAll = 100,
    WantMen,
    WantWomen,
};

//约会的消费方式
typedef NS_ENUM(NSInteger,DateCostMethod){
    ITreat = 100,
    AATreat,
    YouTreat,
};
//约会状态
typedef NS_ENUM(NSInteger,DateState){
    Releaseing = 100,
    Going,
    Finished,
    Failed,
};
/*
 星 座 日期(公历) 英文名
 魔羯座 (12/22 - 1/19) Capricorn
 水瓶座 (1/20 - 2/18) Aquarius
 双鱼座 (2/19 - 3/20) Pisces
 牡羊座 (3/21 - 4/20) Aries
 金牛座 (4/21 - 5/20) Taurus
 双子座 (5/21 - 6/21) Gemini
 巨蟹座 (6/22 - 7/22) Cancer
 狮子座 (7/23 - 8/22) Leo
 处女座 (8/23 - 9/22) Virgo
 天秤座 (9/23 - 10/22) Libra
 天蝎座 (10/23 - 11/21) Scorpio
 射手座 (11/22 - 12/21) Sagittarius
 */

typedef NS_ENUM(NSInteger,ConstellationEnum){
    Capricorn,
    Aquarius,
    Pisces,
    Aries,
    Taurus,
    Gemini,
    Cancer,
    Leo,
    Virgo,
    Libra,
    Scorpio,
    Sagittarius
};
//>>------------------------枚--------举--------------------------<<//

typedef NS_ENUM(int,PersonDetailCellEnum){
    PersonReleaseDateTag=111,
    PersonAttendDateTag,
    PersonPlaceTag,
    
    PersonOccuptionTag,
    PersonIsSmokingTag,
    PersonIsDrinkingTag
};

typedef NS_ENUM (int,ServerDataBaseManagerEnum){
    PersonDetailQueryDateMealTag = 1111,
    PersonInsertDateTag,
};