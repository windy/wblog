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

![screenshot](https://github.com/windy/wblog/raw/master/doc/wblog.gif)


### 为什么重写 WBlog

老的 WBlog 是两年前构建的, 体验越来越差, 而个人不喜欢托管博客到其他的站点, 又没有合适的 Ruby on Rails 博客系统.

* 优先以手机用户体验为主
* 干净的评论系统
* 良好的博客语法高亮支持
* markdown, 简洁而不简单的后台
* 要独立站点

### 特色

* 自适应于所有屏幕终端, 方便微信分享与评论
* 优先考虑移动用户, 可方便使用二维码扫描与关注
* 自带评论系统, 干净而方便
* markdown 支持, 博客语法高亮, 方便技术性博客
* 开源可商用, 个性化能力超强 ( 与非独立博客相比 )

### 期望

成为 `Ruby on Rails` 下最好用的独立博客建站系统

### 本地学习

WBlog 是一个基本的博客系统, 使用它之前, 你需要准备一台 VPS 独立主机, 安装好 Ruby on Rails 与 Mongodb. 我希望你是熟悉 Ruby on Rails 的, 这样方便定制 WBlog, 现在 WBlog 还太小.

假定你有环境后, 克隆本代码. 然后与往常的 Rails 项目一样, 先安装 mongodb

  ```shell
  # Install mongodb ( see how to install it on your platform )
  # on Mac, you can install it like this:
  brew install mongodb 
  ```

配置 WBlog:

  ```shell
  bundle install
  cp config/application.yml.example config/application.yml
  cp config/mongoid.yml.example config/mongoid.yml
  ```

  根据你个人情况, 更新对应的 application.yml & mongoid.yml.

就这样, 可以尝试启动了:

  ```shell
  rails s
  ```

### 发布应用

WBlog 采用了 `mina` 作为自动化发布工具, 使用 `nginx`, `unicorn` 为相关容器.

对应的发布流程在: [WBlog 的发布流程](https://github.com/windy/wblog/wiki)

### 技术栈

* Ruby on Rails 4.1.8 / Ruby 2.0
* AngularJS
* Foundation 5
* mina
* slim
* Mongodb


## Ruby 相关开源博客推荐

* writings.io( Ruby on Rails 4.0.2 ): <https://github.com/chloerei/writings>
* jekyll( Ruby Gem, Markdown, Static ): <http://jekyllrb.com/>
* octopress( Github Pages ): <http://octopress.org/>
* middleman( Ruby Gem, Static ): <https://github.com/middleman/middleman>
* robbin_site( Padrino ): <https://github.com/robbin/robbin_site>
