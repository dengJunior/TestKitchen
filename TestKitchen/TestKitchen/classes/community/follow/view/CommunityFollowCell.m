//
//  CommunityFollowCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommunityFollowCell.h"
#import "CommunityNewsModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"


@implementation CommunityFollowCell

- (void)setModel:(CommunityNewsDetailModel *)model
{
    _model = model;
    
    //图片
    [self.topImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    //内容
    //评论文字
    NSScanner *scanner = [NSScanner scannerWithString:model.content];
    
    NSString *tmpStr = nil;
    NSMutableString *result = [NSMutableString string];
    while (!scanner.isAtEnd) {
        [scanner scanUpToString:@">" intoString:nil];
        [scanner scanUpToString:@"<" intoString:&tmpStr];
        
        if (tmpStr.length > 1) {
            [result appendString:[tmpStr substringFromIndex:1]];
        }
    }
    self.contentLabel.text = result;
    
    //用户
    [self.userBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.head_img] forState:UIControlStateNormal];
    self.nameLabel.text = model.nick;
    self.timeLabel.text = model.create_time;
    
    //其他用户
    for (int i=0; i<model.like.count; i++) {
        CommunityNewsLikeModel *likeModel = model.like[i];
        UIButton *btn = (UIButton *)[self.contentView viewWithTag:200+i];
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:likeModel.head_img] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 24;
        btn.layer.masksToBounds = YES;
    }

    
    //评论的文字
    //先删除之前的
    [self.commentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat h = 0;
    if (model.comment.count > 0) {
        
        CGFloat num = model.comment.count;
        if (num > 3) {
            num = 3;
        }
        
        //循环显示文字
        for (int i=0; i<num; i++) {
            
            CommunityNewsCommentModel *commentModel = model.comment[i];
            
            NSString *text = [NSString stringWithFormat:@"%@:%@",commentModel.nick, commentModel.content];
            //判断是否是回复
            NSString *anotherNick = nil;
            if (commentModel.parents.count > 0) {
                CommunityNewsCommentModel *aModel = [commentModel.parents firstObject];
                anotherNick = aModel.nick;
                text = [NSString stringWithFormat:@"%@回复%@",aModel.nick, text];
            }
            
            //富文本
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
            NSRange rang1 = [text rangeOfString:commentModel.nick];
            if (rang1.location != NSNotFound) {
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:rang1];
            }
            if (anotherNick) {
                NSRange rang2 = [text rangeOfString:anotherNick];
                if (rang2.location != NSNotFound) {
                    [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:rang2];
                }
            }
            
            
            //计算高度
            CGFloat labelH = [text boundingRectWithSize:CGSizeMake(kScreenW-20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
            UILabel *label = [KTCUtil createLabelText:nil font:[UIFont systemFontOfSize:16] textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft];
            label.frame = CGRectMake(10, h, kScreenW-20, labelH);
            label.attributedText = str;
            [self.commentView addSubview:label];
            
            h += labelH;
            
        }
        
        
        
    }
    
    //判断是否有更多
    if (model.comment_count.intValue > 3) {
        
        
        NSString *str = [NSString stringWithFormat:@"更多厨友热评(%@)",model.comment_count];
        UILabel *label = [KTCUtil createLabelText:nil font:[UIFont systemFontOfSize:16] textColor:[UIColor blueColor] textAlignment:NSTextAlignmentLeft];
        label.frame = CGRectMake(10, h, 160, 20);
        NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:str attributes:@{NSForegroundColorAttributeName:[UIColor blueColor],NSUnderlineStyleAttributeName:@2}];
        label.attributedText = attStr;
        [self.commentView addSubview:label];
        
        
        //点击事件
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickMore)];
        [label addGestureRecognizer:g];
        
        h += 20;
    }
    if (h > 0) {
        h += 10;
    }
    
    
    //评论的视图
    self.commentViewHCons.constant = h;
    

    
    //浏览
    self.agreeLabel.text = model.agree_count;
    //评论
    self.commentLabel.text = model.comment_count;
}


- (void)clickMore
{}

+(CGFloat)heightWithModel:(CommunityNewsDetailModel *)model
{
    CGFloat h = 0;
    //循环计算文字的高度
    for (int i=0; i<model.comment.count; i++) {
        
        CommunityNewsCommentModel *comModel = model.comment[i];
        NSString *str = [NSString stringWithFormat:@"%@:%@",comModel.nick, comModel.content];
        if (comModel.parents.count > 0) {
            CommunityNewsCommentModel *parentModel = [comModel.parents firstObject];
            str = [NSString stringWithFormat:@"%@回复%@", parentModel.nick,str];
        }
        
        CGFloat tmpH = [str boundingRectWithSize:CGSizeMake(kScreenW-20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
        h += tmpH;
        
    }
    
    //是否有更多
    if (model.comment_count.intValue > 3) {
        h += 20;
    }
    if (h > 0) {
        //间距
        h += 10;
    }
    
    return 460+h;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)clickUserBtn:(id)sender {
    
    if (self.userBlock) {
        self.userBlock(self.model.user_id);
    }
}

- (IBAction)clickBtn:(UIButton *)sender {
    NSInteger index = sender.tag-200;
    
    CommunityNewsLikeModel *likeModel = self.model.like[index];
    
    if (self.userBlock) {
        self.userBlock(likeModel.user_id);
    }
}
@end
