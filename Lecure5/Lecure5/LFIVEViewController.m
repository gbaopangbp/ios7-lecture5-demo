//
//  LFIVEViewController.m
//  Lecure5
//
//  Created by tirostiros on 14-12-16.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import "LFIVEViewController.h"

@interface LFIVEViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textBody;

@end

@implementation LFIVEViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //每次显示view都先设置一下系统字体
    [self setSettingFont];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerNotify:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:UIContentSizeCategoryDidChangeNotification];
}

-(void)registerNotify:(NSNotification*)info
{
//    [self.textBody.textStorage set]
    NSLog(@"registerNotify %@",info);
    [self setSettingFont];
}

- (IBAction)changeColor:(id)sender
{
    UIButton * button = (UIButton*)sender;
//    [self.textBody.textStorage setAttributes:@{@NSForegroundColorAttributeName,[UIColor greenColor]} range:self.textBody.selectedRange];
    [self.textBody.textStorage setAttributes:@{NSForegroundColorAttributeName : button.backgroundColor,
                                  NSFontAttributeName : [UIFont systemFontOfSize:17]} range:self.textBody.selectedRange];
}

-(void)setSettingFont
{
    self.textBody.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (IBAction)outLine:(id)sender
{
    [self.textBody.textStorage setAttributes:@{NSStrokeWidthAttributeName : @-3,NSStrokeColorAttributeName:[UIColor redColor]} range:self.textBody.selectedRange];
}
- (IBAction)noOutLine:(id)sender
{
    [self.textBody.textStorage setAttributes:@{NSStrokeWidthAttributeName : @0,NSStrokeColorAttributeName:[UIColor blackColor]} range:self.textBody.selectedRange];

}

@end
