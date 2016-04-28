# Google Fonts 国内镜像加速（支持https）

由于国内访问google fonts较慢，所以制作了国内镜像进行加速，支持http和https。

## 使用方法

把 `//fonts.googleapis.com` 替换为 `//fonts.gmirror.org` 即可。

## 技术

 * PHP框架：[lumen](http://lumen.laravel.com/)
 * Dokcer：[php:apache](https://github.com/docker-library/docs/tree/master/php)
 * 服务器：[daocloud.io Docker容器云平台免费额度](https://account.daocloud.io/signup?invite_code=c8bkkhc1uq8i7z8nin93)
 * 云存储CDN：[七牛云存储免费额度](https://portal.qiniu.com/signup?code=3lafkpsz7yes1)
 * 备案：[阿里云免费虚拟主机免费备案服务](http://wanwang.aliyun.com/hosting/free/)

## 原理

用户请求 https://fonts.gmirror.org/css 时，后端程序会自动获取 https://fonts.googleapis.com/css 对应的内容，把其中的 fonts.gstatic.com 替换为 fonts-gstatic-com.gmirror.org（七牛），css缓存在后端服务器上，字体文件通过七牛自动拉取。

比如

[https://fonts.gmirror.org/css?family=Lato:400,700|Roboto+Slab:400,700|Inconsolata:400,700](https://fonts.gmirror.org/css?family=Lato:400,700|Roboto+Slab:400,700|Inconsolata:400,700)

和

[http://fonts.gmirror.org/css?family=Lato:400,700|Roboto+Slab:400,700|Inconsolata:400,700](http://fonts.gmirror.org/css?family=Lato:400,700|Roboto+Slab:400,700|Inconsolata:400,700)

都对应

[https://fonts.googleapis.com/css?family=Lato:400,700|Roboto+Slab:400,700|Inconsolata:400,700](http://fonts.googleapis.com/css?family=Lato:400,700|Roboto+Slab:400,700|Inconsolata:400,700)
