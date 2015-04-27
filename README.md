WBlog
=======
[![Build Status](https://travis-ci.org/windy/wblog.svg?branch=master)](https://travis-ci.org/windy/wblog)
[![Code Climate](https://codeclimate.com/github/windy/wblog.png)](https://codeclimate.com/github/windy/wblog)
[![Test Coverage](https://codeclimate.com/github/windy/wblog/coverage.png)](https://codeclimate.com/github/windy/wblog)

The missing open source blog system on Ruby on Rails.

WBlog is open source blog which built for mobile first, it's licenced on MIT, use it for free!

[中文说明文档](/README.zh-CN.md)

Characteristic:

* Awful reading feeling for reader
* Inpendent comment system, store data on your own sever
* With mardown support, you can post powerful and clean articles

A demo came from my English blog: <http://en.yafeilee.me>

Power Admin Dashboard: <http://en.yafeilee.me/admin>, user and password are configurable.

![screenshot](https://github.com/windy/wblog/raw/master/doc/wblog.gif)


### Features

* Responsive, iPhone, iPad, Notebook, PC, all are supported
* QR Code attached article, scan and share it
* Inpendent comment system, managed by yourself
* Markdown supported, code highlight, especially for programmer, like you
* Personalize it, commercialize it, it all depends on you

### Goal

Make it to the best Ruby on Rails Blog system in the world.

### Study it locally

WBlog MUST run in Linux or Mac, it depends on Mongodb database. You can run it like a Ruby on Rails project as usual:

1. Clone it

  `git clone git@github.com:windy/wblog.git`
  `cd wblog `

2. Install dependencies & configure

  ```shell
  # Install mongodb ( see how to install it on your platform )
  # on Mac, you can install it like this:
  brew install mongodb 
  ```

  ```shell
  bundle install
  cp config/application.yml.example config/application.yml
  cp config/mongoid.yml.example config/mongoid.yml
  ```

  Update application.yml & mongoid.yml as you need

3. Start it

  ```shell
  rails s
  ```

  If there is any error found, please check your database's user and password.

4. Post the first article

  visit: http://127.0.0.1:3000/admin, input your username and password that is just configurated in application.yml.
  then, post a new article.

OK, That's all.

### Deployment

WBlog uses `mina` as automation deployment tool, uses `unicorn` as the Rack container.

WBlog recommends `nginx` as reverse proxy server.

It will be very fast.

Ruby on Rails project deployment is another big topic, I would NOT talk it here.

You can see WBlog wiki for more reading: [WBlog 的发布流程(Chinese only now)](https://github.com/windy/wblog/wiki)

### Stack

* Ruby on Rails 4.1.9 / Ruby 2
* AngularJS
* Foundation 5
* mina
* slim
* Mongodb


## Related open source blog systems

* writings.io( Ruby on Rails 4.0.2 ): a multi users blog system <https://github.com/chloerei/writings>
* jekyll( Ruby Gem, Markdown): Static blog system <http://jekyllrb.com/>
* octopress( Github Pages ): <http://octopress.org/>
* middleman( Ruby Gem ): Another static blog system <https://github.com/middleman/middleman>
* robbin_site( Padrino ): <https://github.com/robbin/robbin_site>
