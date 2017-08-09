# RKStatusBarHUD
非常简单实用的消息提示框架

### 使用说明
* 显示成功消息
```objc
    [RKStatusBarHUD showSucess:@"显示成功!"];
```
* 显示失败消息
```objc
    [RKStatusBarHUD showError:@"显示失败!"];
```
* 显示普通消息
```objc
    [RKStatusBarHUD showMessage:@"显示普通信息"];
```
* 显示正在加载消息
```objc
    [RKStatusBarHUD loading:@"正在加载中..."];
```
* 隐藏
```objc
    [RKStatusBarHUD hide];
```

### 更新说明
* 添加了点击控制器显示更新信息
