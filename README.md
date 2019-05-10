
[![travelpayouts](https://www.travelpayouts.com/powered_by/img/tp.png)](http://whitelabel.travelpayouts.com/)


Automation for travelpayouts.com using Ruby, Watir, Cucumber

Behavior Driven Development (BDD) approach to write automation test scripts.  

Getting Started
-------------
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

Prerequisites
--------------  
[Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) - Getting Started - Installing Git  
[Watir](http://watir.com/guides/) - Watir Guides  
[Ruby](http://watir.com/guides/ruby/) - Installing Ruby  
[Chrome Driver](https://sites.google.com/a/chromium.org/chromedriver/) - Chrome driver  
[RVM](https://rvm.io/rvm/install) - Ruby enVironment (Version) Manager    

How to install this project
-------------
git clone https://github.com/Pavelya/travelpayouts.git  
bundle install  

How to manage chrome driver
-------------

1. Download the ChromeDriver executable
2. Edit /etc/paths with chromedriver path

Full instruction can be found there (external side, can't garanty if avalible 100%):  
[Here](https://www.kenst.com/2015/03/including-the-chromedriver-location-in-macos-system-path/) - Including the ChromeDriver location in MacOS System PATH 
 

How to manage enable / disable headless chrome
-------------
1. Open features/support/env.rb 
2. Update chrome launch option: 

@browser = Watir::Browser.new :chrome, headless: true / false
For more information, visit Watir documentation: 
http://watir.com/guides/chrome/#headless

Running the tests - command line mode
-------------------
cd to project path  

cucumber features/%feature_file%.feature

Authors
-------------
**Pavel Yampolsky**  - Skype: pavel.yampolsky.willhill Email: 2pavelya@gmail.com

License
-------------
Automation framework is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.  
Test content is owned by: travelpayouts.com  



