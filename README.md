WBlog
=======
[![Build Status](https://travis-ci.org/windy/wblog.svg?branch=master)](https://travis-ci.org/windy/wblog)
[![Maintainability](https://api.codeclimate.com/v1/badges/545d8372a9dda70b77fe/maintainability)](https://codeclimate.com/github/windy/wblog/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/545d8372a9dda70b77fe/test_coverage)](https://codeclimate.com/github/windy/wblog/test_coverage)

The missing open source blog system on Ruby on Rails 7.x.

WBlog is open source blog which built for mobile first, it's licenced on MIT, use it for free!

~~New: WBlog is using Ruby on Rails 6.1 now.~~

New: WBlog has updated from webpacker to jsbundling & cssbundling with esbuild and sass.

New: WBlog is using Ruby on Rails 7.1 now.

[中文说明文档](/README.zh-CN.md)

Characteristic:

* Modern clean reading feelings
* Markdown support, give nice formatted articles
* Mobile first, responsive page for iPhone, iPad, iMac.
* Independent comment system, subscribe system, picture manage system

A real example comes from my own blog( Chinese ): <https://yafeilee.com>

Some [screenshots](#screenshots)

### System dependencies

* Ruby ( >= 3.1.2 )
* Postgresql ( >= 9.x )
* Nginx ( >= 1.4 )
* node ( >= 1.18 )

### Features

* Responsive, iPhone, iPad, Notebook, PC, all are supported
* QR Code, Like button make your article easily sharing with your friends
* Inpendent comment system, subscribe system, that all belong to you
* Markdown supported, code highlight, especially for programmer, like you
* Personalize it, commercialize it, it all depends on you

### Goal

Make it to the best Ruby on Rails Blog system in the world.

### Running in development mode

WBlog MUST run in Linux or OSX. I assume you are using OS X 10.

You can run it like a Ruby on Rails project as usual:

0. Check dependencies

  ```shell
  ruby -v
  # 3.1.2
  postgres  --version
  # 9.x.x
  npm -v
  # 1.18.x
  ```

1. Clone it

  `git clone git@github.com:windy/wblog.git`

  `cd wblog`

2. Install dependencies & configure

  ```shell
  # install rails dependencies
  gem install bundler
  bundle install
  # install node dependencies
  npm install yarn -g
  yarn install
  # copy and update project config file
  cp config/application.yml.example config/application.yml
  cp config/database.yml.example config/database.yml
  ```

  Update `application.yml` & `database.yml` 's content as you need, then run setup:

  ```shell
  bin/setup
  ```

3. Start it

  one command:

  ```shell
  bin/dev
  ```

  It's all.

  or using multi terminal:

  ```shell
  # rails
  bin/rails s
  ```

  ```shell
  # js compile
  bin/yarn build --watch
  ```

  ```shell
  # css compile
  bin/yarn build:css --watch
  ```

  Open browser with `http://localhost:3000`

  If there is any error found, please check your database's user and password( default is admin/admin )

4. Post the first blog

  visit: http://localhost:3000/admin, input your username and password configurated in `db/seeds.rb`.
  then, post a new article.

OK, That's all.

### Deployment

WBlog uses `mina` as automation deployment tool, uses `puma` as the Rack container.

WBlog recommends `nginx` as reverse proxy server.

It will be very fast.

Ruby on Rails project deployment is another topic, I would NOT talk it here.

You can read WBlog wiki for more information: [WBlog 的发布流程(Chinese only now)](https://github.com/windy/wblog/wiki)

### Stack

* Ruby on Rails 7.1
* Ruby 3.1.2
* Turbo
* Bootstrap 4
* mina
* slim
* puma
* Postgresql

## Related open source blog systems

* writings.io( Ruby on Rails 4.0.2 ): a multi users blog system <https://github.com/chloerei/writings>
* jekyll( Ruby Gem, Markdown): Static blog system <http://jekyllrb.com/>
* octopress( Github Pages ): <http://octopress.org/>
* middleman( Ruby Gem ): Another static blog system <https://github.com/middleman/middleman>
* robbin_site( Padrino ): <https://github.com/robbin/robbin_site>

## License

MIT.

### Screenshots

Home Page:

![screenshot home](https://github.com/windy/wblog/raw/master/doc/wblog_s_en/home.png)

Home Page for mobile:

![screenshot home small](https://github.com/windy/wblog/raw/master/doc/wblog_s_en/home-small.png)

Home Page Hover Status for mobile:

![screenshot home hover](https://github.com/windy/wblog/raw/master/doc/wblog_s_en/home-small-hover.png)

Blog Show Page:

![screenshot post](https://github.com/windy/wblog/raw/master/doc/wblog_s_en/post.png)

Blog Show Page Hover Status:

![screenshot post hover](https://github.com/windy/wblog/raw/master/doc/wblog_s_en/post-hover.png)

Admin Login Page:

![screenshot admin](https://github.com/windy/wblog/raw/master/doc/wblog_s_en/admin-login.png)

Admin Dashboard Page:

![screenshot admin](https://github.com/windy/wblog/raw/master/doc/wblog_s_en/admin-dashboard.png)

Admin New Blog Page:

![screenshot admin](https://github.com/windy/wblog/raw/master/doc/wblog_s_en/admin-post.png)

Admin Blogs Manage Page:

![screenshot admin](https://github.com/windy/wblog/raw/master/doc/wblog_s_en/admin-posts.png)
