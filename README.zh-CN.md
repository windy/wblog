WBlog
=======
[![Build Status](https://travis-ci.org/windy/wblog.svg?branch=master)](https://travis-ci.org/windy/wblog)
[![Code Climate](https://codeclimate.com/github/windy/wblog.png)](https://codeclimate.com/github/windy/wblog)
[![Test Coverage](https://codeclimate.com/github/windy/wblog/coverage.png)](https://codeclimate.com/github/windy/wblog)

为移动而生的 Ruby on Rails 开源博客. WBlog 基于 MIT 协议, 自由使用.

* 用户极为友好的阅读体验
* 自带干净的评论系统
* 简洁而不简单的发布博客流程

访问我的博客以体验: <http://yafeilee.me>

后台禁止爬虫, 使用: <http://yafeilee.me/admin> 访问, 用户名密码可配置.

截图如下: <#screenshots>


### WBlog 的设计目标

* 优先以手机用户体验为主
* 独立干净的评论系统
* 良好的博客语法高亮支持
* 可邮件订阅
* Markdown 支持
* 尽可能独立

### 特色

* 优先支持移动端访问
* 响应式设计, 支持所有屏幕终端, 并且支持微信扫码继续阅读和分享
* 自带评论系统, 干净而方便
* Markdown 支持, 博客语法高亮, 方便技术性博客
* 开源可商用, 定制能力强

### 期望

成为 `Ruby on Rails` 下最好用的独立博客建站系统

### 开发环境

WBlog 是一个标准的 Ruby on Rails 应用. 开发环境依赖于:

* Ruby ( = 2.3.1 )
* Postgresql ( >= 9.x )

配置 WBlog:

  ```shell
  gem install bundler
  bundle install
  cp config/application.yml.example config/application.yml
  cp config/database.yml.example config/database.yml
  ```

  更新对应配置: application.yml & database.yml.

  对于配置有不明白的地方, 可以来这里咨询.

就这样, 可以尝试启动了:

  ```shell
  rails s
  ```

登录 http://localhsot:3000/admin 来发布第一篇博客.

### 发布应用

WBlog 采用了 `mina` 作为自动化发布工具, 使用 `nginx`, `puma` 为相关容器.

对应的发布流程在: [WBlog 的发布流程](https://github.com/windy/wblog/wiki)

### 技术栈

* Ruby on Rails 5.0.0
* Ruby 2.3.1
* Foundation 6
* mina
* slim
* Postgresql


## Ruby 相关开源博客推荐

* writings.io( Ruby on Rails 4.0.2 ): <https://github.com/chloerei/writings>
* jekyll( Ruby Gem, Markdown, Static ): <http://jekyllrb.com/>
* octopress( Github Pages ): <http://octopress.org/>
* middleman( Ruby Gem, Static ): <https://github.com/middleman/middleman>
* robbin_site( Padrino ): <https://github.com/robbin/robbin_site>

### Screenshots

首页:

![screenshot home](https://github.com/windy/wblog/raw/master/doc/wblog_s/home.png)

小屏首页:

![screenshot home small](https://github.com/windy/wblog/raw/master/doc/wblog_s/home-small.png)

展开的小屏首页:

![screenshot home hover](https://github.com/windy/wblog/raw/master/doc/wblog_s/home-small-hover.png)

博客详情页:

![screenshot post](https://github.com/windy/wblog/raw/master/doc/wblog_s/post.png)

展开的博客详情页:

![screenshot post hover](https://github.com/windy/wblog/raw/master/doc/wblog_s/post-hover.png)

管理员登录页:

![screenshot admin](https://github.com/windy/wblog/raw/master/doc/wblog_s/admin-login.png)

管理页面板:

![screenshot admin](https://github.com/windy/wblog/raw/master/doc/wblog_s/admin-dashboard.png)

发布新博客页:

![screenshot admin](https://github.com/windy/wblog/raw/master/doc/wblog_s/admin-post.png)

博客管理页:

![screenshot admin](https://github.com/windy/wblog/raw/master/doc/wblog_s/admin-posts.png)
