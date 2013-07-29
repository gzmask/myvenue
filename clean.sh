gem list | cut -d" " -f1 | xargs gem uninstall -aIx
gem update --system 1.8.25
gem install rails -v=2.3.4  --no-ri --no-rdoc
gem install thin -v=1.5.1 --no-ri --no-rdoc
gem install rack -v=1.0.0 --no-ri --no-rdoc
gem install rdoc --no-ri --no-rdoc 
gem install sqlite3-ruby --no-ri --no-rdoc
gem install feedtools --no-ri --no-rdoc
