Pod::Spec.new do |s|

  s.name         = "CZFTool"
  s.version      = "0.0.2"
  s.summary      = "图片处理，时间处理，加密等功能"

  s.description  = "CZFTool is a function normal use, you will fast your work."

  s.homepage     = "https://github.com/MacleChen/CZFTool"
  s.screenshots  = "http://oh6xiseuf.bkt.clouddn.com/CZFTool_001.PNG", "http://oh6xiseuf.bkt.clouddn.com/CZFTool_002.PNG", "http://oh6xiseuf.bkt.clouddn.com/CZFTool_003.PNG"


  s.license      = { :type => "MIT", :file => "LICENSE" }



  s.author             = { "MacleChen" => "851327579@qq.com" }
  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/MacleChen/CZFTool.git", :tag => "#{s.version}" }



  s.source_files  = "CZFTool", "CZFTool/*.{h,m}"

end
