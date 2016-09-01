# FontAdaptation



**这里实现一种方案：以iPhone手机中的iPhone 6/6s 屏幕尺寸为基准，实现对不同型号手机的字体大小调整。**


**该设想的初衷是，方便公司开发的时候对字体大小进行统一的调整，虽然公司的设想有很多不尽人意的地方，根据公司的要求，我肯定是要做出一个方案的，详细介绍如下：**

##说明

    以iPhone 6/6s 为基准，其他尺寸型号上的字体分别按照统一的增量进行调整，以达到统一风格的目的。
    如，宏定义Font(17) 在不同iPhone设备上分别返回以17为基准调整后的UIFont * 对象。
    宏定义 FontSize(17)在不同iPhone设备上分别返回以17为基准调整后的CGFloat 值。
  

##使用方法

**先将FontAdaptation.m 和 FontAdaptation.h文件拖进你的工程，在pch文件或需要的地方包含头文件FontAdaptation.h**

###第一步，设置增量

**在FontAdaptation.h文件中修改宏定义，设置增量(以iPhone6 / 6s为基准)，如：**

**设置5.5inch屏幕增量为4.7inch屏幕字体的size＋2;**

**4.0inch屏幕为4.7inch屏幕字体size－2;**

**3.5inch屏幕为4.7inch屏幕字体size -2。**

    #define FONT_INCREMENT_IPH6P  ( 2)
    #define FONT_INCREMENT_IPH5   (-2)
    #define FONT_INCREMENT_IPH4   (-2)
    
    
###第二步，使用

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake:(0,100,100,30)];

    label.text = @"Hello world !";

    label.font = Font(14);
    //同样的你也可以使用size值
    label.font ＝ [UIFont systemFontOfSize:FontSize(17)];


##后话

*即使你的公司不需要做适配，将增量都改成0，使用Font(x)也能稍稍减少你的代码书写量。
*该设想也有不合理之处，我和在另一家公司工作的一起讨论了一下，小伙伴表示，设计大屏幕是为了显示更多的信息，如果根据屏幕尺寸改变而改变字体的大小，那么屏幕尺寸变大的优势就没有了。本来plus一行可以比5s多显示10个文字的信息，经过这样处理，10文字的信息就丢失在视野中了。
*下一版本将实现字体大小按照屏幕大小改变的比例来变化，虽然依然保留着同样的诟病，但还是留给需要的童鞋。
