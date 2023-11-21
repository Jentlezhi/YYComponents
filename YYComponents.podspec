Pod::Spec.new do |s|
  s.name             = 'YYComponents'
  s.version          = '0.1.1'
  s.summary          = 'A collection of iOS components.'
  s.homepage         = 'https://github.com/Jentlezhi'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jentle' => 'juntaozhi@163.com' }
  s.source           = { :git => 'https://github.com/Jentlezhi/YYComponents', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'YYComponents/YYComponents.h'
  
  #基础
  s.subspec 'Base' do |ss|
    ss.subspec 'Macro' do |sss|
        sss.source_files = 'YYComponents/Base/Macro/*.h'
    end
  end
  
  #分类
  s.subspec 'Categories' do |ss|
    ss.subspec 'Foundation' do |sss|
        sss.source_files = 'YYComponents/Categories/Foundation/*.{h,m}'
    end
    
    ss.subspec 'UIKit' do |sss|
        sss.source_files = 'YYComponents/Categories/UIKit/*.{h,m}'
    end
  end
  
  #UI组件
  s.subspec 'UIComponents' do |ss|
    ss.subspec 'ScrollViewDataSet' do |sss|
        sss.source_files = 'YYComponents/UIComponents/ScrollViewDataSet/*.{h,m}'
    end
  end
##
#  s.subspec 'Categories/UIKit' do |ss|
#    ss.source_files = 'YYComponents/Categories/UIKit/*.{h,m}'
#  end

end

