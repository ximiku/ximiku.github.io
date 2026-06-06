source 'https://rubygems.org'

gem 'jekyll'

# 直接参与站点构建的核心插件
group :jekyll_plugins do
    gem 'jekyll-3rd-party-libraries'
    gem 'jekyll-cache-bust'
    gem 'jekyll-email-protect'
    gem 'jekyll-feed'
    gem 'jekyll-imagemagick'
    gem 'jekyll-jupyter-notebook'
    gem 'jekyll-link-attributes'
    gem 'jekyll-minifier'
    gem 'jekyll-regex-replace'
    gem 'jekyll-scholar'
    gem 'jekyll-sitemap'
    gem 'jekyll-socials'
    gem 'jekyll-tabs'
    gem 'jekyll-terser', :git => "https://github.com/RobertoJBeltran/jekyll-terser.git"
    gem 'jekyll-toc'
    gem 'jekyll-twitter-plugin'
    gem 'jemoji'

end

# 开发或外部数据抓取所需的依赖，不直接作为 Jekyll 插件加载
group :other_plugins do
    gem 'css_parser'
    gem 'observer'       # jekyll-scholar 需要
    gem 'ostruct'        # jekyll-twitter-plugin 需要
    # gem 'terser'         # jekyll-terser 需要
    # gem 'unicode_utils' -- 通常已随 jekyll 安装
    # gem 'webrick' -- 通常已随 jekyll 安装
end
