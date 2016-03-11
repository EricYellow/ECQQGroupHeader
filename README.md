# ECQQGroupHeader
## 模仿QQ讨论组头像，实现高清显示,Quartz Core实现!
> 实现思路有参考itlijunjie 的QQHearder,在此感谢！

## 使用方法:
- 1.导入 ` #import "UIImage+Extension.h" `
- 2.调用以下方法可以获得拼接头像:
```objc
+ (UIImage *)composeHeaderImageWithConstrainWH:(CGFloat)headerWH imagePathArray:(NSArray *)imagePathArray backgroundColor:(UIColor *)backgroundColor
```
