//
//  SlideMenuListView.m
//  EachChild
//
//  Created by 虞军军 on 16/12/30.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "SlideMenuListView.h"
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height

@interface SlideMenuListView ()<UIScrollViewDelegate>
{
    UIView *_backView1;
    UIView *_backView2;
    UIPageControl *_pageControl;
}

@end

@implementation SlideMenuListView

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:_backView1];
    [self addSubview:_backView2];
}
- (void)setMenuArray:(NSMutableArray *)menuArray {
    _menuArray = menuArray;
    [self initializerWithArray:menuArray];
}

- (void)initializerWithArray:(NSMutableArray *)menuArray {
    
    _backView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 160)];
    _backView2 = [[UIView alloc] initWithFrame:CGRectMake(screen_width, 0, screen_width, 160)];
    self.delegate = self;
    self.contentSize = CGSizeMake(2*screen_width, 180);
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    
//    NSInteger itemCount = menuArray.count;
//    NSInteger page = itemCount % 10 ?(itemCount/10+1):(itemCount/10);
    //创建8个
    for (int i = 0; i < 16; i++) {
        if (i < 5) {
            CGRect frame = CGRectMake(i*screen_width/5, 0, screen_width/5, 80);
            NSString *title = [menuArray[i] objectForKey:@"title"];
            NSString *imageStr = [menuArray[i] objectForKey:@"image"];
            MenuBtnView *btnView = [[MenuBtnView alloc] initWithFrame:frame title:title imageStr:imageStr];
            btnView.tag = 10+i;
            [_backView1 addSubview:btnView];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
            [btnView addGestureRecognizer:tap];
            
        }else if(i<10){
            CGRect frame = CGRectMake((i-5)*screen_width/5, 80, screen_width/5, 80);
            NSString *title = [menuArray[i] objectForKey:@"title"];
            NSString *imageStr = [menuArray[i] objectForKey:@"image"];
            MenuBtnView *btnView = [[MenuBtnView alloc] initWithFrame:frame title:title imageStr:imageStr];
            btnView.tag = 10+i;
            [_backView1 addSubview:btnView];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
            [btnView addGestureRecognizer:tap];
        }else if(i < 15){
            CGRect frame = CGRectMake((i-10)*screen_width/5, 0, screen_width/5, 80);
            NSString *title = [menuArray[i] objectForKey:@"title"];
            NSString *imageStr = [menuArray[i] objectForKey:@"image"];
            MenuBtnView *btnView = [[MenuBtnView alloc] initWithFrame:frame title:title imageStr:imageStr];
            btnView.tag = 10+i;
            [_backView2 addSubview:btnView];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
            [btnView addGestureRecognizer:tap];
        }else{
            CGRect frame = CGRectMake((i-15)*screen_width/5, 80, screen_width/5, 80);
            NSString *title = [menuArray[i] objectForKey:@"title"];
            NSString *imageStr = [menuArray[i] objectForKey:@"image"];
            MenuBtnView *btnView = [[MenuBtnView alloc] initWithFrame:frame title:title imageStr:imageStr];
            btnView.tag = 10+i;
            [_backView2 addSubview:btnView];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
            [btnView addGestureRecognizer:tap];
        }
    }
    
    //
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(screen_width/2-20, 160, 0, 20)];
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = 2;
    _pageControl.hidesForSinglePage = YES;
    //        self.backgroundColor = [UIColor redColor];
    [self addSubview:_pageControl];
    [_pageControl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [_pageControl setPageIndicatorTintColor:[UIColor grayColor]];
    
}

-(void)OnTapBtnView:(UITapGestureRecognizer *)sender{
    NSLog(@"tag:%ld",sender.view.tag);
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW/2)/scrollViewW;
    _pageControl.currentPage = page;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
