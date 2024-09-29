source "https://rubygems.org"

# Jekyll 버전 지정
gem "jekyll", "~> 4.3.4"
gem "github-pages", :platforms => [:x86_64-linux]  # Linux 플랫폼 지정

# Windows 및 JRuby용 특정 플랫폼 설정
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Windows 성능 향상을 위한 wdm
gem "wdm", "~> 0.1", :platforms => [:mingw, :x64_mingw, :mswin]

# JRuby 환경에서만 특정 gem 버전 고정
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
