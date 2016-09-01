# FontAdaptation



**这里实现一种方案：以iPhone手机中的iPhone 6/6s 屏幕尺寸为基准，实现对不同型号手机的字体大小调整。**


**该设想的初衷是，方便公司开发的时候对字体大小进行统一的调整，虽然公司的设想有很多不尽人意的地方，根据公司的要求，我肯定是要做出一个方案的，详细介绍如下：**

##说明

  以iPhone 6/6s 为基准，其他尺寸型号上的字体分别按照统一的增量进行调整，以达到统一风格的目的。
  
  如，宏定义Font(17) 在不同iPhone设备上分别返回以17为基准调整后的UIFont * 对象。
  
  宏定义 FontSize(17)在不同iPhone设备上分别返回以17为基准调整后的CGFloat 值。
  

##使用方法

**将FontAdaptation.m  FontAdaptation.h拖进你的工程，在pch文件或需要的地方包含头文件FontAdaptation.h即可**
