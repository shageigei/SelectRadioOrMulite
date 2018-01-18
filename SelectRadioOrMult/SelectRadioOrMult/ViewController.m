//
//  ViewController.m
//  SelectRadioOrMult
//
//  Created by lang on 2018/1/10.
//  Copyright © 2018年 lang. All rights reserved.
//

#import "ViewController.h"
#import "UIView+DBExtension.h"

#define appHeight [UIScreen mainScreen].bounds.size.height
#define appWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray * selectBtnsArray;//多选时，所选择的按钮

@property (nonatomic, strong) NSMutableArray *markArray;    //按钮个数
@property (nonatomic, strong) UIButton *tempBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configMultiselectUI];
    [self configRadioBtnUI];
    // Do any additional setup after loading the view, typically from a nib.
}
//多选
- (void)configMultiselectUI{
    
    NSArray * btnTitle = @[@"1",@"2",@"3",@"4",@"5"];
    
    UIView *bgView = [[UIView alloc] initWithFrame:(CGRect){0,100,appWidth,130}];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    CGFloat marginX = 15;
    CGFloat top = 19;
    CGFloat btnH = 35;
    CGFloat marginH = 40;
    //    CGFloat height = 130;
    CGFloat width = (appWidth - marginX * 4) / 3;
    
    //创建按钮
    NSInteger maxCol = 3;
    for (NSInteger i = 0; i < 5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor orangeColor];
        btn.layer.cornerRadius = 3.f;
        btn.clipsToBounds = YES;
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:14.f];
        [btn setTitleColor:[UIColor colorWithRed:102/255.f green:102/255.f blue:102/255.f alpha:1.0] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(choseMark:) forControlEvents:UIControlEventTouchUpInside];
        NSInteger col = i % maxCol;
        btn.x = marginX + col * (width + marginX);
        NSInteger row = i / maxCol;
        btn.y = top + row * (btnH + marginX);
        btn.width = width;
        btn.height = btnH;
        [btn setTitle:btnTitle[i] forState:UIControlStateNormal];
        [bgView addSubview:btn];
    }
    
    
    UIButton *surebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [surebtn setTitle:@"确定" forState:UIControlStateNormal];
    surebtn.frame = CGRectMake(marginX * 2, CGRectGetMaxY(bgView.frame) + marginH, appWidth - marginX * 4, 40);
    surebtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [surebtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    surebtn.backgroundColor = [UIColor orangeColor];
    surebtn.layer.cornerRadius = 3.0;
    surebtn.clipsToBounds = YES;
    //    [self.view addSubview:surebtn];
    
}

// 设置单选视图
-(void)configRadioBtnUI {
    CGFloat UI_View_Width = [UIScreen mainScreen].bounds.size.width;
    CGFloat marginX = 15;
    CGFloat top = 100;
    CGFloat btnH = 30;
    CGFloat width = (250 - marginX * 4) / 3;
    // 按钮背景
    UIView *btnsBgView = [[UIView alloc] initWithFrame:CGRectMake((UI_View_Width - 250) * 0.5, 250, 250, self.markArray.count *btnH + self.markArray.count/3 * (btnH + marginX))];
    btnsBgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnsBgView];
    // 循环创建按钮
    NSInteger maxCol = 3;
    for (NSInteger i = 0; i < self.markArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor orangeColor];
        btn.layer.cornerRadius = 3.0; // 按钮的边框弧度
        btn.clipsToBounds = YES;
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [btn setTitleColor:[UIColor colorWithRed:(102)/255.0 green:(102)/255.0 blue:(102)/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(chooseRadioMark:) forControlEvents:UIControlEventTouchUpInside];
        NSInteger col = i % maxCol; //列
        btn.x = marginX + col * (width + marginX);
        NSInteger row = i / maxCol; //行
        btn.y = top + row * (btnH + marginX);
        btn.width = width;
        btn.height = btnH;
        [btn setTitle:self.markArray[i] forState:UIControlStateNormal];
        [btnsBgView addSubview:btn];
        btn.tag = i;
    }
    
}


//多按钮选择
- (void)choseMark:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.isSelected) {
        sender.backgroundColor = [UIColor redColor];
        [self.selectBtnsArray addObject:sender.titleLabel.text];
    }else{
        sender.backgroundColor = [UIColor orangeColor];
        [self.selectBtnsArray removeObject:sender.titleLabel.text];
    }
    
    NSLog(@"选择的按钮：%@",self.selectBtnsArray);
}

- (void)chooseRadioMark:(UIButton *)sender{
    sender.backgroundColor = [UIColor redColor];
    _tempBtn.backgroundColor = [UIColor orangeColor];
    if (_tempBtn == sender){
        sender.selected = YES;
        sender.backgroundColor = [UIColor redColor];
    }else if (_tempBtn != sender){
        _tempBtn.selected = NO;
        sender.selected = YES;
        _tempBtn = sender;
    }
    NSLog(@"所选按钮 %ld",(long)sender.tag);
}

- (void)sureBtnClick{
    
}


- (NSMutableArray *)selectBtnsArray{
    if (_selectBtnsArray == nil) {
        _selectBtnsArray = [NSMutableArray new];
    }
    return _selectBtnsArray;
}

- (NSMutableArray *)markArray{
    if (_markArray == nil) {
        _markArray = [NSMutableArray new];
        [_markArray addObjectsFromArray:@[@"1",@"2",@"3",@"4",@"5",@"6"]];
    }
    return _markArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
