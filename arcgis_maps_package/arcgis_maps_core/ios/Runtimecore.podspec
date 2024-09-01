Pod::Spec::new do |spec|
  spec.name                   = 'Runtimecore'
  spec.version                = '200.5.0.4314'
  spec.ios.deployment_target  = '16.0'
  spec.summary                = 'FFI plugin for the ArcGIS Maps SDK for Flutter'
  spec.homepage               = 'https://developers.arcgis.com'
  spec.author                 = { 'Esri' => 'https://www.esri.com/' }

  spec.source                 = { :http => 'file:' + __dir__ + '/Runtimecore.xcframework.zip' }
  spec.vendored_frameworks    = 'Runtimecore.xcframework'
end
